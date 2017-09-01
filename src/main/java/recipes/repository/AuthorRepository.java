package recipes.repository;


import hibernate.util.HibernateUtil;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import recipes.model.Author;

import javax.persistence.Query;
import java.util.Optional;

public class AuthorRepository {
    final static Logger logger = Logger.getLogger(AuthorRepository.class);

    public static void persist(Author author) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            session.getTransaction().begin();
            session.persist(author);
            session.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
    }

    public static Optional<Author> findById(Integer id) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            String hql = "SELECT e FROM Author e WHERE e.id=:id";
            Query query = session.createQuery(hql);
            query.setParameter("id", id);
            return Optional.ofNullable((Author) query.getSingleResult());
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return Optional.empty();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    public static Optional<Author> findByEmail(String email) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            String hql = "SELECT e FROM Author e WHERE e.email=:email";
            Query query = session.createQuery(hql);
            query.setParameter("email", email);
            return Optional.ofNullable((Author) query.getSingleResult());
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return Optional.empty();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    public static Optional<Author> findByEmailAndPassword(String email, String password) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            String hql = "SELECT e FROM Author e WHERE e.email=:email AND e.password=:password";
            Query query = session.createQuery(hql);
            query.setParameter("email", email);
            query.setParameter("password", password);
            return Optional.ofNullable((Author) query.getSingleResult());
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return Optional.empty();
        } finally {
            session.close();
        }
    }
}
