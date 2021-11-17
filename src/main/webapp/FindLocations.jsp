<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Safe Travels Search</title>
</head>
<body>
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
</body>
</html>
