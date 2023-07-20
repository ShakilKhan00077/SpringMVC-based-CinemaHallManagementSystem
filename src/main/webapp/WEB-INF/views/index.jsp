<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cineplex</title>
    <style>
        /* Reset default styling */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            padding: 20px 0;
            color: #333;
        }

        .navbar {
            text-align: center;
            margin-bottom: 20px;
        }

        .navbar a {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            color: #333;
            font-weight: bold;
            border-radius: 20px;
            transition: all 0.3s ease;
        }

        .navbar a:hover {
            color: #fff;
            background-color: #333;
        }

        .movie-cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-top: 20px;
        }

        .movie-card {
            width: calc(20% - 20px);
            margin-bottom: 20px;
            background-color: #fff;
            border-radius: 6px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .movie-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .movie-card img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .movie-card-content {
            padding: 10px;
        }

        .movie-card-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .movie-card-info {
            font-size: 14px;
            color: #666;
        }

        .movie-card-link {
            display: block;
            text-align: center;
            padding: 10px 0;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .movie-card-link:hover {
            background-color: #555;
        }


    </style>
    <%@ include file="header.jsp" %>
</head>
<body>
<c:url var="detailsLink" value="/schedules/details">
    <c:param name="productId" value="${product.id}" />
</c:url>

<a href="${pageContext.request.contextPath}/users/home">login as admin</a>
|
<a href="${pageContext.request.contextPath}/users/list">Users</a>
|
<a href="${pageContext.request.contextPath}/users/create_dto">Register</a>
|
<a href="${pageContext.request.contextPath}/users/create_dto">Register</a>
|
<a href="${pageContext.request.contextPath}/addresses/list">Addresses</a>
|
<a href="${pageContext.request.contextPath}/products/list">Products</a>
|
<a href="${pageContext.request.contextPath}/products/order_create">Create Order</a>
|
<a href="${pageContext.request.contextPath}/schedules/list">Schedule</a>
<table>

    <tbody>
    <div class="movie-cards">
        <c:forEach items="${products}" var="product">
            <c:url var="detailsLink" value="/schedules/details">
                <c:param name="productId" value="${product.id}" />
            </c:url>
            <div class="movie-card">
                <img src="${product.poster}" alt="movie-img">
                <div class="movie-card-content">
                    <h2 class="movie-card-title">${product.title}</h2>
                    <div class="movie-card-info">
                        <span>Rated:</span> ${product.rated}<br>
                        <span>Runtime:</span> ${product.runtime}<br>
                        <span>Director:</span> ${product.director}<br>
                        <span>Release Date:</span> ${product.released}
                    </div>
                    <a href="${detailsLink}" class="movie-card-link">Details</a>
                </div>
            </div>
        </c:forEach>
    </div>

    </tbody>
</table>
<%@ include file="footer.jsp" %>
</body>
</html>