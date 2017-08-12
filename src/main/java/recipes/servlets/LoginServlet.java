package recipes.servlets;

import recipes.model.Author;
import recipes.repository.AuthorRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email;
        String password;

        email = req.getParameter("email");
        password = req.getParameter("password");

        Optional<Author> author = AuthorRepository.findByEmailAndPassword(email, password);
        if (author.isPresent()) {
            req.getSession().setAttribute("authorId", author.get().getId());
            resp.sendRedirect("index.jsp");
        } else {
            resp.getWriter().write("Wrong login or password!");
        }
    }
}
