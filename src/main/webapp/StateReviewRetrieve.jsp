<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Review of A State</title>

    <%-- Navigation Bar--%>
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
