package recipes.repository;

import hibernate.util.HibernateUtil;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import recipes.model.CATEGORY;
import recipes.model.Recipe;

import javax.persistence.Query;
import java.util.*;

public class RecipeRepository {

    final static Logger logger = Logger.getLogger(AuthorRepository.class);

    //add recipe method
    public static Integer persist(Recipe recipe, Integer authorId) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            session.getTransaction().begin();
            //adding author as recipe author
            recipe.setRecipeAuthor(AuthorRepository.findById(authorId).get());
            session.saveOrUpdate(recipe);
            session.getTransaction().commit();
            return recipe.getId();
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return 0;
        } finally {
            session.close();
        }
    }

    //recipe update
    public static boolean merge(Recipe recipe) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            session.getTransaction().begin();
            session.merge(recipe);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return false;
        } finally {
            session.close();
        }
    }

    public static boolean delete(Integer id) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            Optional<Recipe> recipe = findById(id);
            if (recipe.isPresent()) {
                session.getTransaction().begin();
                recipe.get().setIsActive(false); //setting recipe as inactive
                session.merge(recipe.get());
                session.getTransaction().commit();
                return true;
            }
            return false;
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return false;
        } finally {
            session.close();
        }
    }

    public static  List<Recipe> findAllRecipes() {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            String hql = "SELECT e FROM Recipe e ORDER BY e.id DESC";
            Query query = session.createQuery(hql);
            return query.getResultList();
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return Collections.emptyList();
        } finally {
            session.close();
        }
    }

    public static Optional<Recipe> findById(Integer id) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            String hql = "SELECT e FROM Recipe e WHERE e.id=:id";
            Query query = session.createQuery(hql);
            query.setParameter("id", id);
            return Optional.ofNullable((Recipe) query.getSingleResult());
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return Optional.empty();
        } finally {
            session.close();
        }
    }

    //search recipe by searched phrase
    public static List<Recipe> findByPhrase(String phrase) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            String hql = "SELECT e FROM Recipe e WHERE UPPER(e.recipeTitle) "
                    + "LIKE :phrase OR UPPER(e.recipeMethod) LIKE :phrase ORDER BY e.id DESC";
            Query query = session.createQuery(hql);
            query.setParameter("phrase", "%" + phrase.toUpperCase() + "%");
            return query.getResultList();
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return Collections.emptyList();
        } finally {
            session.close();
        }
    }

    public static List<Recipe> findByCategory(CATEGORY category) {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            String hql = "SELECT e FROM Recipe e WHERE e.category=:category";
            Query query = session.createQuery(hql);
            query.setParameter("category", category);
            return query.getResultList();
        } catch (Exception ex) {
            logger.error(ex);
            session.getTransaction().rollback();
            return Collections.emptyList();
        } finally {
            session.close();
        }
    }

    //method to find 6 random recipes
    public static List<Recipe> findRandomSixRecipes() {
        Session session = null;
        try {
            session = HibernateUtil.openSession();
            String hql = "SELECT e FROM Recipe e ORDER BY RAND()";
            Query query = session.createQuery(hql);
            query.setMaxResults(6);
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
