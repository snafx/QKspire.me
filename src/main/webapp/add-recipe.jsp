<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.*"%>
<%@ page import="recipes.model.dto.CategoryDTO" %>
<%@ page import="recipes.model.dto.DifficultyDTO" %>


<%
    List<CategoryDTO> categoryList = CategoryRepository.findAll();
    pageContext.setAttribute("categoryList", categoryList);

    List<DifficultyDTO> difficultyList = DifficultyRepository.findAll();
    pageContext.setAttribute("difficultyList", difficultyList);

    Integer authorId = (Integer) request.getSession().getAttribute("authorId");
    if (authorId == null) {
    response.sendRedirect("login.jsp");
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

    <link rel="stylesheet" href="res/css/style2.css">

</head>

<body>
    <!-- header -->
    
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><img alt="Brand Logo" src="res/img/logo3.png"></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li><a href="#">Products</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="recipes.html">Recipes<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="recipes.html">Meat</a></li>
                            <li><a href="recipes.html">Fish</a></li>
                            <li><a href="recipes.html">Vegetarian</a></li>
                            <li><a href="recipes.html">Deserts</a></li>
                        </ul>
                    </li>
                    <li><a href="add-recipe.jsp">Add new recipe</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="sign-up.html"><span class="glyphicon glyphicon-user"></span> &nbsp Sign Up</a></li>
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> &nbsp Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <br><br><br><br><br>

<!-- add new recipe form -->
  <div class="container category">
    <div class="col-md-6">
        <h2>Add new recipe:</h2>
    </div>
</div>
<div class="container ad">
   <div class="col-md-8">
    <form action="/add-new-recipe" recipeMethod="post">
        <div class="form-group">
            <label>Recipe name:</label>
            <input class="form-control" placeholder="what do you want to share with us?" name="recipeTitle" type="text" required/>
        </div>
        <div class="form-group">
            <label>Ingredients:</label>
            <input class="form-control" placeholder="list of ingredients" name="ingredient1" type="text" required/>
        </div>
        <div class="form-group">
            <label>Method:</label>
            <textarea class="form-control" rows="6" placeholder="tell us how to make it..." name="recipeMethod" type="text" required></textarea>
        </div>
        <div class="form-group">
            <label>Cooked meal photo:</label>
            <input type="file" name="recipe-image" accept="res/img/recipes/*"/>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-default col-md-4"> Ready? Add recipe! </button>
        </div>
       </form>
    </div>
        <div class="col-md-4">
        <form action="add-recipe" recipeMethod="post">
        <div class="form-group">
            <label>Category:</label>
            <select name="category" class="form-control" required>
                <c:forEach items="${categoryList}" var="categoryDTO">
                    <option value="${categoryDTO.category}">${categoryDTO.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Difficulty:</label>
            <select name="difficulty" class="form-control" required>
                <c:forEach items="${difficultyList}" var="difficultyDTO">
                    <option value="${difficultyDTO.difficulty}">${difficultyDTO}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Preparation time:</label>
            <input class="form-control" placeholder="time to make?" name="prepTime" type="text" required/>
        </div>
        <div class="form-group">
            <label>Servings:</label>
            <input class="form-control" placeholder="how many servings?" name="servings" type="text"/>
        </div>
        <div class="form-group">
            <label>Nutrition:</label>
            <input class="form-control" placeholder="nutrition per serving (in kcal)?" name="nutrition" type="number"/>
        </div>
    </form>
    </div>
</div>

  



<br><br><br><br><br><br><br><br><br><br>


   
     

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
                <a href="recipes.html">Recipes</a>
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
