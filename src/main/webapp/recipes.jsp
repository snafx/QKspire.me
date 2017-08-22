<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.*"%>

<%
    String categoryParam = request.getParameter("category");
    CATEGORY category = CATEGORY.valueOf(categoryParam);
    String categoryName = CategoryRepository.findByCategory(category).getName();
    pageContext.setAttribute("category", category);
    pageContext.setAttribute("categoryName", categoryName);
%>

<c:set value="${RecipeRepository.findByCategory(category)}" var="recipeList"/>



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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="res/css/style2.css">


</head>

<body>
    <!-- header -->

    <nav class="navbar navbar-default">
        <div class="container">
            <c:import url="top-menu.jsp"/>
        </div>
    </nav>

    <br><br><br><br>


    <!-- search bar -->

    <div class="container">
        <div class="col-md-4"></div>
        <div class="col-md-6">
            <form action="search" method="post">
                <div class="form-group row col-md-8">
                    <input type="text" placeholder="find a recipe" name="phrase" class="form-control" />
                </div>
                <div class="form-group row col-md-4">
                    <button type="submit" class="btn btn-classic">Search</button>
                </div>
            </form>
        </div>
        <div class="col-md-2"></div>
    </div>

    <!-- categories -->

    <div class="container category">
        <div class="btn-group btn-group-justified" role="group" aria-label="Recipes categories">
            <c:import url="category.jsp"/>
        </div>
    </div>

    <br><br><br>

    <!-- recipes list -->

    <div class="container ad">
        <div class="row recipes-list">
            <c:forEach items="${recipeList}" var="recipe">
                <div class="recipe-thumb col-md-4 panel">
                    <a class="recipe-img-link" href="recipe.jsp?recipeId=${recipe.id}">
                        <img class="media-object img-responsive center-block" src="${recipe.recipePhotoLink}" alt="no photo"></a>
                    <div class="recipe-title">
                        <h2><a href="recipe.jsp?recipeId=${recipe.id}" class="recipe-link">${recipe.recipeTitle}</a></h2>
                        <h6>${recipe.recipeDescription}</h6>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div> 

    <br><br><br><br><br><br><br> 

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
                <a href="recipes-all.jsp">All recipes</a>
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
