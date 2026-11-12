<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Événements</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <nav>
        <a href="evenement.jsp">Événements</a>
        <a href="connexion.jsp">Connexion</a>
    </nav>

    <h1>Liste des événements</h1>
    <p>Consultez les événements disponibles et inscrivez-vous.</p>

    <div class="events">

        <div class="event">
            <h2>Nvidia Conference</h2>
            <p>Date : 20 novembre 2026</p>
            <p>Lieu : Salle A1</p>
            <p>Places disponibles : 22</p>
            <button>S'inscrire</button>
        </div>

        <div class="event">
            <h2>Introduction to Rust</h2>
            <p>Date : 25 novembre 2026</p>
            <p>Lieu : Amphithéâtre</p>
            <p>Places disponibles : 40 </p>
            <button>S'inscrire</button>
        </div>

    </div>

</body>
</html>
