<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.*"%>
<%@ page import="java.util.Optional" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>QKspire.me</title>
    <meta name="description" content="QKspire.me - best recipes on the web">
    <meta name="author" content="snafx">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab|Raleway|Slabo+27px" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="res/css/style2.css">

</head>

<body>
    <!-- header -->

    <nav class="navbar navbar-default">
        <div class="container">
            <c:import url="top-menu.jsp"/>
        </div>
    </nav>

    <br><br><br><br><br>

<!-- Log In -->
    <div class="container category">
        <div class="col-md-6">
            <h2>User Log In</h2>
        </div>

    </div>
    <div class="container ad">
        <div class="col-md-5">
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





    <br><br><br><br><br><br><br><br><br><br>





    <!-- footer -->
    <footer>
        <div class="container footer form-inline">
            <div class="col-md-3">
                <a href="index.jsp"> Home </a>
            </div>
            <div class="col-md-3">
                <a href="products.html">Products</a>
            </div>
            <div class="col-md-3">
                <a href="recipes.jsp">Recipes</a>
            </div>
            <div class="col-md-3">
                <a href="contact.html">Contact</a>
            </div>
        </div>
    </footer>

    <!-- End Document
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->

</body>

</html>