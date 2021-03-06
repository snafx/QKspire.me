<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.*" %>
<%@ page import="java.util.Optional" %>

<%
    Integer recipeId = Integer.valueOf(request.getParameter("recipeId"));
    Optional<Recipe> recipe = RecipeRepository.findById(recipeId);
    if (recipe.isPresent()) {
        pageContext.setAttribute("recipe", recipe.get());
    }

    List<Reviews> reviewList = ReviewRepository.findByRecipeId(recipeId);
    if (reviewList.isEmpty()) {
        pageContext.setAttribute("warning", "No reviews yet. Be first...");
    }
    pageContext.setAttribute("review", reviewList);

    DIFFICULTY difficulty = recipe.get().getDifficulty();
    String diffName = DifficultyRepository.findByDifficulty(difficulty).getName();
    pageContext.setAttribute("difficultyName", diffName);
%>

<c:set value="${recipe}" var="recipe"/>
<c:set value="${review}" var="reviewList"/>
<c:set value="${difficultyName}" var="recipeDiff"/>


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

<!-- meal racipe -->

<div class="container ad">
    <div>
        <div class="col-md-12">
            <h2>${recipe.recipeTitle}</h2>
            <h6>by ${recipe.recipeAuthor.username} ${recipe.dateAdded}</h6>
            <br>
        </div>

        <div class="col-md-4">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#ingredients">Ingredients</a></li>
                <li><a data-toggle="tab" href="#recipeMethod">Method</a></li>
                <li><a data-toggle="tab" href="#comments">Comments</a></li>
            </ul>
            <br>
            <div class="tab-content">
                <div id="ingredients" class="tab-pane fade in active">
                    <div class="icons">
                        <div class="col-md-6">
                            <ul style="list-style-type:none">
                                <li>
                                    <p><i class="fa fa-clock-o" aria-hidden="true"></i></p>
                                </li>
                                <li>COOKS IN</li>
                                <li>${recipe.preparationTime} mins</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <ul style="list-style-type: none">
                                <li>
                                    <p><i class="fa fa-tasks" aria-hidden="true"></i></p>
                                </li>
                                <li>DIFFICULTY</li>
                                <li>${recipeDiff}</li>
                            </ul>
                        </div>
                    </div>
                    <div class="icons">
                        <div class="col-md-6">
                            <ul style="list-style-type:none">
                                <li>
                                    <p><i class="fa fa-cutlery" aria-hidden="true"></i></p>
                                </li>
                                <li>
                                    SERVINGS
                                </li>
                                <li>${recipe.servings}</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <ul style="list-style-type: none">
                                <li>
                                    <p><i class="fa fa-free-code-camp" aria-hidden="true"></i></p>
                                </li>
                                <li>
                                    NUTRITION
                                </li>
                                <li>est. ${recipe.nutrition} calories</li>
                            </ul>
                        </div>
                    </div>
                    <div>
                        <div class="col-md-12">
                            <h4>Ingredients:</h4>
                            <div>
                                <ul>
                                    <c:if test="${!recipe.ingredient1.equals('')}">
                                        <li>${recipe.ingredient1}</li>
                                    </c:if>
                                    <c:if test="${!recipe.ingredient2.equals('')}">
                                        <li>${recipe.ingredient2}</li>
                                    </c:if>
                                    <c:if test="${!recipe.ingredient3.equals('')}">
                                        <li>${recipe.ingredient3}</li>
                                    </c:if>
                                    <c:if test="${!recipe.ingredient4.equals('')}">
                                        <li>${recipe.ingredient4}</li>
                                    </c:if>
                                    <c:if test="${!recipe.ingredient5.equals('')}">
                                        <li>${recipe.ingredient5}</li>
                                    </c:if>
                                    <c:if test="${!recipe.ingredient6.equals('')}">
                                        <li>${recipe.ingredient6}</li>
                                    </c:if>
                                    <c:if test="${!recipe.ingredient7.equals('')}">
                                        <li>${recipe.ingredient7}</li>
                                    </c:if>
                                    <c:if test="${!recipe.ingredient8.equals('')}">
                                        <li>${recipe.ingredient8}</li>
                                    </c:if>
                                    <c:if test="${!recipe.ingredient9.equals('')}">
                                        <li>${recipe.ingredient9}</li>
                                    </c:if>
                                    <c:if test="${!recipe.ingredient10.equals('')}">
                                        <li>${recipe.ingredient10}</li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="recipeMethod" class="tab-pane fade">
                    <h3>Method:</h3>
                    <ol>
                        <c:if test="${!recipe.recipeMethod.equals('')}">
                            <li><p>${recipe.recipeMethod}</p></li>
                        </c:if>
                        <c:if test="${!recipe.recipeMethod2.equals('')}">
                            <li><p>${recipe.recipeMethod2}</p></li>
                        </c:if>
                        <c:if test="${!recipe.recipeMethod3.equals('')}">
                            <li><p>${recipe.recipeMethod3}</p></li>
                        </c:if>
                        <c:if test="${!recipe.recipeMethod4.equals('')}">
                            <li><p>${recipe.recipeMethod4}</p></li>
                        </c:if>
                        <c:if test="${!recipe.recipeMethod5.equals('')}">
                            <li><p>${recipe.recipeMethod5}</p></li>
                        </c:if>
                    </ol>
                </div>
                <div id="comments" class="tab-pane fade">
                    <form action="add-review" method="post">
                        <input type="hidden" name="recipeId" value="${recipe.id}"/>
                        <div class="form-group">
                            <textarea class="form-control" rows="3" placeholder="what do you think?" name="review"
                                      type="text" maxlength="500"></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-default">LEAVE REVIEW</button>
                        </div>
                    </form>
                    <hr>
                    <h3>Comments:</h3>
                    <h4>${warning}</h4>
                    <c:forEach items="${reviewList}" var="review">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <p>${review.text}</p>
                                <p align="right">
                                    <small>by <b><i>${review.reviewAuthor.username}</i></b>&nbsp <i>${review.datePosted}</i></small>
                                </p>
                            </li>
                        </ul>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="col-md-12">
                <div class="well well-sm">
                    <img class="media-object img-responsive center-block" src="${recipe.recipePhotoLink}"
                         alt="no recipe photo">
                    <div><br></div>
                    ${recipe.recipeDescription}
                </div>
            </div>
        </div>
    </div>
</div>

<br><br><br><br><br><br><br>

</body>
</html>
