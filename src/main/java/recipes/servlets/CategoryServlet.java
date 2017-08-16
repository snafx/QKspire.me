package recipes.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CategoryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("MEAT".equals(action)) {
            resp.sendRedirect("recipes.jsp?category=" + action);
        } else if ("FISH".equals(action)) {
            resp.sendRedirect("recipes.jsp?category=" + action);
        } else if ("VEGETARIAN".equals(action)) {
            resp.sendRedirect("recipes.jsp?category=" + action);
        } else if ("DESSERTS".equals(action)) {
            resp.sendRedirect("recipes.jsp?category=" + action);
        }
    }
}
