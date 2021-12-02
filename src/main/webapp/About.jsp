<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
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
    <title>About</title>
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
<div class="container-fluid about">
    <h1>About:</h1>
    <p>
        Safe Travels Is a travel advisory website that provides the latest updates for visitors to a specific destination in the US. The advisory is based on Covid-19 safety rating system by city and state, and travel recommendations and tips by other users. During uncertain times like this, many people are stressed from staying home too long, but at the same time, still unsure about travelling due to the unbalanced health precautions across the nation. The target market is for people who want to travel, but are not happy with the false information spreading across the media. We want to provide our users with a one-stop place for reliable information on which location in the US is best for travelling, based on vaccination rate, mask mandate, and other Covid related policies.
    </p>
    <h1>Team Bigfoot is Real:</h1>
    <li>Brittany-Lauren Todd</li>
    <li>Kayla Sear</li>
    <li>Joffrey Inocencio</li>
    <li>Randy Ramli</li>
    <li>Sruti Keerti Munukutla</li>
    <li>Steven Fountain</li>


</div>
</body>
</html>