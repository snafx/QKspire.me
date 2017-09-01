package recipes.repository;


import hibernate.util.HibernateUtil;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.query.Query;
import recipes.model.Recipe;
import recipes.model.Reviews;

import java.util.Collections;
import java.util.List;

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

    public static List<Reviews> findByRecipeId(Integer id) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            Recipe recipeId = RecipeRepository.findById(id).get();
            String hql = "SELECT e FROM Reviews e WHERE e.recipeId=:id ORDER BY e.id DESC";
            Query<Reviews> query = session.createQuery(hql, Reviews.class);
            query.setParameter("id", recipeId);
            return query.getResultList();
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return Collections.emptyList();
        } finally {
            session.close();
        }
    }
}
