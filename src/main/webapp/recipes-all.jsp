<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.*" %>

<%
    List<Recipe> allRecipeList = RecipeRepository.findAllRecipes();
    pageContext.setAttribute("allRecipesList", allRecipeList);
%>

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

<br><br><br><br>

<!-- search bar -->

<div class="container">
    <div class="col-md-4"></div>
    <div class="col-md-6">
        <form action="search" method="post">
            <div class="form-group row col-md-8">
                <input type="text" placeholder="find a recipe" name="phrase" class="form-control"/>
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

<!-- all recipes list sorted by recipe ID desc -->

<div class="container ad">
    <div class="row recipes-list">
        <c:forEach items="${allRecipesList}" var="recipe">
            <div class="recipe-thumb col-md-4 panel">
                <a class="recipe-img-link" href="recipe.jsp?recipeId=${recipe.id}">
                    <img class="media-object img-responsive center-block" src="${recipe.recipePhotoLink}"
                         alt="no photo"></a>
                <div class="recipe-title">
                    <h2><a href="recipe.jsp?recipeId=${recipe.id}" class="recipe-link">${recipe.recipeTitle}</a></h2>
                    <h6>${recipe.recipeDescription}</h6>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
