package kr.co.namu.book.user;

import com.sun.net.httpserver.HttpPrincipal;
import kr.co.namu.book.ExerciseVO;
import kr.co.namu.book.HistoryVO;
import kr.co.namu.user.member.UserMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequestMapping("user/member")
@Controller("userHistoryController")
public class HistoryController {
    @Autowired private HistoryServiceImpl service;

    @RequestMapping("/hitoryConfirm")
    public String history(ExerciseVO exerciseVO, HttpSession session, Model model){
        model.addAttribute("list", 1);

        String nextPage;

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");

        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        int historyVOs = service.history_list(exerciseVO);
        if(historyVOs > 0){
            nextPage = "redirect:/user/member/exerStatus";
        }else{
            nextPage = "user/member/login_ng";
        }
        return nextPage;
    }
    @RequestMapping("/exerStatus")
    public String exerStatus(ExerciseVO exerciseVO,HttpSession session, Model model){
        model.addAttribute("list", 1);

        String nextPage;
        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        List<ExerciseVO> exer_status = service.exer_status(exerciseVO);

        if(!exer_status.isEmpty()){
            model.addAttribute("status",exer_status);
            nextPage = "/nav/exercise_history";
        }else{
            nextPage = "user/member/login_ng";
        }

        return nextPage;
    }

    @RequestMapping("/exerCheck")
    public String exerCheck(ExerciseVO exerciseVO, HttpSession session, Model model){
        model.addAttribute("list", 1);

        String nextPage;
        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        int checkVOs = service.exer_check(exerciseVO);
        if(checkVOs > 0){
            nextPage = "redirect:/user/member/exerStatus";
        }else{
            nextPage = "user/member/login_ng";
        }
        return nextPage;

    }

}
