<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%----- Bootstrap CSS ----%>
<link rel="stylesheet" type="text/css" th:href="@{/webjars/bootstrap/css/bootstrap.min.css}"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Create a Review</title>
</head>
<body>
<h1>Create an Review</h1>
<form action="reviwscreate" method="post">
    <p>

    <div class="input-group mb-3">
        <span for="username" class="input-group-text" id="inputGroup-sizing-default">UserName</span>
        <input  id="username" name="username" value="" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
    </div>

    </p>
    <p>
    <div class="input-group mb-3">
        <span for="user-review" class="input-group-text" id="inputGroup-sizing-default">Email</span>
        <input  id="user-review" name="email" value="" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
    </div>
    </p>
    <p>
    <div class="input-group mb-3">
        <span for="rating" class="input-group-text" id="inputGroup-sizing-default">Password</span>
        <input  id="rating" name="password" value="" type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
    </div>

    </p>
    <p>
        <button type="submit" class="btn btn-outline-primary" name="button">Submit</button>
    </p>
</form>
<br/><br/>
<p>
    <span id="successMessage"><b>${messages.success}</b></span>
</p>
</body>
</html>