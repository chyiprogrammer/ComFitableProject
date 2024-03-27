package kr.co.namu.book.user;

import kr.co.namu.book.ExerciseVO;
import kr.co.namu.book.HistoryVO;

import java.util.List;

public interface HistoryService {
    void history_insert(HistoryVO historyVO);

    int history_list(ExerciseVO exerciseVO);

    List<ExerciseVO> exer_status(ExerciseVO exerciseVO);

    int exer_check(ExerciseVO exerciseVO);
}
