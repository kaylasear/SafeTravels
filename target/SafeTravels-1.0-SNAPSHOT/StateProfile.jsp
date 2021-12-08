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

<%--    Chart.js script--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.2/chart.min.js" integrity="sha512-tMabqarPtykgDtdtSqCL3uLVM0gS1ZkUAVhRFu1vSEFgvB73niFQWJuvviDyBGBH22Lcau4rHB5p2K2T0Xvr6Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>State Profiles</title>
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
<body onload="drawChart()">
<div class="container-fluid mx-auto">
    <form action="stateprofile" method="get">
        <h1>State Profiles</h1>
        <p>
            <label for="name">Search for a State </label>
            <input id="name" name="name" value="${fn:escapeXml(param.name)}">
        </p>
        <p>
            <button type="submit" class="btn btn-outline-primary mx-auto" name="button">Search</button>
        </p>
    </form>
    <span id="successMessage">${messages.success}</span>

    <p>
    <h6 class="rating"> <u>Rating Key</u></h6>
        Rating 1: Safest State To Travel<br>
        Rating 2: Exercise Normal Precautions<br>
        Rating 3: Exercise Increased Caution<br>
        Rating 4: Reconsider Travel<br>
        Rating 5: Do Not Travel
    </p>

    <div class="row">

        <c:forEach items="${stateProfiles}" var="stateProfile" >
            <div class="col">
                <div class="m-4 card mx-auto" style="width: 18rem;">
                    <div class="card-body">
                        <h4 class="card-title"><c:out value="${stateProfile.getStateName()}" /></h4>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Safety Rating: <c:out value="${stateProfile.getSafetyRating()}" /></li>
                        <li class="list-group-item">Total Cases: <c:out value="${stateProfile.getCovidCases()}" /></li>
                        <li class="list-group-item">Total Deaths: <c:out value="${stateProfile.getCovidDeaths()}" /></li>
                    </ul>
                    <div class="card-body">
                        <a class="text-decoration-none" href="countyprofile?stateProfileId=<c:out value="${stateProfile.getProfileId()}"/>">
                            View Counties
                        </a>
                        <br>
                        <a class="text-decoration-none" href="statereview?stateProfileId=<c:out value="${stateProfile.getProfileId()}"/>">
                            View Reviews
                        </a>
                </div>

<%--                    Pie Chart displaying travel data for certain state--%>
                    <script type="text/javascript" items="${usTravel}" var="usTravel">
                        function drawChart() {
                            const population = [<c:out value="${usTravel.getPopStayingAtHome()}"/>, <c:out value="${usTravel.getPopNotStayingAtHome()}"/>];
                            const populationStats = ['PopStayingAtHome', 'PopNotStayingAtHome'];
                            new Chart('myChart', {
                                type: 'pie',
                                data: {
                                    labels: populationStats,
                                    datasets: [{
                                        label: 'Population Travel Data',
                                        data: population,
                                        backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)']
                                    }]
                                },

                            });
                        }
                    </script>
                    <canvas id="myChart" width="800" height="400"></canvas>
            </div>
        </c:forEach>
    </div>
</div>

</div>

</body>
</html>
