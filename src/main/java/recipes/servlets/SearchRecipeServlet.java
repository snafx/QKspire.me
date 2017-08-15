package recipes.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SearchRecipeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String phrase;
        phrase = req.getParameter("phrase");
        //if phrase is null we change it into empty string, because we can't send null in url to jsp
        phrase = (phrase == null) ? "" : phrase;

        resp.sendRedirect("search-results.jsp?phrase=" + phrase);

    }
}
