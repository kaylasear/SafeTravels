<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>WishList for User</title>
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
