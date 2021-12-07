<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>Safe Travels</title>
  <link href="./css/main.css" rel="stylesheet" type="text/css">
  <%----- Bootstrap CSS ----%>
  <link rel="stylesheet" type="text/css" th:href="@{/webjars/bootstrap/css/bootstrap.min.css}"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">

</head>
<body>
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
<<<<<<< HEAD
          <a href="WishListDelete.jsp" class="nav-link m-2 menu-item">Wishlist</a>
=======
          <a href="WishListCreate.jsp" class="nav-link m-2 menu-item">Wishlist</a>
>>>>>>> master
        </li>
        <li class="nav-item">
          <a href="About.jsp" class="nav-link m-2 menu-item">About</a>
        </li>
      </ul>

    </div>
  </nav>
</div>
<%--End Navigation Bar--%>

<div class="container-fluid content">
  <div class="banner">
    <img src="images/banner.png" class="img-fluid banner" alt="SafeTravelsBanner">
  </div>
  <div class="text-center p-4">
    <a href="FindLocations.jsp" class="btn btn-primary" role="button">Search Location</a>
    <a href="StateProfile.jsp" class="btn btn-primary" role="button">Search States</a>
    <a href="USTravel.jsp" class="btn btn-primary" role="button">Search US Travel</a>
    <a href="Policy.jsp" class="btn btn-primary" role="button">Search Policy</a>
  </div>
  <div class="p-4 container">
    <div class="row">

      <div class="col text-left">

        <h1>About:</h1>
        <p>
          Safe Travels Is a travel advisory website that provides the latest updates for visitors to a specific destination
          in the US. The advisory is based on Covid-19 safety rating system by city and state, and travel recommendations
          and tips by other users. During uncertain times like this, many people are stressed from staying home too long,
          but at the same time, still unsure about travelling due to the unbalanced health precautions across the nation.
          The target market is for people who want to travel, but are not happy with the false information spreading across
          the media. We want to provide our users with a one-stop place for reliable information on which location in the US
          is best for travelling, based on vaccination rate, mask mandate, and other Covid related policies.
        </p>
      </div>

      <div class="mx-4 col">
        <div class="row">
          <div class="text-left">
            <h1>Team Bigfoot is Real:</h1>
            Brittany-Lauren Todd<br>
            Joffrey Inocencio<br>
            Kayla Sear<br>
            Randy Ramli<br>
            Sruti Keerti Munukutla<br>
            Steven Fountain<br>
          </div>
        </div>

        <div class="row">
          <div class="text-left">
            <h1>Data Sources:</h1>
            <a href="https://catalog.data.gov/dataset/covid-19-state-and-county-policy-orders-9408a">Covid-19 State and County
              Policy Orders</a><br>
            <a href="https://catalog.data.gov/dataset/united-states-covid-19-cases-and-deaths-by-state-over-time">United
              States Covid 19 Cases and Deaths By State</a><br>
            <a href="https://github.com/nytimes/covid-19-data">Mask Use</a><br>
            <a href="https://www.bts.gov/daily-travel">Transportation Statistics</a><br>
          </div>
        </div>
      </div>


    </div>

  </div>
</div>

</body>
</html>

