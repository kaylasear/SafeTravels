<%--Webpage to create an account--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="./css/main.css" rel="stylesheet" type="text/css">
    <%----- Bootstrap CSS ----%>
    <link rel="stylesheet" type="text/css" th:href="@{/webjars/bootstrap/css/bootstrap.min.css}"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Create Account</title>
</head>
<%----- Navigation Bar ----%>
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="d-flex flex-grow-1">
          <span class="w-100 d-lg-none d-block">
              <!-- hidden spacer to center brand on mobile --></span>
            <a class="navbar-brand d-none d-lg-inline-block" href="index.jsp"> Home </a>
            <a class="navbar-brand-two mx-auto d-lg-none d-inline-block" href="#">
                <img src="//placehold.it/40?text=LOGO" alt="logo">
            </a>
            <div class="w-100 text-right">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#myNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </div>
        <div class="collapse navbar-collapse flex-grow-1 text-right" id="myNavbar">
            <ul class="navbar-nav ms-auto flex-nowrap">
                <li class="nav-item">
                    <a href="FindLocations.jsp" class="nav-link m-2 menu-item nav-active">Search</a>
                </li>
                <li class="nav-item">
                    <a href="UserCreate.jsp" class="nav-link m-2 menu-item">Sign Up</a>
                </li>
                <li class="nav-item">
                    <a href="ReviewsCreate.jsp" class="nav-link m-2 menu-item">Create a Review</a>
                </li>
                <li class="nav-item">
                    <a href="WishListCreate.jsp" class="nav-link m-2 menu-item">Wishlist</a>
                </li>
                <li class="nav-item">
                    <a href="About.jsp" class="nav-link m-2 menu-item">About</a>
                </li>
            </ul>

        </div>
    </nav>
</div>
<%--End Navigation Bar--%>
<body>
<%--<h1>Safe Travels</h1>--%>
<form action="usercreate" method="post">
    <p>

        <div class="input-group mb-3">
            <span for="username" class="input-group-text" id="inputGroup-sizing-default">Username</span>
            <input  id="username" name="username" value="" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>

    </p>
    <p>
        <div class="input-group mb-3">
            <span for="email" class="input-group-text" id="inputGroup-sizing-default">Email</span>
            <input  id="email" name="email" value="" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
    </p>
    <p>
        <div class="input-group mb-3">
            <span for="password" class="input-group-text" id="inputGroup-sizing-default">Password</span>
            <input  id="password" name="password" value="" type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" size="20">
        </div>

    </p>
    <p>
    <div class="input-group mb-3">
        <span for="password2" class="input-group-text" id="inputGroup-sizing-default">Re-Type Password</span>
        <input  id="password2" name="password2" value="" type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" size="20">
    </div>

    </p>
    <p>
        <button type="submit" class="btn btn-outline-primary" name="button">Create an Account</button>
    </p>
</form>
<br/><br/>
<p>
    <span id="successMessage"><b>${messages.success}</b></span>
</p>
</body>
</html>