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
    <link rel="stylesheet" href="res/css/font-awesome.min.css">
    <link rel="stylesheet" href="res/css/font-awesome.css">

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

    <br><br><br><br>


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

    <br><br><br>
    <!-- recipes list -->

    <div class="container ad">
        <c:forEach items="${recipeList}" var="recipe">
        <div class="row recipes-list">
            <div class="recipe-thumb col-md-4 panel">
                <a class="recipe-img-link" href="recipe.jsp?recipeId=${recipe.id}">
                    <img class="media-object img-responsive center-block" src="http://www.hamburgerhamlet.com/wp-content/uploads/2014/11/the-hamburger-hamlet-sherman-oaks-34.jpg" alt="no photo"></a>

                <div class="recipe-title">
                    <h2><a href="recipe.jsp?recipeId=${recipe.id}" class="recipe-link">${recipe.recipeTitle}</a></h2>
                    <h6>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil ex natus quos esse est.</h6>
                </div>
            </div>
        </div>
        </c:forEach>
        <div class="row recipes-list">
            <div class="recipe-thumb col-md-4 panel">
                <a class="recipe-img-link" href="#">
                    <img class="media-object img-responsive center-block" src="http://www.hamburgerhamlet.com/wp-content/uploads/2014/11/the-hamburger-hamlet-sherman-oaks-34.jpg" alt="no photo"></a>

                <div class="recipe-title">
                    <h2><a class="recipe-link">Lorem Ipsum Dolor Sit</a></h2>
                    <h6>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil ex natus quos esse est.</h6>
                </div>
            </div>
            <div class="recipe-thumb col-md-4 panel">
                <a class="recipe-img-link" href="#">
                    <img class="media-object img-responsive center-block" src="http://www.hamburgerhamlet.com/wp-content/uploads/2014/11/the-hamburger-hamlet-sherman-oaks-34.jpg" alt="no photo"></a>

                <div class="recipe-title">
                    <h2><a class="recipe-link">Lorem Ipsum Dolor Sit</a></h2>
                    <h6>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil ex natus quos esse est eligendi dignissimos aut harum expedita illum.</h6>
                </div>
            </div>
            <div class="recipe-thumb col-md-4 panel">
                <a class="recipe-img-link" href="#">
                    <img class="media-object img-responsive center-block" src="http://www.hamburgerhamlet.com/wp-content/uploads/2014/11/the-hamburger-hamlet-sherman-oaks-34.jpg" alt="no photo"></a>

                <div class="recipe-title">
                    <h2><a class="recipe-link">Lorem Ipsum Dolor Sit</a></h2>
                    <h6>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</h6>
                </div>
            </div>
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