<% response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html lang="pl">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Dancehall steps library</title>
</head>
<body style="max-width: 600px; margin: auto;">
<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
    <h3>Hello <sec:authentication property="principal.username"/>!<a style="float: right;"
                                                                     class="btn btn-outline-primary btn-sm"
                                                                     href="<c:url value="logout" />" role="button">Log
        out</a><a style="float: right;"
                  class="btn btn-outline-primary btn-sm"
                  href="<c:url value="deleteAccount" />" onClick="return confirm('Sure?')" role="button">Delete
        account</a></h3>
</sec:authorize>

<h4>Welcome to the dancehall steps library!</h4><br/>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Step</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <c:forEach varStatus="loop" var="step" items="${steps}">
        <c:url var="deleteUrl" value="?delete=${step.id}"/>
        <form:form action="${deleteUrl}" method="POST">
            <tr>
                <td><a href="<c:url value="step-${step.id}" />">${step.name}</a></td>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <td>
                        <button type="submit" onClick="return confirm('Sure?')" class="btn btn-outline-danger">Delete
                        </button>
                    </td>
                </sec:authorize>
            </tr>
        </form:form>
    </c:forEach>
</table>
<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
    <a class="btn btn-outline-primary" href="<c:url value="add" />" role="button">Add a new step!</a><br/><br/>
</sec:authorize><br/>

<sec:authorize access="hasAnyRole('ROLE_ANONYMOUS')">
    <a class="btn btn-outline-success" href="<c:url value="login" />" role="button">Log in</a>
</sec:authorize>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
</body>
</html>