<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>QKspire.me</title>
    <meta name="description" content="QKspire.me - best recipes on the web">
    <meta name="author" content="snafx">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab|Raleway|Slabo+27px" rel="stylesheet"
          type="text/css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="res/css/style2.css">
    <style>
        body {
            background-image: url(res/img/qkstamp3.jpg);
            background-repeat: no-repeat;
            background-size: 100%;
            background-position: center;
        }
    </style>
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-105832052-1', 'auto');
        ga('send', 'pageview');

    </script>
</head>
<body>

<!-- header -->

<nav class="navbar navbar-default">
    <div class="container">
        <c:import url="top-menu.jsp"/>
    </div>
</nav>
<br>

<!-- Log In -->

<div class="container ad">
    <div class="col-md-7"></div>
    <div class="col-md-5">
        <h2>Log In</h2>
        <br>
        <form action="login" method="post">
            <div class="form-group">
                <label>E-mail</label>
                <input class="form-control" placeholder="example@email.com" name="email" type="email" required/>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input class="form-control" placeholder="password" name="password" type="password" required/>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-default">Log In!</button>
            </div>
        </form>
    </div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>
