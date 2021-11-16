<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>StateCountyProfiles</title>
</head>
<body>
<h1>${messages.title}</h1>
<table border="1">
    <tr>
        <th>ProfileId</th>
        <th>CountyName</th>
        <th>CountyFIPS</th>
        <th>MaskUseId</th>
        <th>StateProfileId</th>
        <th>NationalProfileId</th>
        <th>VaccinationID</th>
        <th>PolicyId</th>


    </tr>
    <c:forEach items="${countyProfiles}" var="countyProfiles" >
        <tr>
            <td><c:out value="${countyProfiles.getProfileId()}" /></td>
            <td><c:out value="${countyProfiles.getCountyName()}" /></td>
            <td><c:out value="${countyProfiles.getCountyFIPS()}" /></td>
            <td>
                <a href="maskuse?MaskUseId=<c:out value="${countyProfiles.getMaskUseId()}"/>">
                    Data
                </a>
            </td>
            <td><c:out value="${countyProfiles.getStateProfileId()}" /></td>
            <td><c:out value="${countyProfiles.getNationalProfileId()}" /></td>
            <td><c:out value="${countyProfiles.getVaccinationId()}" /></td>
            <td><c:out value="${countyProfiles.getPolicyId()}" /></td>


        </tr>
    </c:forEach>
</table>
</body>
</html>