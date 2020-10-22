<% response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
    <em>Hello <sec:authentication property="principal.username"/>!</em><br/>
</sec:authorize>

<em>Welcome to the dancehall steps library!</em><br/><br/>
<em>Steps:</em>
<table>
    <c:forEach varStatus="loop" var="step" items="${steps}">
        <c:url var="deleteUrl" value="?delete=${step.id}"/>
        <form:form action="${deleteUrl}" method="POST">
            <tr>
                <td><a href="<c:url value="step-${step.id}" />">${step.name}</a></td>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <td><input type="submit" value="Delete" onClick="return confirm('Sure?')"></td>
                </sec:authorize>
            </tr>
        </form:form>
    </c:forEach>
</table>
<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
    <a href="<c:url value="add" />">Add a new step!</a><br/><br/>
    <a href="<c:url value="logout" />">Log out</a>
</sec:authorize><br/>

<sec:authorize access="hasAnyRole('ROLE_ANONYMOUS')">
    <a href="<c:url value="login" />">Log in</a>
</sec:authorize>
</body>
</html>