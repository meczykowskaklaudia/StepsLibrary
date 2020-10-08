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
<em>Welcome to the dancehall steps library!</em><br/>
<table>
    <thead>
    <tr>
        <th></th>
        <th>Step name</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach varStatus="loop" var="step" items="${steps}">
        <tr>
            <th style="width: 30px">${step.id}</th>
            <td><a href="<c:url value="step-${step.id}" />">${step.name}</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br/>
<a href="<c:url value="add" />">Add a new step!</a>
</body>
</html>