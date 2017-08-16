<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.dto.CategoryDTO" %>


<!-- list of categories -->
<c:set var="categoryList" value="${CategoryRepository.findAll()}"/>

<c:forEach items="${categoryList}" var="categoryDTO">
    <div class="btn-group col-md-3" role="group">
        <form action="category" method="post">
            <input type="submit" class="btn category" name="action" value="${categoryDTO.name}">
        </form>
    </div>
</c:forEach>



