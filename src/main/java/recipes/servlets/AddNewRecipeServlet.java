package recipes.servlets;

import recipes.model.CATEGORY;
import recipes.model.DIFFICULTY;
import recipes.model.Recipe;
import recipes.repository.RecipeRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

public class AddNewRecipeServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Integer authorId = 0;
        authorId = (Integer) req.getSession().getAttribute("authorId");
        if (authorId == null) {
            resp.sendRedirect("login.jsp");
        } else {
            String recipeTitle = "";
            String ingredient1;
            String recipeMethod;
            String servings;
            CATEGORY category = null;
            DIFFICULTY difficulty = null;
            String preparationTime;
            BigDecimal nutrition = BigDecimal.ZERO;
            String recipeDescription;
            String recipePhotoLink;

            try {
                recipeTitle = req.getParameter("recipeTitle");
                category = CATEGORY.valueOf(req.getParameter("category"));
                difficulty = DIFFICULTY.valueOf(req.getParameter("difficulty"));
                nutrition = new BigDecimal(req.getParameter("nutrition"));
            } catch (Exception e) {
                e.printStackTrace();
            }
            ingredient1 = req.getParameter("ingredient1");
            recipeMethod = req.getParameter("recipeMethod");
            servings = req.getParameter("servings");
            preparationTime = req.getParameter("prepTime");
            recipeDescription = req.getParameter("recipeDesc");
            recipePhotoLink = req.getParameter("photoLink");

            if (isNotValid(recipeTitle, ingredient1, recipeMethod, servings, preparationTime, nutrition, recipeDescription, recipePhotoLink)) {
                PrintWriter pw = resp.getWriter();
                pw.write("error"); //TODO create better error log
            }



            Recipe addRecipe = new Recipe(recipeTitle, category, difficulty, servings, preparationTime, nutrition, ingredient1, recipeMethod, recipeDescription, recipePhotoLink);
            RecipeRepository.persist(addRecipe, authorId);
//            resp.sendRedirect("recipes.jsp?category=" + addRecipe.getCategory());
            resp.sendRedirect("index.jsp");
        }
    }

    private boolean isNotValid(String recipeTitle, String ingredient1, String recipeMethod, String servings, String preparationTime, BigDecimal nutrition, String recipeDescription, String recipePhotoLink) {
        return recipeTitle.isEmpty() || ingredient1.isEmpty() || recipeMethod.isEmpty() || servings.isEmpty() || preparationTime.isEmpty() || nutrition.compareTo(BigDecimal.ZERO) == -1 || recipeDescription.isEmpty() || recipePhotoLink.isEmpty();
    }
}
