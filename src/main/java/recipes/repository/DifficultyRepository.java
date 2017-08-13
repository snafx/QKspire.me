package recipes.repository;

import recipes.model.DIFFICULTY;
import recipes.model.dto.DifficultyDTO;

import java.util.ArrayList;
import java.util.List;

public class DifficultyRepository {

    public static List<DifficultyDTO> findAll() {
        List<DifficultyDTO> difficultyDTOList = new ArrayList<>();
        difficultyDTOList.add(new DifficultyDTO("Super Easy", DIFFICULTY.SUPER_EASY));
        difficultyDTOList.add(new DifficultyDTO("Not Too Tricky", DIFFICULTY.NOT_TOO_TRICKY));
        difficultyDTOList.add(new DifficultyDTO("Medium Skills", DIFFICULTY.MEDIUM_SKILLS));
        difficultyDTOList.add(new DifficultyDTO("Showing Off", DIFFICULTY.SHOWING_OFF));
        difficultyDTOList.add(new DifficultyDTO("Gordon Ramsay Is My Apprentice!!", DIFFICULTY.GORDON_RAMSAY_IS_MY_APPPRENTICE));
        return difficultyDTOList;
    }

    public static DifficultyDTO findByDifficulty(DIFFICULTY difficulty) {
        return findAll().stream()
                .filter(e -> e.getDifficulty().equals(difficulty))
                .findFirst().get();
    }

}
