<% response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8"); %>
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
<c:if test="${not empty message}">
    <div style="color:red"><em>${message}</em></div>
</c:if>
<em>To log in, fill in the information: </em>
<form method="POST" action="login">
    <label>Username:</label>
    <input type="text" name="username"/>

    <label>Password:</label>
    <input type="text" name="password"/>

    <input type="submit" value="Log in"/>
</form>
<br/>Don't have an account yet?<br/>
<a href="<c:url value="register" />">Create a new account!</a><br/><br/>
<a href="<c:url value="library" />">Go back to the library</a>
</body>
</html>