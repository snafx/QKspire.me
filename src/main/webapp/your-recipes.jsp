<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.*"%>
<%@ page import="java.util.Optional" %>

<%
    Integer authorId = (Integer) request.getSession().getAttribute("authorId");
    if(authorId == null) {
        response.sendRedirect("login.jsp");
    } else {
        Optional<Author> author = AuthorRepository.findById(authorId);
        if (author.isPresent()) {
            Author loggedAuthor = author.get();
            pageContext.setAttribute("loggedAuthor", loggedAuthor);
        }

        List<Recipe> recipeList = RecipeRepository.findByAuthorId(authorId);
        if (recipeList.isEmpty()) {
            pageContext.setAttribute("warning", "No recipes found");
        }
        pageContext.setAttribute("recipe", recipeList);
    }
%>

<c:set value="${recipe}" var="recipeList" />


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

<!-- profile page -->

<div class="container ad">
    <div class="col-md-12">
        <div class="col-md-3">
            <div>
                <img class="media-object img-responsive left-block" src="res/img/face.png" alt="no photo">
            </div>
            <h2>${loggedAuthor.username}</h2>
            <h5>${loggedAuthor.cityName}</h5>
            <h5>${loggedAuthor.email}</h5>
        </div>
        <div class="col-md-9">
            <h4>Your recipes:</h4>
            <h3>${warning}</h3>
            <c:forEach items="${recipeList}" var="recipe">
            <div class="media panel">
                <div class="media-left media-middle">
                    <a href="recipe.jsp?recipeId=${recipe.id}">
                        <img class="media-object small-object" src="${recipe.recipePhotoLink}" alt="no photo">
                    </a>
                </div>
                <div class="media-body">
                    <h4 class="media-heading"><a href="recipe.jsp?recipeId=${recipe.id}" class="recipe-link">${recipe.recipeTitle}</a></h4>
                     <h5><a href="recipe.jsp?recipeId=${recipe.id}">${recipe.recipeDescription}</a></h5>
                </div>
            </div>
            </c:forEach>
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
            <a href="recipes-all.jsp">All recipes</a>
        </div>
        <div class="col-md-3">
            <a href="contact.html">Contact</a>
        </div>
    </div>
</footer>

</body>

</html>