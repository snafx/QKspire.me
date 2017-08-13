package recipes.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer authorId = null;
        authorId = (Integer) req.getSession().getAttribute("authorId");

        if (authorId != null) {
            req.getSession().setAttribute("authorId", null);
            resp.sendRedirect("index.jsp");
        } else {
            resp.sendRedirect("index.jsp");
        }
    }
}
