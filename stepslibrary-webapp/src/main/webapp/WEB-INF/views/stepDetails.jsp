<% response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="pl">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>Dancehall steps library</title>
</head>
<body>
<em>${step.name} by ${step.creator}</em><br/>
Created on: <fmt:formatDate pattern="yyyy-MM" value="${step.creationDate}"/><br/>
Difficulty level: ${step.difficultyLevel}<br/><br/>
<c:if test="${not empty sources}">
    <em>Sources:</em><br/>
    <c:forEach varStatus="loop" var="source" items="${sources}">
        <table>
            <tr>
                <td>${source.url}</td>
                <td>
                    <c:url var="deleteUrl" value="step-${step.id}/delete-source"/>
                    <form:form action="${deleteUrl}" method="POST">
                        <input type="hidden" name="sourceId" value="${source.id}">
                        <input type="submit" value="Delete" onClick="return confirm('Sure?')">
                    </form:form>
                </td>
            </tr>
        </table>
    </c:forEach>
</c:if>
<a href="<c:url value="step-${step.id}/add-source" />">Add an existing source</a><br/><br/>
<a href="<c:url value="library" />">Go back to the library</a>
</body>
</html>