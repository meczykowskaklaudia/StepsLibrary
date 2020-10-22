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
<base href="http://localhost:8080/stepslibrary/"/>
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
    <br/>
</c:if>

<em>Please, fill in the information: </em>
<form:form method="POST" modelAttribute="sourceDto">
    <label>Source URL:</label>
    <form:input type="url" path="url"/><c:if test="${pageContext.request.method=='POST'}"><form:errors
        path="url"/></c:if>
    <label>Comments (optional):</label>
    <form:input type="comment" path="comment"/><c:if
        test="${pageContext.request.method=='POST'}"><form:errors
        path="comment"/></c:if>
    <input type="submit" value="Add!"/>
</form:form><br/><br/>
<a href="<c:url value="library" />">Go back to the library</a><br/><br/>
</body>
</html>