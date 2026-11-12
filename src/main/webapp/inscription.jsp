<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pageInscription.css">
</head>
<body>

    <nav>
        <a href="evenement.jsp">Événements</a>
        <a href="connexion.jsp">Connexion</a>
        <a href="inscription.jsp">Inscription</a>
    </nav>

    <main>
        <h1>Créer un compte</h1>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <p>
            <label for="nom">Nom</label>
            <input type="text" id="nom" name="nom" required>
            </p>

            <p>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
            </p>
            <p>
            <label for="password">Mot de passe</label>
            <input type="password" id="password" name="password" required>
            </p>
            <p>
            <label for="confirmation">Confirmer le mot de passe</label>
            <input type="password" id="confirmation" name="confirmation" required>
            </p>
            <button type="submit">Créer un compte</button>

            <p>Déjà inscrit ? <a href="connexion.jsp">Se connecter</a></p>

        </form>
    </main>

</body>
</html>
