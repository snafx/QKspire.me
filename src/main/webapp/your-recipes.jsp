<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.*" %>
<%@ page import="java.util.Optional" %>

<%
    Integer authorId = (Integer) request.getSession().getAttribute("authorId");
    if (authorId == null) {
        response.sendRedirect("login.jsp");
    } else {
        Optional<Author> author = AuthorRepository.findById(authorId);
        if (author.isPresent()) {
            Author loggedAuthor = author.get();
            pageContext.setAttribute("loggedAuthor", loggedAuthor);
        }

        List<Recipe> recipeList = RecipeRepository.findByAuthorId(authorId);
        if (recipeList.isEmpty()) {
            pageContext.setAttribute("recipeWarning", "No recipes found");
        }
        pageContext.setAttribute("recipe", recipeList);

        List<Reviews> reviewsList = ReviewRepository.findByAuthorId(authorId);
        if (reviewsList.isEmpty()) {
            pageContext.setAttribute("reviewWarning", "No reviews posted yet");
        }
        pageContext.setAttribute("review", reviewsList);
    }
%>

<c:set value="${recipe}" var="recipeList"/>
<c:set value="${review}" var="reviewsList"/>


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

<!-- profile page -->

<div class="container ad">
    <div class="col-md-12">
        <div class="col-md-3">
            <div>
                <img class="media-object img-responsive left-block" src="res/img/face.png" alt="no photo">
            </div>
            <h2>${loggedAuthor.username}</h2>
            <hr>
            <h5>${loggedAuthor.cityName}</h5>
            <h5>${loggedAuthor.email}</h5>
        </div>
        <div class="col-md-9">
            <div>
                <h4>Your recipes:</h4>
                <h3>${recipeWarning}</h3>
                <c:forEach items="${recipeList}" var="recipe">
                    <div class="media panel">
                        <div class="media-left media-middle">
                            <a href="recipe.jsp?recipeId=${recipe.id}">
                                <img class="media-object small-object" src="${recipe.recipePhotoLink}" alt="no photo">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading"><a href="recipe.jsp?recipeId=${recipe.id}"
                                                         class="recipe-link">${recipe.recipeTitle}</a></h4>
                            <h5><a href="recipe.jsp?recipeId=${recipe.id}">${recipe.recipeDescription}</a></h5>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <br>
            <hr>
            <br>
            <div>
                <div class="col-md-12">
                    <h4>Your reviws:</h4>
                    <h3>${reviewWarning}</h3>
                    <c:forEach items="${reviewsList}" var="review">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <div class="col-md-9">
                                    <p>
                                        <small><b>${review.recipeId.recipeTitle}</b></small>
                                    </p>
                                </div>
                                <div class="col-md-3">
                                    <p align="right">
                                        <small>posted <b><i>${review.datePosted}</i></b></small>
                                    </p>
                                </div>
                                <p>${review.text}</p>
                                <p align="right">
                                    <a href="recipe.jsp?recipeId=${review.recipeId.id}" class="btn btn-default"
                                       role="button">See recipe</a>
                                </p>
                            </li>
                        </ul>
                    </c:forEach>
                    <br><br>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
