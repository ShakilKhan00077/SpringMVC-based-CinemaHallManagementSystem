<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Order</title>
</head>
<body>

<h1>Create Order</h1>


<form:form action="store" modelAttribute="product">
    <label for="title">Name:</label>
    <form:input path="title" id="title"/>
    <form:errors path="title"/>

    <br><br>
    <img src="${products.poster}" alt="movie-img" width="150" height="200">
    ${products.title}
    ${scheduledate}
    <label for="seatType">Type:</label>
    <form:radiobutton path="seatType" id="seatType" value="REGULAR"/>REGULAR
    <form:radiobutton path="seatType" id="seatType" value="PREMIUM"/>PREMIUM

    <form:errors path="seatType"/>

    <label>Customer:</label>

    <form:select path="customers">
        <c:forEach items="${customers}" var="loggedInUser">
            <form:option value="${loggedInUser.id}" label="${loggedInUser.user.fullName}" />
        </c:forEach>
    </form:select>
    <br><br>
    <input type="submit">

</form:form>

</body>
</html>
