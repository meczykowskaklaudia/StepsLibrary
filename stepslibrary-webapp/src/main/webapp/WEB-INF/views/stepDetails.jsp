<% response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html lang="pl">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>Dancehall steps library</title>
    <style>
        <%@include file="../css/style.css" %>
    </style>
</head>
<body>
<em>${step.name} by ${step.creator}</em><br/>
Created on: <fmt:formatDate pattern="yyyy-MM" value="${step.creationDate}"/><br/>
Difficulty level: ${step.difficultyLevel}<br/><br/>

<c:if test="${not empty sources}">
    <em>Sources</em>:
    <table>
        <c:forEach varStatus="loop" var="source" items="${sources}">
            <c:url var="deleteUrl" value="step-${step.id}?delete=${source.id}"/>
            <form:form action="${deleteUrl}" method="POST">
                <tr>
                    <td>${source.url}</td>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <td><input type="submit" value="Delete" onClick="return confirm('Sure?')"></td>
                    </sec:authorize>
                </tr>
            </form:form>
        </c:forEach>
    </table>
</c:if>
<a href="<c:url value="step-${step.id}/add-source" />">Add an existing source</a><br/><br/>
<a href="<c:url value="library" />">Go back to the library</a><br/><br/>
</body>
</html>