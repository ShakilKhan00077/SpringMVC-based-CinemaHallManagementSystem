<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Logged-in User Information</title>
</head>
<body>

<h1>Logged-in User Information</h1>

<table>
    <thead>
    <tr>
        <th>Id</th>
        <th>Username</th>
        <th>Full Name</th>
        <th>Gender</th>
        <th>Address</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>${loggedInUser.id}</td>
        <td>${loggedInUser.username}</td>
        <td>${loggedInUser.fullName}</td>
        <td>${loggedInUser.gender}</td>
        <td>${loggedInUser.address}</td>
    </tr>
    </tbody>
</table>

</body>
</html>
