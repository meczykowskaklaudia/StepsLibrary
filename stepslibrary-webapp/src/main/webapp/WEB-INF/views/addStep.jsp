<% response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE HTML>
<html lang="pl">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>Dancehall steps library</title>
</head>
<body>
<form:form method="POST" modelAttribute="stepDto">
    <em>Please, fill in the information: </em>
    <table>
        <tbody>
        <tr>
            <td>Name:</td>
            <td><form:input type="text" path="name"/><c:if test="${pageContext.request.method=='POST'}"><form:errors
                    path="name"/></c:if></td>
        </tr>
        <tr>
            <td>Creator:</td>
            <td><form:input type="text" path="creator"/><c:if test="${pageContext.request.method=='POST'}"><form:errors
                    path="creator"/></c:if></td>
        </tr>
        <tr>
            <td>Date of creation:</td>
            <td><form:input type="text" path="creationDate"/><c:if
                    test="${pageContext.request.method=='POST'}"><form:errors path="creationDate"/></c:if></td>
        </tr>
        <tr>
            <td>Difficulty level:</td>
            <td><form:input type="text" path="difficultyLevel"/><c:if
                    test="${pageContext.request.method=='POST'}"><form:errors path="difficultyLevel"/></c:if></td>
        </tr>
        </tbody>
    </table>
    <input type="submit" value="Add!"/>
</form:form>
<br/>
<a href="<c:url value="library" />">Go back to the library</a>
</body>
</html>