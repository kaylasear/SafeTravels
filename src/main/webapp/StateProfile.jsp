<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%----- Bootstrap CSS ----%>
    <link rel="stylesheet" type="text/css" th:href="@{/webjars/bootstrap/css/bootstrap.min.css}"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Safe Travels US Profile</title>
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
	<form action="stateprofile" method="post">
		<h1>State Profile Data</h1>
		<p>
			<label for="location">See all States</label>
			<input id="location" name="location" value="${fn:escapeXml(param.location)}">
		</p>
		<p>
			<input type="submit">
			<br/><br/><br/>
			<span id="successMessage"><b>${messages.success}</b></span>
		</p>
	</form>
	<br/>
	<h1>State Data</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Date</th>
                <th>State Name</th>
                <th>Covid Cases</th>
                <th>Covid Deaths</th>
                <th>Safety Rating</th>
                <th>Total Counties</th>
            </tr>
            <c:forEach items="${stateProfiles}" var="stateProfile" >
                <tr>
                    <td><c:out value="${stateProfile.getProfileId()}" /></td>
                    <td><fmt:formatDate value="${stateProfile.getDate()}" pattern="yyyy-MM-dd"/></td>
                    <td><c:out value="${stateProfile.getStateName()}" /></td>
                    <td><c:out value="${stateProfile.getCovidCases()}" /></td>
                    <td><c:out value="${stateProfile.getCovidDeaths()}" /></td>
                    <td><c:out value="${stateProfile.getSafetyRating()}" /></td>
                    <td><a href="countyprofile?stateProfileId=<c:out value="${stateProfile.getProfileId()}"/>">
                            ${stateProfile.getNumCounties()}
                    </a></td>
                </tr>
            </c:forEach>
       </table>
</body>
</html>
