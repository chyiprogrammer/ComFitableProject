package kr.co.namu.book.user;

import kr.co.namu.book.ExerciseVO;

import java.util.List;

public interface ExerciseService { // 내가 필요한건 운동 일지에 등록하는 부분 , 운동 일지를 수정하는 부분 , 운동 일지를 삭제하는 부분

    void exercise_insert(ExerciseVO exerciseVO); // 운동 일지 등록

    List<ExerciseVO> exercise_list(ExerciseVO exerciseVO); // 운동 리스트 보기

    int exercise_deleteOne(ExerciseVO exerciseVO); // 운동 리스트에서 골라서 삭제

}

    /*
    void exercise_update(UserMemberVO vo); // 운동 일지 수정

    void exercise_delete(String u_m_id); // 운동 일지 삭제


}
*/