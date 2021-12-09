<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="Header.jsp"></jsp:include>

    <title>Vaccination</title>

<body>
<form action="vaccination" method="get">
	<h1>Vaccination Information: Enter vaccinationId</h1>
	<p>
		<label for="vaccinationId">Enter vaccinationId</label>
        <input id="vaccinationId" name="vaccinationId" value="${fn:escapeXml(param.vaccinationId)}">
        
	  </p>
    <p>
    
    
    <input type="submit">
        <br/><br/><br/>
        <span id="successMessage"><b>${messages.success}</b></span>
    </p>
</form>
<br/>
<h1>Vaccination Information</h1>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>