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

    <title>Safe Travels</title>
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
                        <a href="reviewscreate" class="nav-link m-2 menu-item">Create a Review</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link m-2 menu-item dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Wishlist
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item " href="WishListCreate.jsp">Create Wishlist</a>
                            <a class="dropdown-item" href="WishListDelete.jsp">Delete Wishlist</a>
                        </div>
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
<div class="container-fluid">
    <form action="cities" method="post">
        <h1>Search for Covid-19 data by location</h1>
        <p>
            <label for="location">Enter a State, County or City</label>
            <input id="location" name="location" value="${fn:escapeXml(param.location)}">
        </p>
        <p>
            <button type="submit" class="btn btn-outline-primary" name="button">Search</button>
            <br/><br/><br/>
            <span id="successMessage"><b>${messages.success}</b></span>
        </p>
    </form>
    <br/>
    <div class="row">
        <c:forEach items="${locations}" var="location" >
            <div class="col">
                <div class="m-4 card" style="width: 18rem;">
                        <%--            <img src="..." class="card-img-top" alt="...">--%>
                    <div class="card-body">
                        <h5 class="card-title"><c:out value="${location.getCityName()}" /></h5>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">City ID: <c:out value="${location.getCityId()}" /></li>
                        <li class="list-group-item">County: <c:out value="${location.getCountyName()}" /></li>
                    </ul>
                    <div class="card-body">
                        <a class="text-decoration-none" href="stateprofile?name=<c:out value="${location.getStateName()}"/>">
                                ${location.getStateName()}
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
