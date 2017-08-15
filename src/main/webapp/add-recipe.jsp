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

    <br><br><br><br><br>

<!-- add new recipe form -->

  <div class="container category">
    <div class="col-md-6">
        <h2>Add new recipe:</h2>
    </div>
</div>
<div class="container ad">
   <form action="add-new-recipe" method="post">
   <div class="col-md-8">
        <div class="form-group">
            <label>Recipe name:</label>
            <input class="form-control" placeholder="what do you want to share with us?" name="recipeTitle" type="text" maxlength="69" required/>
        </div>
        <div class="form-group">
           <label>Short recipe description:</label>
           <input class="form-control" placeholder="what is it?" name="recipeDesc" type="text" maxlength="255" required/>
        </div>
        <div class="form-group">
            <label>Ingredients:</label>
            <input class="form-control" placeholder="list of ingredients" name="ingredient1" type="text" required/>
        </div>
        <div class="form-group">
            <label>Method:</label>
            <textarea class="form-control" rows="6" placeholder="tell us how to make it..." name="recipeMethod" type="text" maxlength="999" required></textarea>
        </div>
        <div class="form-group">
           <label>Recipe photo link:</label>
           <input class="form-control" placeholder="enter link to recipe photo (http://...)" name="photoLink" type="text" required/>
        </div>
        <%--<div class="form-group">--%>
            <%--<label>Cooked meal photo:</label>--%>
            <%--<input type="file" name="recipe-image" accept="res/img/recipes/*"/>--%>
        <%--</div>--%>
    </div>
    <div class="col-md-4">
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
                    <option value="${difficultyDTO.difficulty}">${difficultyDTO.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Preparation time:</label>
            <input class="form-control" placeholder="time to make?" name="prepTime" type="text" maxlength="10" required/>
        </div>
        <div class="form-group">
            <label>Servings:</label>
            <input class="form-control" placeholder="how many servings?" name="servings" type="text" maxlength="10"/>
        </div>
        <div class="form-group">
            <label>Nutrition:</label>
            <input class="form-control" placeholder="nutrition per serving (in kcal)?" name="nutrition" type="number" min="0" step="0.1"/>
        </div>
    
    </div>
    <div class="col-md-12">
        <div class="form-group">
            <button type="submit" class="btn btn-default col-md-3"> Ready? Add recipe! </button>
        </div>
    </div>
    </form>
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
