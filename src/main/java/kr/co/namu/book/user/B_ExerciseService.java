package kr.co.namu.book.user;

import kr.co.namu.book.B_ExerciseVO;

import java.util.List;

public interface B_ExerciseService {
    void b_exercise_insert(B_ExerciseVO b_ExerciseVO);

    List<B_ExerciseVO> b_exercise_list(B_ExerciseVO b_exerciseVO);
}
