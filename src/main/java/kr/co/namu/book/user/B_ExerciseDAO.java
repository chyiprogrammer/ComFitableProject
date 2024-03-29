package kr.co.namu.book.user;

import kr.co.namu.book.B_ExerciseVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class B_ExerciseDAO implements B_ExerciseService{
    @Autowired SqlSession sql;
    @Override
    public void b_exercise_insert(B_ExerciseVO b_ExerciseVO) {
        sql.insert("exer.mapper.bodyExer", b_ExerciseVO);
    }
}
