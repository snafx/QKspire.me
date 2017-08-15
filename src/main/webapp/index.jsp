<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="recipes.repository.*,recipes.model.*"%>
<%@ page import="java.util.*" %>

<%
    List<Recipe> recipeList = RecipeRepository.findRandomSixRecipes();
    pageContext.setAttribute("randomRecipeList", recipeList);
//    int id = 0;
//    for (int i = 0; i < recipeList.size(); i++) {
//        id = recipeList.get(i).getId();
//    }
//    DIFFICULTY difficulty = recipeList.get(id).getDifficulty();
//    String diffName = DifficultyRepository.findByDifficulty(difficulty).getName();
//    pageContext.setAttribute("difficultyName", diffName);

%>

<%--<c:set value="${difficultyName}" var="recipeDiff"/>--%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>QKspire.me</title>
    <meta name="description" content="QKspire.me - best recipes on the web">
    <meta name="author" content="snafx">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab|Raleway|Slabo+27px" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="res/css/font-awesome.min.css">
    <link rel="stylesheet" href="res/css/font-awesome.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="res/css/style.css">

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
        <div class="col-md-3"></div>
        <div class="col-md-7">
            <form action="search" method="post">
                <div class="form-group row col-md-6">
                    <input type="text" placeholder="find a recipe" name="phrase" class="form-control" />
                </div>
                <div class="form-group row col-md-4">
                    <input type="text" placeholder="find ingredient" name="ingredient" class="form-control" />
                </div>
                <div class="form-group row col-md-2">
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
                <button type="button" class="btn category"><a href="recipes.jsp?category=MEAT"> Meat </a></button>
            </div>
            <div class="btn-group col-md-3" role="group">
                <button type="button" class="btn"><a href="recipes.jsp?category=FISH"> Fish </a></button>
            </div>
            <div class="btn-group col-md-3" role="group">
                <button type="button" class="btn"><a href="recipes.jsp?category=VEGETARIAN"> Vegetarian </a></button>
            </div>
            <div class="btn-group col-md-3" role="group">
                <button type="button" class="btn"><a href="recipes.jsp?category=DESSERTS"> Desserts </a></button>
            </div>
        </div>
    </div>

    <!-- random recipes -->
   
    <div class="container ad">
        <c:forEach items="${randomRecipeList}" var="recipe">
        <div class="media panel">
            <div class="media-left media-middle">
                <a href="recipe.jsp?recipeId=${recipe.id}">
                    <img class="media-object small-object" src="http://www.hamburgerhamlet.com/wp-content/uploads/2014/11/the-hamburger-hamlet-sherman-oaks-34.jpg" alt="no photo">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading"><a href="recipe.jsp?recipeId=${recipe.id}">${recipe.recipeTitle}</a></h4>
                <a href="recipe.jsp?recipeId=${recipe.id}">(Soon description) Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi, hic fugiat id illo quod porro quam corporis sint quidem blanditiis quo quas reprehenderit officia! Quibusdam magni ipsa voluptas ullam molestiae.</a>
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
    <br><br><br><br><br><br><br> <br><br><br><br><br> 

     

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
