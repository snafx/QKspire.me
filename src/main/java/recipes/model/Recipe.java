package recipes.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Set;

@Entity
public class Recipe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) //autoincrement
    @Column(unique = true)
    private Integer id;

    @JoinColumn(nullable = false)
    @ManyToOne(cascade = CascadeType.ALL)
    private Author recipeAuthor; //joining with another column

    @Column(nullable = false)
    private String recipeTitle;

    @Lob
    @Column(nullable = false, columnDefinition = "mediumblob")
    private byte[] recipeImage;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    CATEGORY category;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    DIFFICULTY difficulty;

    @Column(nullable = false)
    private String servings;

    @Column(nullable = false)
    private String preparationTime;

    @Column (nullable = false)
    private Integer nutrition;

    @Column(nullable = false)
    private String ingredient1;

    @Column(nullable = false)
    private String ingredient2;

    @Column(nullable = false)
    private String ingredient3;

    @Column
    private String ingredient4;

    @Column
    private String ingredient5;

    @Column
    private String ingredient6;

    @Column
    private String ingredient7;

    @Column
    private String ingredient8;

    @Column
    private LocalDate dateAdded;

    @Column(nullable = false, length = 1000)
    private String recipeMethod;

    @Column
    private String reviews;




    public Recipe() {
    }

    public Recipe(Author recipeAuthor, String recipeTitle, byte[] recipeImage, CATEGORY category, DIFFICULTY difficulty, String servings, String preparationTime, Integer nutrition, String ingredient1, String ingredient2, String ingredient3, LocalDate dateAdded, String recipeMethod) {
        this.recipeAuthor = recipeAuthor;
        this.recipeTitle = recipeTitle;
        this.recipeImage = recipeImage;
        this.category = category;
        this.difficulty = difficulty;
        this.servings = servings;
        this.preparationTime = preparationTime;
        this.nutrition = nutrition;
        this.ingredient1 = ingredient1;
        this.ingredient2 = ingredient2;
        this.ingredient3 = ingredient3;
        this.ingredient4 = null;
        this.ingredient5 = null;
        this.ingredient6 = null;
        this.ingredient7 = null;
        this.ingredient8 = null;
        this.dateAdded = LocalDate.now();
        this.recipeMethod = recipeMethod;
        this.reviews = null;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Author getRecipeAuthor() {
        return recipeAuthor;
    }

    public void setRecipeAuthor(Author recipeAuthor) {
        this.recipeAuthor = recipeAuthor;
    }

    public String getRecipeTitle() {
        return recipeTitle;
    }

    public void setRecipeTitle(String recipeTitle) {
        this.recipeTitle = recipeTitle;
    }

    public byte[] getRecipeImage() {
        return recipeImage;
    }

    public void setRecipeImage(byte[] recipeImage) {
        this.recipeImage = recipeImage;
    }

    public CATEGORY getCategory() {
        return category;
    }

    public void setCategory(CATEGORY category) {
        this.category = category;
    }

    public DIFFICULTY getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(DIFFICULTY difficulty) {
        this.difficulty = difficulty;
    }

    public String getServings() {
        return servings;
    }

    public void setServings(String servings) {
        this.servings = servings;
    }

    public String getPreparationTime() {
        return preparationTime;
    }

    public void setPreparationTime(String preparationTime) {
        this.preparationTime = preparationTime;
    }

    public Integer getNutrition() {
        return nutrition;
    }

    public void setNutrition(Integer nutrition) {
        this.nutrition = nutrition;
    }

    public String getIngredient1() {
        return ingredient1;
    }

    public void setIngredient1(String ingredient1) {
        this.ingredient1 = ingredient1;
    }

    public String getIngredient2() {
        return ingredient2;
    }

    public void setIngredient2(String ingredient2) {
        this.ingredient2 = ingredient2;
    }

    public String getIngredient3() {
        return ingredient3;
    }

    public void setIngredient3(String ingredient3) {
        this.ingredient3 = ingredient3;
    }

    public String getIngredient4() {
        return ingredient4;
    }

    public void setIngredient4(String ingredient4) {
        this.ingredient4 = ingredient4;
    }

    public String getIngredient5() {
        return ingredient5;
    }

    public void setIngredient5(String ingredient5) {
        this.ingredient5 = ingredient5;
    }

    public String getIngredient6() {
        return ingredient6;
    }

    public void setIngredient6(String ingredient6) {
        this.ingredient6 = ingredient6;
    }

    public String getIngredient7() {
        return ingredient7;
    }

    public void setIngredient7(String ingredient7) {
        this.ingredient7 = ingredient7;
    }

    public String getIngredient8() {
        return ingredient8;
    }

    public void setIngredient8(String ingredient8) {
        this.ingredient8 = ingredient8;
    }

    public LocalDate getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(LocalDate dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getRecipeMethod() {
        return recipeMethod;
    }

    public void setRecipeMethod(String recipeMethod) {
        this.recipeMethod = recipeMethod;
    }

    public String getReviews() {
        return reviews;
    }

    public void setReviews(String reviews) {
        this.reviews = reviews;
    }
}