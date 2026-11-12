<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mes inscriptions</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pageMesInscription.css">
</head>
<body>

    <nav>
        <a href="evenement.jsp">Événements</a>
        <a href="mes-inscriptions.jsp">Mes inscriptions</a>
        <a href="connexion.jsp">Connexion</a>
    </nav>

    <h1>Mes inscriptions</h1>
    <p>Voici les événements auxquels vous êtes inscrit.</p>

    <table>
        <tr>
            <th>Événement</th>
            <th>Date</th>
            <th>Lieu</th>
            <th>Action</th>
        </tr>

        <tr>
            <td>Nvidia Conference</td>
            <td>20/11/2026</td>
            <td>Salle A1</td>
            <td>
                <button type="button">Annuler</button>
            </td>
        </tr>

        <tr>
            <td>Introduction to Rust</td>
            <td>25/11/2026</td>
            <td>Amphithéâtre</td>
            <td>
                <button type="button">Annuler</button>
            </td>
        </tr>
    </table>

</body>
</html>
