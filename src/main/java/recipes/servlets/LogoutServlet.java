package recipes.servlets;

import recipes.model.Author;
import recipes.repository.AuthorRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer authorId = null;
        authorId = (Integer) req.getSession().getAttribute("authorId");

        if (authorId != null) {
            Optional<Author> author = AuthorRepository.findById(authorId);
            if (author.isPresent()) {
                req.getSession().setAttribute("authorId", null);
                resp.sendRedirect("index.jsp");
            } else {
                resp.getWriter().write("User not found");
            }
        } else {
            resp.getWriter().write("No logged users");
        }
    }
}
