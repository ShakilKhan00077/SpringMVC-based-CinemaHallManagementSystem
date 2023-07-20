<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Users</title>

    <title>Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        table {
            border-collapse: collapse;
            margin: auto;
            width: 80%;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: #fff;
            font-weight: bold;
        }

        td a {
            text-decoration: none;
            color: #333;
        }

        td a:hover {
            color: #4CAF50;
        }

    </style>


</head>
<body>

<h1>Users</h1>

<div style="display: flex; justify-content: center; margin-bottom: 20px;">
    <button style="padding: 10px 20px; background-color: #4CAF50; color: white; border: none; cursor: pointer;" onclick="window.location.href='create_dto';return false;">Add User DTO</button>
</div>
<table>
    <thead>
    <tr>
        <th>Id</th>
        <th>Username</th>
        <th>Full Name</th>
        <th>Gender</th>
        <th>Address</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <c:url var="updateLink" value="/users/edit">
                <c:param name="userId" value="${user.id}" />
            </c:url>
            <c:url var="deleteLink" value="/users/delete">
                <c:param name="userId" value="${user.id}" />
            </c:url>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.fullName}</td>
            <td>${user.customer.gender}</td>
            <td> <c:forEach items="${user.customer.addresses}" var="address">
                ${address.addressType} ${address.address}
            </c:forEach>
            </td>
            <td><a href="${updateLink}">Update</a> | <a href="${deleteLink}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>