package recipes.model;

import javax.persistence.*;

@Entity
public class RecipePhoto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer photoId;

    @Lob
    private byte[] recipePhoto;

    public RecipePhoto() {
    }


    public Integer getPhotoId() {
        return photoId;
    }

    public void setPhotoId(Integer photoId) {
        this.photoId = photoId;
    }

    public byte[] getRecipePhoto() {
        return recipePhoto;
    }

    public void setRecipePhoto(byte[] recipePhoto) {
        this.recipePhoto = recipePhoto;
    }
}
