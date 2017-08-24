package recipes.repository;


import hibernate.util.HibernateUtil;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.query.Query;
import recipes.model.Reviews;

import java.util.Optional;

public class ReviewRepository {
    final static Logger logger = Logger.getLogger(AuthorRepository.class);

    public static Integer persist(Reviews reviews, Integer authorId, Integer recipeId) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            session.getTransaction().begin();
            reviews.setReviewAuthor(AuthorRepository.findById(authorId).get());
            reviews.setRecipeId(RecipeRepository.findById(recipeId).get());
            session.saveOrUpdate(reviews);
            session.getTransaction().commit();
            return reviews.getId();
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return 0;
        } finally {
            session.close();
        }
    }

    public static Optional<Reviews> findById(Integer id) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            String hql = "SELECT e FROM Reviews e WHERE e.id=:id";
            Query<Reviews> query = session.createQuery(hql, Reviews.class);
            query.setParameter("id", id);
            return Optional.ofNullable((Reviews) query.getSingleResult());
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return Optional.empty();
        } finally {
            session.close();
        }
    }
}
