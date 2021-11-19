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

    <%----- Navigation Bar ----%>
    <div class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-light">
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
                        <a href="WishListRetrieve.jsp" class="nav-link m-2 menu-item">Wishlist</a>
                    </li>
                    <li class="nav-item">
                        <a href="About.jsp" class="nav-link m-2 menu-item">About</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</head>
<body>
<div class="container-fluid">
    <form action="cities" method="post">
        <h1>Search for Covid-19 data by location</h1>
        <p>
            <label for="location">Enter a State, County or City</label>
            <input id="location" name="location" value="${fn:escapeXml(param.location)}">
        </p>
        <p>
            <input type="submit">
            <br/><br/><br/>
            <span id="successMessage"><b>${messages.success}</b></span>
        </p>
    </form>
    <br/>
    <h1>Location Data</h1>
    <table border="1">
        <tr>
            <th>CityId</th>
            <th>City</th>
            <th>County</th>
            <th>State</th>
        </tr>
        <c:forEach items="${locations}" var="location" >
            <tr>
                <td><c:out value="${location.getCityId()}" /></td>
                <td><c:out value="${location.getCityName()}" /></td>
                <td><c:out value="${location.getCountyName()}" /></td>
                <td>
                    <a href="countyprofile?stateProfileId=<c:out value="${location.getStateProfileId()}"/>">
                            ${location.getStateName()}
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
