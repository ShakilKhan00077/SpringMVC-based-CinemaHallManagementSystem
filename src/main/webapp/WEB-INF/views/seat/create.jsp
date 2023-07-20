<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Schedule</title>
    <h1>Create</h1>
    <style>
        .seat-plan ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-wrap: wrap;
        }
        .seat-plan ul li {
            margin: 5px;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #ccc;
        }
        .seat-plan li:empty {
            border: none;
        }
        .seat-plan ul li a.default {
            background: url(/ed63bff….svg) no-repeat 0% 0%;
            background-size: contain;
            color: #28ac46;
        }
    </style>
</head>
<body>
<div class="seat-plan">
    <ul>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li>S</li>
        <li>C</li>
        <li>R</li>
        <li>E</li>
        <li>E</li>
        <li>N</li>

        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
    <br>
    <br>
<ul>
    <li><a class="default" href="#">n1</a></li>
    <li><a class="default" href="#">n2</a></li>
    <li><a class="default" href="#">n3</a></li>
    <li><a class="default" href="#">n4</a></li>
    <li><a class="default" href="#">n5</a></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li><a class="default" href="#">n6</a></li>
    <li><a class="default" href="#">n7</a></li>
    <li><a class="default" href="#">n8</a></li>
    <li><a class="default" href="#">n9</a></li>
    <li><a class="default" href="#">n10</a></li>
</ul>

<ul>
    <li><a class="default" href="#">m1</a></li>
    <li><a class="default" href="#">m2</a></li>
    <li><a class="default" href="#">m3</a></li>
    <li><a class="default" href="#">m4</a></li>
    <li><a class="default" href="#">m5</a></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li><a class="default" href="#">m6</a></li>
    <li><a class="default" href="#">m7</a></li>
    <li><a class="default" href="#">m8</a></li>
    <li><a class="default" href="#">m9</a></li>
    <li><a class="default" href="#">m10</a></li>
</ul>
<ul>
    <li><a class="default" href="#">l1</a></li>
    <li><a class="default" href="#">l2</a></li>
    <li><a class="default" href="#">l3</a></li>
    <li><a class="default" href="#">l4</a></li>
    <li><a class="default" href="#">l5</a></li>
    <li><a class="default" href="#">l6</a></li>
    <li><a class="default" href="#">l7</a></li>
    <li><a class="default" href="#">l8</a></li>
    <li><a class="default" href="#">l9</a></li>
    <li><a class="default" href="#">l10</a></li>
    <li><a class="default" href="#">l11</a></li>
    <li><a class="default" href="#">l12</a></li>
    <li><a class="default" href="#">l13</a></li>
    <li><a class="default" href="#">l14</a></li>
    <li><a class="default" href="#">l15</a></li>
</ul>
    <ul>
        <li><a class="default" href="#">k1</a></li>
        <li><a class="default" href="#">k2</a></li>
        <li><a class="default" href="#">k3</a></li>
        <li><a class="default" href="#">k4</a></li>
        <li><a class="default" href="#">k5</a></li>
        <li><a class="default" href="#">k6</a></li>
        <li><a class="default" href="#">k7</a></li>
        <li><a class="default" href="#">k8</a></li>
        <li><a class="default" href="#">k9</a></li>
        <li><a class="default" href="#">k10</a></li>
        <li><a class="default" href="#">k11</a></li>
        <li><a class="default" href="#">k12</a></li>
        <li><a class="default" href="#">k13</a></li>
        <li><a class="default" href="#">k14</a></li>
        <li><a class="default" href="#">k15</a></li>
    </ul>
    <ul>
        <li><a class="default" href="#">j1</a></li>
        <li><a class="default" href="#">j2</a></li>
        <li><a class="default" href="#">j3</a></li>
        <li><a class="default" href="#">j4</a></li>
        <li><a class="default" href="#">j5</a></li>
        <li><a class="default" href="#">j6</a></li>
        <li><a class="default" href="#">j7</a></li>
        <li><a class="default" href="#">j8</a></li>
        <li><a class="default" href="#">j9</a></li>
        <li><a class="default" href="#">j10</a></li>
        <li><a class="default" href="#">j11</a></li>
        <li><a class="default" href="#">j12</a></li>
        <li><a class="default" href="#">j13</a></li>
        <li><a class="default" href="#">j14</a></li>
        <li><a class="default" href="#">j15</a></li>
    </ul>

</div>
</body>
</html>
