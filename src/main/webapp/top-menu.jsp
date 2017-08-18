<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.*"%>
<%@ page import="java.util.Optional" %>

<%
    Integer authorId = (Integer) request.getSession().getAttribute("authorId");
    pageContext.setAttribute("authorId", authorId);
    if (authorId != null) {
        Optional<Author> author = AuthorRepository.findById(authorId);
        if (author.isPresent()) {
            String loggedAuthor = author.get().getUsername();
            pageContext.setAttribute("loggedAuthor", loggedAuthor);
        }
    }
%>



        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp"><img alt="Brand Logo" src="res/img/logo3.png"></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">Home</a></li>
                <li><a href="#">Products</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="recipes.jsp">Recipes<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="recipes.jsp?category=MEAT">Meat</a></li>
                        <li><a href="recipes.jsp?category=FISH">Fish</a></li>
                        <li><a href="recipes.jsp?category=VEGETARIAN">Vegetarian</a></li>
                        <li><a href="recipes.jsp?category=DESSERTS">Deserts</a></li>
                        <li><a href="recipes-all.jsp">All Recipes</a></li>
                    </ul>
                </li>
                <li><a href="add-recipe.jsp">Add new recipe</a></li>
            </ul>
            <c:if test="${! empty loggedAuthor}">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> Signed as ${loggedAuthor}<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="logout">Sign Out</a></li>
                        </ul>
                    </li>
                </ul>
            </c:if>
            <c:if test="${empty loggedAuthor}">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="sign-up.jsp"><span class="glyphicon glyphicon-user"></span> &nbsp Sign Up</a></li>
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> &nbsp Login</a></li>
                </ul>
            </c:if>
        </div>