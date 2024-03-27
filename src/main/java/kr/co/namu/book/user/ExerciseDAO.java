package kr.co.namu.book.user;

import kr.co.namu.book.ExerciseVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ExerciseDAO implements ExerciseService{

    @Autowired SqlSession sql;

    public void exercise_insert(ExerciseVO exerciseVO){
        System.out.println("[ExerciseDAO] insertExercise()");

        sql.insert("exer.mapper.start", exerciseVO);
    }

    @Override
    public List<ExerciseVO> exercise_list(ExerciseVO exerciseVO) {
        return sql.selectList("exer.mapper.exerList",exerciseVO);
    }

}
