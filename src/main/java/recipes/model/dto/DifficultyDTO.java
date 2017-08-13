package recipes.model.dto;

import recipes.model.DIFFICULTY;

public class DifficultyDTO {
    String name;
    DIFFICULTY difficulty;

    public DifficultyDTO(String name, DIFFICULTY difficulty) {
        this.name = name;
        this.difficulty = difficulty;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public DIFFICULTY getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(DIFFICULTY difficulty) {
        this.difficulty = difficulty;
    }
}
