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
    <title>User Wishlists</title>
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
<h1>${messages.title}</h1>
<table border="1">
    <tr>
        <th>WishId</th>
        <th>Username</th>
<%--        <th>CityProfile Id</th>--%>
        <th>State name</th>
        <th>County Name</th>
    </tr>
    <c:forEach items="${wishListByUser}" var="userData" >
        <tr>
            <td><c:out value="${userData.getWishListID()}" /></td>
            <td><c:out value="${userData.getUser().getUserName()}" /></td>
<%--            <td><c:out value="${wishListByUser.get()}" /></td>--%>
            <td><c:out value="${userData.getStateProfile().getStateName()}" /></td>
            <td><c:out value="${userData.getCountyProfile().getCountyName()}" /></td>
        </tr>
    </c:forEach>
</table>
<form action="wishlistdelete" method="post">
    <p>
    <div <c:if test="${messages.disableSubmit}">style="display:none"</c:if>>
        <label for="username">${userData[0].getUser().getUserName()}</label>
        <input id="username" name="username" value="${fn:escapeXml(param.username)}" readonly>
    </div>
    </p>
    <p>
        <span id="submitButton" <c:if test="${messages.disableSubmit}">style="display:none"</c:if>>
            <input type="submit">
			</span>
    </p>
</form>
</body>
</html>
