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
	<form action="profile" method="post">
		<h1>Search for Covid-19 data by state or county</h1>
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
                <th>ID</th>
                <th>Date</th>
                <th>Covid Cases</th>
                <th>Covid Deaths</th>
            </tr>
            <c:forEach items="${profiles}" var="profile" >
                <tr>
                    <td><c:out value="${profile.getProfileId()}" /></td>
                    <td><fmt:formatDate value="${profile.getDate()}" pattern="yyyy-MM-dd"/></td>
                    <td><c:out value="${profile.getCovidCases()}" /></td>
                    <td><c:out value="${profile.getCovidDeaths()}" /></td>
                </tr>
            </c:forEach>
       </table>
</body>
</html>
