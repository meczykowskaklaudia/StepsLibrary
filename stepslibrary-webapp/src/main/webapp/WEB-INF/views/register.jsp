<% response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<em>Creating a new account!</em>
<em>Please, fill in the information: </em>
<form:form method="POST" modelAttribute="userDto">
    <label>Username:</label>
    <form:input type="text" path="username"/><c:if test="${pageContext.request.method=='POST'}"><form:errors
        path="username"/></c:if>
    <label>Password:</label>
    <form:input type="text" path="password"/><c:if test="${pageContext.request.method=='POST'}"><form:errors
        path="password"/></c:if><br/>
    <input type="submit" value="Create new account!"/>
</form:form><br/>
<a href="<c:url value="library" />">Go back to the library</a>
</body>
</html>