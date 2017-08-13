package recipes.model.dto;

import recipes.model.CATEGORY;

public class CategoryDTO {
    String name;
    CATEGORY category;

    public CategoryDTO(String name, CATEGORY category) {
        this.name = name;
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CATEGORY getCategory() {
        return category;
    }

    public void setCategory(CATEGORY category) {
        this.category = category;
    }
}
