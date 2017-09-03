<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="recipes.repository.*,recipes.model.*" %>
<%@ page import="java.util.*" %>

<%
    List<Recipe> recipeList = RecipeRepository.findRandomSixRecipes();
    pageContext.setAttribute("randomRecipeList", recipeList);

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

    <link rel="stylesheet" href="res/css/style.css">

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

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

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

<!-- random recipes -->

<div class="container ad">
    <c:forEach items="${randomRecipeList}" var="recipe">
        <div class="media panel">
            <div class="media-left media-middle">
                <a href="recipe.jsp?recipeId=${recipe.id}">
                    <img class="media-object small-object" src="${recipe.recipePhotoLink}" alt="no photo">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading"><a href="recipe.jsp?recipeId=${recipe.id}">${recipe.recipeTitle}</a></h4>
                <a href="recipe.jsp?recipeId=${recipe.id}">${recipe.recipeDescription}</a>
                <h5 class="media-heading">
                    <div class="col-md-2"><i class="fa-2 fa-clock-o"> ${recipe.preparationTime} min</i></div>
                    <div class="col-md-1"><i class="fa-2 fa-cutlery"> ${recipe.servings}</i></div>
                    <div class="col-md-2"><i class="fa-2 fa-free-code-camp"> ${recipe.nutrition} kcal</i></div>
                    <div class="col-md-7"><i class="fa-2 fa-tasks"> ${recipe.difficulty}</i></div>
                </h5>
            </div>
        </div>
    </c:forEach>
</div>

<br><br><br><br><br><br><br> <br><br><br><br><br><br><br> <br><br><br><br><br><br><br>
<br><br><br><br><br><br><br> <br><br><br><br><br><br><br> <br><br><br><br><br><br><br>
<br><br><br>

</body>
</html>
