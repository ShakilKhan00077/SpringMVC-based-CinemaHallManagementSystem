<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Movie Details</title>
    <style>
        .card {
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px;
            max-width: 400px;
            background-color: #fff;
        }

        .card img {
            align-content: center;
            display: block;
            margin-bottom: 10px;
        }

        .card-content {
            padding: 10px;
        }

        .card h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .card table {
            width: 100%;
            border-collapse: collapse;
        }

        .card th,
        .card td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        .card tr:last-child td {
            border-bottom: none;
        }

        .card tr:hover {
            background-color: #f5f5f5;
        }

    </style>
</head>
<body>
<div class="card">
    <img src="${product.poster}" alt="movie-img" width="150" height="200">
    <h2>${product.title}</h2>
    <div class="card-content">

        <table>
            <thead>
            <tr>
                <th>Date</th>
                <th>Start Time</th>
                <th>Ticket</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${product.schedules}" var="schedule">
                <tr>
                    <c:url var="createorder" value="/products/order_create">
                        <c:param name="productId" value="${product.id}" />
                        <c:param name="scheduledate" value="${schedule.date}" />
                    </c:url>
                    <td>${schedule.date}</td>
                    <td>${schedule.stime}</td>
                    <td><a href="${createorder}">Buy</a></td>
                    <td>buy</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>
