<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Safe Travels US Profile</title>
</head>
<body>
	<form action="stateprofile" method="get">
		<h1>State Data</h1>
		<p>
			<label for="name">Search for a State</label>
			<input id="name" name="name" value="${fn:escapeXml(param.name)}">
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
                <th>State Name</th>
                <th>Covid Cases</th>
                <th>Covid Deaths</th>
                <th>Safety Rating</th>
                <th>Total Counties</th>
            </tr>
            <c:forEach items="${stateProfiles}" var="stateProfile" >
                <tr>
                    <td><c:out value="${stateProfile.getProfileId()}" /></td>
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
