<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pageLogin.css">
</head>
<body>

    <main class="login">
        <form action ="${pageContext.request.contextPath}/login" method = "post" id="loginForm">
        <h1>Login</h1>
        <p>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </p>
        <p>
            <label for="password">Mot de passe</label>
            <input type="password" id="password" name="password" required>
        </p>

        <button type="submit">Se connecter</button>
        </form>
    </main>

</body>
</html>
