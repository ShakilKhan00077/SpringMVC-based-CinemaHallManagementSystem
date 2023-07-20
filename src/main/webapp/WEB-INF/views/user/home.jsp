<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="header.jsp" %>
</head>
<body>
<h1>Welcome to Ecom</h1>
<a href="${pageContext.request.contextPath}/users/list">user list</a> |
<a href="${pageContext.request.contextPath}/products/list">products</a>

<%@ include file="footer.jsp" %>