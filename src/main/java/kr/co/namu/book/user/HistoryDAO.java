package kr.co.namu.book.user;

import kr.co.namu.book.ExerciseVO;
import kr.co.namu.book.HistoryVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class HistoryDAO implements HistoryService{
    @Autowired SqlSession sql;

    @Override
    public void history_insert(HistoryVO historyVO) {
        sql.insert("history.mapper.ing", historyVO);
    }

    @Override
    public int history_list(ExerciseVO exerciseVO) {
        return sql.update("history.mapper.historylist",exerciseVO);
    }

    @Override
    public List<ExerciseVO> history_chart(ExerciseVO exerciseVO) {
        return sql.selectList("history.mapper.chartSee", exerciseVO);
    }

    @Override
    public List<ExerciseVO> exer_status(ExerciseVO exerciseVO) {
        return sql.selectList("history.mapper.exerstatus", exerciseVO);
    }

    @Override
    public int exer_check(ExerciseVO exerciseVO) {
        return sql.update("history.mapper.exercheck",exerciseVO);
    }

    @Override
    public List<ExerciseVO> exer_his_all(ExerciseVO exerciseVO) {
        return sql.selectList("history.mapper.exerhisall", exerciseVO);
    }

}
