<% response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html lang="pl">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Dancehall steps library</title>
</head>
<body style="max-width: 600px; margin: auto;">
<h4>${step.name} by ${step.creator}</h4>
Created on: <fmt:formatDate pattern="yyyy-MM" value="${step.creationDate}"/><br/>
Difficulty level: ${step.difficultyLevel}<br/><br/>

<c:if test="${not empty sources}">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Source</th>
            <th scope="col"></th>
        </tr>
        <c:forEach varStatus="loop" var="source" items="${sources}">
            <c:url var="deleteUrl" value="step-${step.id}?delete=${source.id}"/>
        <form:form action="${deleteUrl}" method="POST">
        <tr>
            <td>${source.url}</td>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <td>
                    <button type="submit" onClick="return confirm('Sure?')" class="btn btn-outline-danger">Delete
                    </button>
                </td>
            </sec:authorize>
        </tr>
        </form:form>
        </c:forEach>
    </table>
</c:if>
<a class="btn btn-outline-primary" href="<c:url value="step-${step.id}/add-source" />">Add an existing
    source</a><br/><br/>
<a class="btn btn-outline-primary btn-sm" href="<c:url value="library" />" role="button">Go back to the library</a>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
</body>
</html>