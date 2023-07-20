<%--
  Created by IntelliJ IDEA.
  User: rifat
  Date: 4/28/2023
  Time: 11:26 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 800px;
            margin: 20px;
            font-family: Arial, sans-serif;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            color: #4CAF50;
        }

        a:hover {
            text-decoration: underline;
        }

        input[type="button"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin: 20px;
        }

        input[type="button"]:hover {
            background-color: #3e8e41;
        }
    </style>
</head>
<body>
<h1>Schedules</h1>

<p><input type="button" value="Add Schedcule" onclick="window.location.href='create';return false;"></p>

<table>
    <thead>
    <tr>
        <th>Schedule Id</th>
        <th>Product Name</th>
        <th>Date</th>
        <th>Start Time</th>
        <th>End Time</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${schedules}" var="schedule">
        <tr>
            <c:url var="updateLink" value="/schedules/edit">
                <c:param name="userId" value="${schedule.id}" />
            </c:url>
            <c:url var="deleteLink" value="/schedules/delete">
                <c:param name="userId" value="${schedule.id}" />
            </c:url>
            <td>${schedule.id}</td>
            <td>${schedule.product.title}</td>
            <td>${schedule.date}</td>
            <td>${schedule.stime}</td>
            <td>${schedule.etime}</td>
            <td><a href="${updateLink}">Update</a> | <a href="${deleteLink}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
