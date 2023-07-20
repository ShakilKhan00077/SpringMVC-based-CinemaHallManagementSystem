<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
        }

        h1 {
            text-align: center;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 90%;
            max-width: 900px;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: #fff;
            font-weight: bold;
        }
        img {
            display: block;
            margin: auto;
            max-width: 100px;
            max-height: 150px;
        }
        .action-links a {
            margin: 70px 5px;
        }
        .green-btn {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

    </style>
</head>
<body>
<h1>Movies</h1>
<div style="display: flex; justify-content: center; margin-bottom: 20px;">
    <button style="padding: 10px 20px; background-color: #4CAF50; color: white; border: none; cursor: pointer;" onclick="window.location.href='create';return false;">Add Movie</button>
</div>
<table>
    <thead>
    <tr>
        <th>Id</th>
        <th>Poster</th>
        <th>Title</th>
        <th>Rated</th>
        <th>Runtime</th>
        <th>Director</th>
        <th>Release Date</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${products}" var="product">
        <tr>
            <c:url var="updateLink" value="/products/edit">
                <c:param name="productId" value="${product.id}" />
            </c:url>
            <c:url var="deleteLink" value="/products/delete">
                <c:param name="productId" value="${product.id}" />
            </c:url>
            <c:url var="detailsLink" value="/schedules/details">
                <c:param name="productId" value="${product.id}" />
            </c:url>
            <td>${product.id}</td>
            <td><img src="${product.poster}" alt="movie-img"></td>
            <td><a href="${detailsLink}">${product.title}</a></td>
            <td>${product.rated}</td>
            <td>${product.runtime}</td>
            <td>${product.director}</td>
            <td>${product.released}</td>
            <td><a href="${updateLink}" class="green-btn">Update</a> <a href="${deleteLink}" class="green-btn">Delete</a></td>

        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>

