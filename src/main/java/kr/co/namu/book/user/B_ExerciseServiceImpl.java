package kr.co.namu.book.user;

import kr.co.namu.book.B_ExerciseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class B_ExerciseServiceImpl implements B_ExerciseService{

    @Autowired B_ExerciseDAO dao;

    @Override
    public void b_exercise_insert(B_ExerciseVO b_ExerciseVO) {
        dao.b_exercise_insert(b_ExerciseVO);
    }
}
