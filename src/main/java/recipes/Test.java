package recipes;

import hibernate.util.HibernateUtil;
import org.hibernate.Session;

public class Test {

    public static void main(String[] args) throws Exception {
        Session s = HibernateUtil.openSession().getSession();

//        Advertisement o  = s.find(Advertisement.class, 1);
        //User u = s.find(User.class, 1);

        s.close();
    }

}
