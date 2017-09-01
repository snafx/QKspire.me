package recipes.servlets;

import recipes.model.Reviews;
import recipes.repository.ReviewRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AddReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Integer authorId = 0;
        authorId = (Integer) req.getSession().getAttribute("authorId");

        Integer recipeId = 0;
        recipeId = Integer.parseInt(req.getParameter("recipeId"));

        if (authorId == null) {
            resp.sendRedirect("login.jsp");
        } else {
            String text;
            text = req.getParameter("review");
            if (isNotValid(text)) {
                PrintWriter pw = resp.getWriter();
                pw.write("Review can't be empty! Write something...");
            }

            Reviews addReview = new Reviews(text);
            ReviewRepository.persist(addReview, authorId, recipeId);

            String redirect = resp.encodeRedirectURL(req.getContextPath() + "/recipe.jsp?recipeId=" + recipeId);
            resp.sendRedirect(redirect);
        }
    }

    private boolean isNotValid(String text) {
        return text.isEmpty();
    }
}
