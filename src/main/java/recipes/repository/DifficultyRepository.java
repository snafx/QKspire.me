package recipes.repository;

import recipes.model.DIFFICULTY;
import recipes.model.dto.DifficultyDTO;

import java.util.ArrayList;
import java.util.List;

public class DifficultyRepository {

    public static List<DifficultyDTO> findAll() {
        List<DifficultyDTO> difficultyList = new ArrayList<>();
        difficultyList.add(new DifficultyDTO("Super Easy", DIFFICULTY.SUPER_EASY));
        difficultyList.add(new DifficultyDTO("Not Too Tricky", DIFFICULTY.NOT_TOO_TRICKY));
        difficultyList.add(new DifficultyDTO("Medium Skills", DIFFICULTY.MEDIUM_SKILLS));
        difficultyList.add(new DifficultyDTO("Showing Off", DIFFICULTY.SHOWING_OFF));
        difficultyList.add(new DifficultyDTO("Gordon Ramsay Is My Apprentice!!", DIFFICULTY.GORDON_RAMSAY_IS_MY_APPPRENTICE));
        return difficultyList;
    }

    public static DifficultyDTO findByDifficulty(DIFFICULTY difficulty) {
        return findAll().stream()
                .filter(e -> e.getDifficulty().equals(difficulty))
                .findFirst().get();
    }

}
