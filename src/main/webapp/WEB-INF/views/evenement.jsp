<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="fr_FR"/>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Événements</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <nav>
        <a href="${pageContext.request.contextPath}/events">Événements</a>
        <a href="${pageContext.request.contextPath}/connexion">Connexion</a>
    </nav>

    <h1>Liste des événements</h1>
    <p>Consultez les événements disponibles et inscrivez-vous.</p>

    <div class="events">
        <c:choose>
            <c:when test="${empty events}">
                <p>Aucun événement pour le moment.</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="event" items="${events}">
                    <fmt:parseDate value="${event.date}" pattern="yyyy-MM-dd" var="parsedDate"/>
                    <div class="event">
                        <h2>
                            <a href="${pageContext.request.contextPath}/events?id=${event.id}">
                                <c:out value="${event.title}"/>
                            </a>
                        </h2>
                        <p>Date : <fmt:formatDate value="${parsedDate}" pattern="d MMMM yyyy"/></p>
                        <p>Lieu : <c:out value="${event.location}"/></p>
                        <p>Capacité : ${event.capacity}</p>
                        <form action="${pageContext.request.contextPath}/inscription" method="get">
                            <input type="hidden" name="eventId" value="${event.id}">
                            <button type="submit">S'inscrire</button>
                        </form>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>
