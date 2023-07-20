<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Product</title>
    <style>
        /* Reset default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Apply some basic styles to the body */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }

        /* Center the form */
        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Style the form heading */
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Style the form label */
        label {
            display: block;
            font-size: 16px;
            margin-bottom: 8px;
        }

        /* Style the form input */
        input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        /* Style the form submit button */
        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        /* Style the form validation error messages */
        .form-error {
            color: #ff0000;
            margin-top: 5px;
            font-size: 14px;
        }

    </style>
</head>
<body>

<h1>Add Movie</h1>

<form:form action="store" modelAttribute="movieForm">
    <label path="link">Enter IMDb ID:</label>
    <form:input path="link" required="true"/>
    <form:errors path="link"/>
    <br><br>

    <input type="submit">

</form:form>

</body>
</html>
