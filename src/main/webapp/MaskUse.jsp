<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>MaskUse</title>
</head>
<body>
<h1>${messages.title}</h1>
<table border="1">
    <tr>
        <th>MaskUseId</th>
        <th>CountyFIPS</th>
        <th>ALWAYS</th>
        <th>FREQUENTLY</th>
        <th>SOMETIMES</th>
        <th>RARELY</th>
        <th>NEVER</th>
    </tr>
    <c:forEach items="${maskUse}" var="maskUse" >
        <tr>
            <td><c:out value="${maskUse.getMaskUseId()}" /></td>
            <td><c:out value="${maskUse.getCountyFIPS()}" /></td>
            <td><c:out value="${maskUse.getALWAYS()}" /></td>
            <td><c:out value="${maskUse.getFREQUENTLY()}" /></td>
            <td><c:out value="${maskUse.getSOMETIMES()}" /></td>
            <td><c:out value="${maskUse.getRARELY()}" /></td>
            <td><c:out value="${maskUse.getNEVER()}" /></td>

<%--            <td><a href="blogcomments?postid=<c:out value="${blogPost.getPostId()}"/>">BlogComments</a></td>--%>
<%--            <td><a href="deleteblogpost?postid=<c:out value="${blogPost.getPostId()}"/>">Delete</a></td>--%>
        </tr>
    </c:forEach>
</table>
</body>
</html>
