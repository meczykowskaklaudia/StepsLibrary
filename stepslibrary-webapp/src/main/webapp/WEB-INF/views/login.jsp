<% response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="pl">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>Dancehall steps library</title>
</head>
<body>
<c:if test="${not empty message}">
    <div style="color:red"><em>${message}</em></div>
</c:if>
<c:set var="loginUrl"><c:url value="/login"/></c:set>
<form method="POST" action="${loginUrl}">
    <em>Please, fill in the information: </em>
    <table>
        <tbody>
        <tr>
            <td>Username:</td>
            <td>
                <label>
                    <input type="text" name="username"/>
                </label>
            </td>
        </tr>
        <tr>
            <td>Password:</td>
            <td>
                <label>
                    <input type="text" name="password"/>
                </label>
            </td>
        </tr>
        </tbody>
    </table>
    <input type="submit" value="Log in"/>
</form>
</body>
</html>