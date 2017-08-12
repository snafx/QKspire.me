package recipes;

import hibernate.util.HibernateUtil;
import org.hibernate.Session;
import recipes.model.Recipe;

public class Test {

    public static void main(String[] args) throws Exception {
        try (Session s = HibernateUtil.openSession().getSession()) {

            Recipe o = s.find(Recipe.class, 1);
            //User u = s.find(User.class, 1);

            s.close();
        }
    }

}
