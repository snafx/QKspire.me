<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="recipes.repository.*,java.util.List,recipes.model.dto.CategoryDTO" %>


<!-- list of categories -->
<c:set var="categoryList" value="${CategoryRepository.findAll()}"/>

<c:forEach items="${categoryList}" var="categoryDTO">
    <div class="btn-group col-md-3" role="group">
        <button type="submit" class="btn category">
                <a href="recipes.jsp?category=${categoryDTO.category}"> ${categoryDTO.name} </a>
        </button>
    </div>
</c:forEach>