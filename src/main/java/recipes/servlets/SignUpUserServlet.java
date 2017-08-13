package recipes.servlets;

import recipes.model.Author;
import recipes.repository.AuthorRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SignUpUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username;
        String password;
        String email;
        String cityName;

        username = req.getParameter("username");
        password = req.getParameter("password");
        email = req.getParameter("email");
        cityName = req.getParameter("cityName");

        if (isNotValid(username, password, email, cityName)) {
            resp.sendRedirect("sign-up.jsp");
        } else {
            Author author = new Author(username, password, email, cityName);
            AuthorRepository.persist(author);
            resp.sendRedirect("login.jsp");
        }
    }

    private boolean isNotValid(String username, String password, String email, String cityName) {
        return username.isEmpty() || password.isEmpty() || email.isEmpty() || cityName.isEmpty();
    }
}
