<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            margin: 0 auto;
            max-width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }

        input[type="text"],
        input[type="password"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>Register</h1>

<form:form action="store_dto" modelAttribute="userDto">
    <label for="username">Username:</label>
    <form:input path="username" id="username"/>
    <form:errors path="username"/>

    <br><br>

    <label for="full_name">Full Name:</label>
    <form:input path="fullName" id="full_name"/>
    <form:errors path="fullName"/>

    <br><br>

    <label for="password">Password:</label>
    <form:input path="password" id="password"/>
    <form:errors path="password"/>

    <br><br>

    <label for="gender">Gender:</label>
    <form:radiobutton path="gender" id="gender" value="MALE"/>MALE
    <form:radiobutton path="gender" id="gender" value="FEMALE"/>FEMALE
    <form:errors path="gender"/>

    <br><br>

    <label for="dob">Date Of Birth:</label>
    <form:input type="date" path="dateOfBirth" id="dob"/>
    <form:errors path="dateOfBirth"/>

    <br><br>

    <input type="submit">

</form:form>
</body>
</html>

