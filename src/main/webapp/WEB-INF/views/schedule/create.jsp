<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>add schedule</title>
  <style>
    form {
      display: flex;
      flex-direction: column;
      align-items: center;
      font-family: Arial, sans-serif;
      margin: 20px;
    }

    label {
      margin-bottom: 10px;
    }

    input[type="date"],
    input[type="time"],
    select {
      padding: 8px;
      border-radius: 4px;
      border: 1px solid #ccc;
      font-size: 16px;
      margin-bottom: 15px;
      width: 250px;
    }

    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }

    input[type="submit"]:hover {
      background-color: #3e8e41;
    }

    .form-error {
      color: red;
      font-size: 14px;
      margin-top: -15px;
      margin-bottom: 15px;
    }

  </style>
</head>
<body>
<h1>Add Schedule</h1>
<form:form action="store" modelAttribute="schedule">

  <label for="date">Date:</label>
  <form:input type="date" path="date" id="date"/>
  <form:errors path="date"/>

  <br><br>

  <label for="stime">Start time:</label>
  <form:input type="time" path="stime" id="stime"/>
  <form:errors path="stime"/>

  <br><br>

  <label for="etime">End time:</label>
  <form:input type="time" path="etime" id="etime"/>
  <form:errors path="etime"/>

  <br><br>

  <label for="product">Product:</label>
  <form:select path="product">
    <c:forEach items="${products}" var="product">
      <form:option value="${product.id}" label="${product.title}" />
    </c:forEach>
  </form:select>

  <input type="submit">

</form:form>


</body>
</html>
