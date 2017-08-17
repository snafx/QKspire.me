package recipes.servlets;

import com.sun.org.apache.regexp.internal.RE;
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
            String ingredient2;
            String ingredient3;
            String ingredient4;
            String ingredient5;
            String ingredient6;
            String ingredient7;
            String ingredient8;
            String ingredient9;
            String ingredient10;
            String recipeMethod2;
            String recipeMethod3;
            String recipeMethod4;
            String recipeMethod5;

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
            ingredient2 = req.getParameter("ingredient2");
            ingredient3 = req.getParameter("ingredient3");
            ingredient4 = req.getParameter("ingredient4");
            ingredient5 = req.getParameter("ingredient5");
            ingredient6 = req.getParameter("ingredient6");
            ingredient7 = req.getParameter("ingredient7");
            ingredient8 = req.getParameter("ingredient8");
            ingredient9 = req.getParameter("ingredient9");
            ingredient10 = req.getParameter("ingredient10");
            recipeMethod2 = req.getParameter("recipeMethod2");
            recipeMethod3 = req.getParameter("recipeMethod3");
            recipeMethod4 = req.getParameter("recipeMethod4");
            recipeMethod5 = req.getParameter("recipeMethod5");

            if (isNotValid(recipeTitle, ingredient1, recipeMethod, servings, preparationTime, nutrition, recipeDescription, recipePhotoLink)) {
                PrintWriter pw = resp.getWriter();
                pw.write("error"); //TODO create better error log
            }

            Recipe addRecipe = new Recipe(recipeTitle, category, difficulty, servings, preparationTime, nutrition, ingredient1, recipeMethod, recipeDescription, recipePhotoLink,
                    ingredient2, ingredient3, ingredient4, ingredient5, ingredient6, ingredient7, ingredient8, ingredient9, ingredient10, recipeMethod2, recipeMethod3, recipeMethod4, recipeMethod5);
            RecipeRepository.persist(addRecipe, authorId);

//            resp.sendRedirect("recipes.jsp?category=" + addRecipe.getCategory());
            resp.sendRedirect("index.jsp");
        }
    }

    private boolean isNotValid(String recipeTitle, String ingredient1, String recipeMethod, String servings, String preparationTime, BigDecimal nutrition, String recipeDescription, String recipePhotoLink) {
        return recipeTitle.isEmpty() || ingredient1.isEmpty() || recipeMethod.isEmpty() || servings.isEmpty() || preparationTime.isEmpty() || nutrition.compareTo(BigDecimal.ZERO) == -1 || recipeDescription.isEmpty() || recipePhotoLink.isEmpty();
    }
}
