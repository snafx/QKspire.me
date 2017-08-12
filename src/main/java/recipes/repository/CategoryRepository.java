package recipes.repository;

import recipes.model.CATEGORY;
import recipes.model.dto.CategoryDTO;

import java.util.ArrayList;
import java.util.List;

public class CategoryRepository {

    public static List<CategoryDTO> findAll() {
        List<CategoryDTO> categories = new ArrayList<>();
        categories.add(new CategoryDTO("MEAT", CATEGORY.MEAT));
        categories.add(new CategoryDTO("FISH", CATEGORY.FISH));
        categories.add(new CategoryDTO("VEGETERIAN", CATEGORY.VEGETARIAN));
        categories.add(new CategoryDTO("DESSERTS", CATEGORY.DESSERTS));
        return categories;
    }

    public static CategoryDTO findByCategory(CATEGORY category) {
        return findAll().stream()
                .filter(e -> e.getCategory().equals(category))
                .findFirst().get();
    }
}
