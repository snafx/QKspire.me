<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.*"%>
<%@ page import="java.util.Optional" %>

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

            <c:import url="category.jsp"/>

        </div>
    </div>

    <!-- random recipes -->
   
    <div class="container ad">
        <div class="media panel">
            <div class="media-left media-middle">
                <a href="#">
                    <img class="media-object small-object" src="http://www.hamburgerhamlet.com/wp-content/uploads/2014/11/the-hamburger-hamlet-sherman-oaks-34.jpg" alt="no photo">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">Middle aligned media</h4>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi, hic fugiat id illo quod porro quam corporis sint quidem blanditiis quo quas reprehenderit officia! Quibusdam magni ipsa voluptas ullam molestiae.
                <h3 class="price">
                    50.000 zł
                </h3>
            </div>
        </div>
        <div class="media panel">
            <div class="media-left media-middle">
                <a href="#">
                    <img class="media-object small-object" src="https://www.kingsford.com/wp-content/uploads/2014/11/kfd-hoetosteak-Steak_4_0323-1024x621.jpg" alt="no photo">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">Middle aligned media</h4>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi, hic fugiat id illo quod porro quam corporis sint quidem blanditiis quo quas reprehenderit officia! Quibusdam magni ipsa voluptas ullam molestiae.
                <h3 class="price">
                    50.000 zł
                </h3>
            </div>
        </div>
        <div class="media panel">
            <div class="media-left media-middle">
                <a href="#">
                    <img class="media-object small-object" src="http://www.hamburgerhamlet.com/wp-content/uploads/2014/11/the-hamburger-hamlet-sherman-oaks-34.jpg" alt="no photo">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">Middle aligned media</h4>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi, hic fugiat id illo quod porro quam corporis sint quidem blanditiis quo quas reprehenderit officia! Quibusdam magni ipsa voluptas ullam molestiae.
                <h3 class="price">
                    50.000 zł
                </h3>
            </div>
        </div>
        <div class="media panel">
            <div class="media-left media-middle">
                <a href="#">
                    <img class="media-object small-object" src="http://www.kraftcanada.com/-/media/kraft%20canada/recipes/620x423/c/chocolate-caramel-brownies-152180.jpg?db=web&h=423&w=620" alt="no photo">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">Middle aligned media</h4>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi, hic fugiat id illo quod porro quam corporis sint quidem blanditiis quo quas reprehenderit officia! Quibusdam magni ipsa voluptas ullam molestiae.
                <h3 class="price">
                    50.000 zł
                </h3>
            </div>
        </div>
        <div class="media panel">
            <div class="media-left media-middle">
                <a href="#">
                    <img class="media-object small-object" src="https://www.kingsford.com/wp-content/uploads/2014/11/kfd-hoetosteak-Steak_4_0323-1024x621.jpg" alt="no photo">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">Middle aligned media</h4>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi, hic fugiat id illo quod porro quam corporis sint quidem blanditiis quo quas reprehenderit officia! Quibusdam magni ipsa voluptas ullam molestiae.
                <h3 class="price">
                    50.000 zł
                </h3>
            </div>
        </div>
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