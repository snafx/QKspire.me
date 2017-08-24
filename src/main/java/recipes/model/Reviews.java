package recipes.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Set;

@Entity
public class Reviews {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id;

    @Column(nullable = false)
    private String text;

    @Column(nullable = false)
    private LocalDate datePosted;

    @JoinColumn
    @ManyToOne(fetch = FetchType.EAGER)
    private Recipe recipeId;

    @JoinColumn
    @ManyToOne(fetch = FetchType.EAGER)
    private Author reviewAuthor;

    public Reviews() {
    }

    public Reviews(String text) {
        this.text = text;
        this.datePosted = LocalDate.now();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Recipe getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(Recipe recipeId) {
        this.recipeId = recipeId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public LocalDate getDatePosted() {
        return datePosted;
    }

    public void setDatePosted(LocalDate datePosted) {
        this.datePosted = datePosted;
    }

    public Author getReviewAuthor() {
        return reviewAuthor;
    }

    public void setReviewAuthor(Author reviewAuthor) {
        this.reviewAuthor = reviewAuthor;
    }
}
