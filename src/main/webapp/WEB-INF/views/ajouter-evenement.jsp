<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un événement</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pageAjouterEvenement.css">
</head>
<body>

    <nav>
        <a href="evenement.jsp">Événements</a>
        <a href="ajouter-evenement.jsp">Ajouter un événement</a>
        <a href="connexion.jsp">Connexion</a>
    </nav>

    <main>
        <h1>Ajouter un événement</h1>

        <form action="${pageContext.request.contextPath}/ajouter-evenement" method="post">

            <label for="nom">Nom de l'événement</label>
            <input type="text" id="nom" name="nom" required>

            <label for="description">Description</label>
            <textarea id="description" name="description" rows="4" required></textarea>

            <label for="date">Date et heure</label>
            <input type="datetime-local" id="date" name="date" required>

            <label for="lieu">Lieu</label>
            <input type="text" id="lieu" name="lieu" required>

            <label for="places">Nombre de places</label>
            <input type="number" id="places" name="places" min="1" required>

            <button type="submit">Ajouter l'événement</button>

        </form>
    </main>

</body>
</html>
