<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.*"%>
<%@ page import="java.util.Optional" %>

<%
    Integer recipeId = Integer.valueOf(request.getParameter("recipeId"));
    Optional<Recipe> recipe = RecipeRepository.findById(recipeId);
    if (recipe.isPresent()) {
        pageContext.setAttribute("recipe", recipe.get());
    }

    DIFFICULTY difficulty = recipe.get().getDifficulty();
    String diffName = DifficultyRepository.findByDifficulty(difficulty).getName();
    pageContext.setAttribute("difficultyName", diffName);
%>

<c:set value="${recipe}" var="recipe" />
<c:set value="${difficultyName}" var="recipeDiff"/>


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
                                    <div class="col-md-3">
                                        <ul>
                                            <li>2</li>
                                            <li>150g</li>
                                            <li>5</li>
                                            <li>400ml</li>
                                            <li>3</li>
                                            <li>100g</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-9">
                                        <ul style="list-style-type: none">
                                            <li>${recipe.ingredient1}</li>
                                            <li>lorem ipsum dolor</li>
                                            <li>lorem ipsum dolor</li>
                                            <li>lorem ipsum</li>
                                            <li>lorem ipsum dolor met</li>
                                            <li>lorem ipsum dolor met</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="recipeMethod" class="tab-pane fade">
                        <h3>Method:</h3>
                        <ol>
                            <li>
                                <p>${recipe.recipeMethod}</p>
                            </li>
                            <li>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam assumenda sunt, repudiandae sint amet esse quisquam. Ipsam enim laudantium quam veniam atque magni inventore esse illo, repellat, a numquam, beatae.</p>
                            </li>
                            <li>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam assumenda sunt, repudiandae sint amet esse quisquam. Ipsam enim laudantium quam veniam atque magni inventore esse illo, repellat, a numquam, beatae.</p>
                            </li>
                        </ol>
                    </div>
                    <div id="comments" class="tab-pane fade">
                        <h3>Comments:</h3>
                        <ul>
                            <li>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam assumenda sunt, repudiandae sint amet esse quisquam. Ipsam enim laudantium quam veniam atque magni inventore esse illo, repellat, a numquam, beatae.</p>
                            </li>
                            <li>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam assumenda sunt, repudiandae sint amet esse quisquam. Ipsam enim laudantium quam veniam atque magni inventore esse illo, repellat, a numquam, beatae.</p>
                            </li>
                            <li>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam assumenda sunt, repudiandae sint amet esse quisquam. Ipsam enim laudantium quam veniam atque magni inventore esse illo, repellat, a numquam, beatae.</p>
                            </li>
                            <li>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam assumenda sunt, repudiandae sint amet esse quisquam. Ipsam enim laudantium quam veniam atque magni inventore esse illo, repellat, a numquam, beatae.</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="col-md-12">
                    <div class="well well-sm">
                    <img class="media-object img-responsive center-block" src="${recipe.recipePhotoLink}" alt="no recipe photo">
                    <div><br></div>
                    ${recipe.recipeDescription}
                    </div>
                </div>
            </div>
        </div>
    </div>




    <br><br><br><br><br><br><br> <br><br><br><br><br><br><br> <br><br><br><br><br><br><br>




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
