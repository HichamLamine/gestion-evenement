<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="fr_FR"/>
<fmt:parseDate value="${event.date}" pattern="yyyy-MM-dd" var="parsedDate"/>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title><c:out value="${event.title}"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <nav>
        <a href="${pageContext.request.contextPath}/events">Événements</a>
        <a href="${pageContext.request.contextPath}/connexion">Connexion</a>
    </nav>

    <h1><c:out value="${event.title}"/></h1>

    <div class="event">
        <p>Date : <fmt:formatDate value="${parsedDate}" pattern="EEEE d MMMM yyyy"/></p>
        <p>Lieu : <c:out value="${event.location}"/></p>
        <p>Capacité : ${event.capacity}</p>

        <form action="${pageContext.request.contextPath}/inscription" method="get">
            <input type="hidden" name="eventId" value="${event.id}">
            <button type="submit">S'inscrire</button>
        </form>
    </div>

    <p><a href="${pageContext.request.contextPath}/events">Retour aux événements</a></p>

</body>
</html>
