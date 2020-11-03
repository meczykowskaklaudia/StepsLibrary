<% response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE HTML>
<html lang="pl">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Dancehall steps library</title>
</head>
<body style="max-width: 600px; margin: auto;">
<h4>Please, fill in the information: </h4>
<form:form method="POST" modelAttribute="stepDto">
    <div class="form-group">
        <label for="name">Name: </label>
        <form:input type="text" class="form-control" placeholder="Name" path="name"/><c:if
            test="${pageContext.request.method=='POST'}"><form:errors
            path="name"/></c:if>
    </div>
    <div class="form-group">
        <label for="creator">Creator:</label>
        <form:input type="text" class="form-control" placeholder="Creator" path="creator"/><c:if
            test="${pageContext.request.method=='POST'}"><form:errors
            path="creator"/></c:if>
    </div>
    <div class="form-group">
        <label for="creationDate">Date of creation:</label>
        <form:input type="date" class="form-control" placeholder="Creation date" path="creationDate"/><c:if
            test="${pageContext.request.method=='POST'}"><form:errors path="creationDate"/></c:if>
    </div>
    <div class="form-group">
        <label for="difficultyLevel">Difficulty level:</label>
        <form:input type="number" step="0.1" min="0" max="10" class="form-control" placeholder="Difficulty level"
                    path="difficultyLevel"/><c:if
            test="${pageContext.request.method=='POST'}"><form:errors path="difficultyLevel"/></c:if>
    </div>
    <button type="submit" class="btn btn-outline-primary">Add!</button>
</form:form><br/>
<a class="btn btn-outline-primary btn-sm" href="<c:url value="library" />" role="button">Go back to the library</a>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
</body>
</html>