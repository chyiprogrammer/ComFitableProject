package kr.co.namu.book.user;

import kr.co.namu.book.ExerciseVO;
import kr.co.namu.book.HistoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryServiceImpl implements HistoryService{
    @Autowired private HistoryDAO dao;

    @Override
    public void history_insert(HistoryVO historyVO) {
        dao.history_insert(historyVO);
    }

    @Override
    public int history_list(ExerciseVO exerciseVO) {
        return dao.history_list(exerciseVO);
    }

    @Override
    public List<ExerciseVO> exer_status(ExerciseVO exerciseVO) {
        return dao.exer_status(exerciseVO);
    }

    @Override
    public int exer_check(ExerciseVO exerciseVO) {
        return dao.exer_check(exerciseVO);
    }

    @Override
    public List<ExerciseVO> exer_his_all(ExerciseVO exerciseVO) {
        return dao.exer_his_all(exerciseVO);
    }
}
