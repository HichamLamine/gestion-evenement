{
  description = "JEE event management: JDK + Maven + Tomcat + jdtls";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    # JDK used to run Maven, Tomcat and jdtls.
    # pom.xml can still target a lower level (maven.compiler.release = 17).
    jdk = pkgs.jdk21;

    tomcat = pkgs.tomcat10;

    # Compile and package the WAR
    app-build = pkgs.writeShellScriptBin "app-build" ''
      set -euo pipefail
      cd "$PRJ_ROOT"
      mvn -DskipTests clean package "$@"
    '';

    # Build, then copy the WAR into the project-local Tomcat base (.tomcat/).
    # Safe to run while Tomcat is running: it hot-redeploys the new WAR.
    app-deploy = pkgs.writeShellScriptBin "app-deploy" ''
      set -euo pipefail
      cd "$PRJ_ROOT"
      ${app-build}/bin/app-build

      war=$(find target -maxdepth 1 -name '*.war' | head -n1)
      if [ -z "$war" ]; then
        echo "No .war in target/ (check <packaging>war</packaging> in pom.xml)" >&2
        exit 1
      fi

      mkdir -p "$CATALINA_BASE"/{logs,temp,webapps,work}
      if [ ! -d "$CATALINA_BASE/conf" ]; then
        cp -r --no-preserve=mode "$CATALINA_HOME/conf" "$CATALINA_BASE/conf"
      fi

      # CONTEXT=ROOT serves the app at /, CONTEXT=events serves it at /events
      ctx="''${CONTEXT:-ROOT}"
      rm -rf "$CATALINA_BASE/webapps/$ctx"
      cp "$war" "$CATALINA_BASE/webapps/$ctx.war"
      echo "Deployed $war as /$ctx"
    '';

    # Build, deploy, then run Tomcat in the foreground (Ctrl+C to stop)
    app-run = pkgs.writeShellScriptBin "app-run" ''
      set -euo pipefail
      ${app-deploy}/bin/app-deploy
      echo "Tomcat starting on http://localhost:8080 (Ctrl+C to stop)"
      exec "$CATALINA_HOME/bin/catalina.sh" run
    '';

    # Dev mode: start Tomcat in the background, then rebuild and redeploy
    # every time something in src/ or pom.xml changes. Ctrl+C stops both.
    app-dev = pkgs.writeShellScriptBin "app-dev" ''
      set -euo pipefail
      ${app-deploy}/bin/app-deploy

      "$CATALINA_HOME/bin/catalina.sh" run &
      tomcat_pid=$!
      trap 'kill "$tomcat_pid" 2>/dev/null || true' EXIT INT TERM

      cd "$PRJ_ROOT"
      echo "Watching src/ and pom.xml, Ctrl+C to stop"
      ${pkgs.watchexec}/bin/watchexec \
        --watch src --watch pom.xml --debounce 500ms \
        -- ${app-deploy}/bin/app-deploy
    '';
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        jdk
        pkgs.maven
        tomcat
        pkgs.jdt-language-server # binary: jdtls
        app-build
        app-deploy
        app-run
        app-dev
      ];

      JAVA_HOME = "${jdk.home}";
      CATALINA_HOME = "${tomcat}";

      shellHook = ''
        export PRJ_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
        export CATALINA_BASE="$PRJ_ROOT/.tomcat"
        echo "JEE shell ready:"
        echo "  app-build   compile and package the WAR"
        echo "  app-deploy  build and copy the WAR into Tomcat (hot redeploy)"
        echo "  app-run     build, deploy and start Tomcat on :8080"
        echo "  app-dev     like app-run, but redeploys on every change in src/"
        echo "  jdtls       Java language server (point your editor at it)"
      '';
    };
  };
}
