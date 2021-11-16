<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <%----- Bootstrap CSS ----%>
        <link rel="stylesheet" type="text/css" th:href="@{/webjars/bootstrap/css/bootstrap.min.css}"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">

        <title>Safe Travels</title>

            <%----- Navigation Bar ----%>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="d-flex flex-grow-1">
        <span class="w-100 d-lg-none d-block">
            <!-- hidden spacer to center brand on mobile --></span>
                    <a class="navbar-brand d-none d-lg-inline-block" href="index.jsp"> Safe Travels </a>
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
                            <a href="index.jsp" class="nav-link m-2 menu-item nav-active">Log In</a>
                        </li>
                        <li class="nav-item">
                            <a href="UserCreate.jsp" class="nav-link m-2 menu-item">Sign Up</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link m-2 menu-item">Create a Review</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link m-2 menu-item">Wishlist</a>
                        </li>
                    </ul>
                </div>
            </nav>
    </head>
    <body>
        <h1><%= "SafeTravels" %></h1>
        <br/>
        <a href="Profile.jsp">Profile</a>
    </body>
</html>