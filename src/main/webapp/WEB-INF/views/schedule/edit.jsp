<%--
  Created by IntelliJ IDEA.
  User: rifat
  Date: 4/28/2023
  Time: 11:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form action="update" modelAttribute="schedule">

    <label for="id">Id:</label>
    <form:input path="id" id="for" readonly="true"/>
    <form:errors path="id"/>

    <br><br>

    <label for="date">Address:</label>
    <form:input path="date" id="date"/>
    <form:errors path="date"/>

    <br><br>

    <label for="stime">Schedule:</label>
    <form:input path="stime" id="stime"/>
    <form:errors path="stime"/>

    <br><br>

    <label for="etime">Schedule:</label>
    <form:input path="etime" id="etime"/>
    <form:errors path="etime"/>

    <br><br>


    <input type="submit">

</form:form>
</body>
</html>
