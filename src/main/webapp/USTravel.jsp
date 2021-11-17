<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Safe Travels: State Travel Statistics</title>
</head>
<body>
<form action="ustravel" method="get">
    <h1>Travel Statistics for State: Enter state name</h1>
    <p>
        <label for="statename">Search for a State</label>
        <input id="statename" name="statename" value="${fn:escapeXml(param.statename)}">
    </p>
    <p>
        <input type="submit">
        <br/><br/><br/>
        <span id="successMessage"><b>${messages.success}</b></span>
    </p>
</form>
<br/>
<h1>State Travel Data</h1>
<table border="1">
    <tr>
        <th>State Name</th>
        <th>State FIPS</th>
        <th>Profile ID</th>
        <th>Population Staying at Home</th>
        <th>Population Not Staying at home</th>
        <th>Percent of population taking trips</th>
    </tr>
        <tr>
            <td><c:out value="${usTravelState.getStateName()}" /></td>
            <td><c:out value="${usTravelState.getStateFIPS()}" /></td>
            <td><c:out value="${usTravelState.getStateProfileID()}" /></td>
            <td><c:out value="${usTravelState.getPopStayingAtHome()}" /></td>
            <td><c:out value="${usTravelState.getPopNotStayingAtHome()}" /></td>
            <td><c:out value="${usTravelState.getPercentTakingTrips()}" /></td>
        </tr>
</table>
</body>
</html>

