package kr.co.namu.book.user;

import kr.co.namu.book.ExerciseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExerciseServiceImpl implements ExerciseService{

    @Autowired private ExerciseDAO dao;

    @Override // 운동 일지 등록
    public void exercise_insert(ExerciseVO exerciseVO) {
        dao.exercise_insert(exerciseVO);

    }

    @Override // 운동 현황 보기
    public List<ExerciseVO> exercise_list(ExerciseVO exerciseVO) {
        return dao.exercise_list(exerciseVO);
    }

    @Override
    public int exercise_deleteOne(ExerciseVO exerciseVO) {
        return dao.exercise_deleteOne(exerciseVO);
    }

    @Override
    public int exercise_deleteAll(ExerciseVO exerciseVO) {
        return dao.exercise_deleteAll(exerciseVO);
    }






/*
    @Override // 운동 일지 수정
    public void exercise_update(ExerciseVO vo) {

    }

    @Override // 운동 일지 삭제
    public void exercise_delete(String u_m_id) {

    }*/
}
