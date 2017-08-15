<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="recipes.repository.*,recipes.model.*"%>
<%@ page import="java.util.*" %>

<%
    String phrase = request.getParameter("phrase");
    if (phrase.isEmpty()) {
        pageContext.setAttribute("WARNING", "Please fill searched phrase!");
    } else {
        List<Recipe> recipes = RecipeRepository.findByPhrase(phrase);
        pageContext.setAttribute("searchedRecipe", recipes);
    }
%>


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
            <div class="btn-group col-md-3" role="group">
                <button type="button" class="btn category"> Meat </button>
            </div>
            <div class="btn-group col-md-3" role="group">
                <button type="button" class="btn"> Fish </button>
            </div>
            <div class="btn-group col-md-3" role="group">
                <button type="button" class="btn"> Vegetarian </button>
            </div>
            <div class="btn-group col-md-3" role="group">
                <button type="button" class="btn"> Desserts </button>
            </div>
        </div>
    </div>

    <!-- search results recipes list -->

    <div class="container ad">
        ${WARNING}
        <div class="row recipes-list">
            <c:forEach items="${searchedRecipe}" var="recipe">
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


    <br><br><br><br><br><br><br> <br><br><br><br><br><br><br> <br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br> <br><br><br><br><br><br><br> <br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br> <br><br><br><br><br><br><br> <br><br><br><br><br>


    <!-- footer -->
    <footer>
        <div class="container footer form-inline">
            <div class="col-md-3">
                <a href="#"> Home </a>
            </div>
            <div class="col-md-3">
                <a href="#">Products</a>
            </div>
            <div class="col-md-3">
                <a href="#">Recipes</a>
            </div>
            <div class="col-md-3">
                <a href="#">Contact</a>
            </div>
        </div>
    </footer>


</body>
</html>
