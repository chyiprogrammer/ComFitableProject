package kr.co.namu.book.user;

import kr.co.namu.book.ExerciseVO;
import kr.co.namu.user.member.UserMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@RequestMapping("user/member")

@Controller("user.ExerciseController")
public class ExerciseController {
    @Autowired private ExerciseServiceImpl service;

    @RequestMapping("/exerciseType/Main") // 메인 페이지로 가는 jsp
    public String exerciseType(Model model){

        model.addAttribute("list", 1);
        System.out.println("[ExerciseController:exerciseType()]");

        return "nav/exercise_type";

    }

    @PostMapping("/exerciseType/Main_Confirm") // 메인 페이지에서 form 보내는 url
    public String exerciseTypeConfirm(ExerciseVO exerciseVO, HttpSession session, Model model) {

        System.out.println("ExerciseVO에 정보 넣기");
        model.addAttribute("list", 1);

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        service.exercise_insert(exerciseVO);

        return "nav/exercise_type";
    }


    // 운동 부위에 따라 url 따로
    
        @RequestMapping("/exerciseType/chest_yet")
        public String exerciseTypeChest_yet(Model model){

            model.addAttribute("list", 1);
            System.out.println("가슴 운동으로 이동만");

            return "user/exerciseType/chest";

        }
    
        @RequestMapping("/exerciseType/chest") // chest에서 from 보내는 url
        public String exerciseTypeChest(ExerciseVO exerciseVO, HttpSession session, Model model){

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        service.exercise_insert(exerciseVO);

        System.out.println("가슴 값 데이터베이스로");

        return "user/exerciseType/chest";
    } // chest



    @RequestMapping("/exerciseType/arm_yet")
    public String exerciseTypeArm_yet(Model model){

        model.addAttribute("list", 1);
        System.out.println("팔 운동으로 이동만");

        return "user/exerciseType/arm";

    }

    @RequestMapping("/exerciseType/arm") // arm에서 from 보내는 url
    public String exerciseTypeArm(ExerciseVO exerciseVO, HttpSession session, Model model){

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        service.exercise_insert(exerciseVO);

        System.out.println("팔 값 데이터베이스로");

        return "user/exerciseType/arm";
    } // arm



    @RequestMapping("/exerciseType/core_yet")
    public String exerciseTypeCore_yet(Model model){

        model.addAttribute("list", 1);
        System.out.println("복근 운동으로 이동만");

        return "user/exerciseType/core";

    }

    @RequestMapping("/exerciseType/core") // core에서 from 보내는 url
    public String exerciseTypeCore(ExerciseVO exerciseVO, HttpSession session, Model model){

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        service.exercise_insert(exerciseVO);

        System.out.println("복근 값 데이터베이스로");

        return "user/exerciseType/core";
    } // core


    @RequestMapping("/exerciseType/low_yet")
    public String exerciseTypeLow_yet(Model model){

        model.addAttribute("list", 1);
        System.out.println("하체 운동으로 이동만");

        return "user/exerciseType/low";

    }
    
    @RequestMapping("/exerciseType/low") // low에서 from 보내는 url
    public String exerciseTypeLow(ExerciseVO exerciseVO, HttpSession session, Model model){

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        service.exercise_insert(exerciseVO);

        System.out.println("하체 값 데이터베이스로");

        return "user/exerciseType/low";
    } // low



    @RequestMapping("/exerciseType/shoulder_yet")
    public String exerciseTypeShoulder_yet(Model model){

        model.addAttribute("list", 1);
        System.out.println("어깨 운동으로 이동만");

        return "user/exerciseType/shoulder";

    }


    @RequestMapping("/exerciseType/shoulder") // shoulder에서 from 보내는 url
    public String exerciseTypeShoulder(ExerciseVO exerciseVO, HttpSession session, Model model){

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        service.exercise_insert(exerciseVO);

        System.out.println("어깨 값 데이터베이스로");

        return "user/exerciseType/shoulder";
    } // shoulder



    // 운동 부위에 따른 url 끝



    @RequestMapping("/exerciseDia")
    public String exerciseDia(ExerciseVO exerciseVO, HttpSession session, Model model){

        System.out.println("[ExerciseController:exerciseDia()]");

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        List<ExerciseVO> exerciseVOs = service.exercise_list(exerciseVO);

        int totalVolume = 0;
        for(ExerciseVO exerVO : exerciseVOs){
            totalVolume += exerVO.getExer_totalVolume();
        }

        model.addAttribute("exerciseVOs",exerciseVOs);
        model.addAttribute("totalVolume", totalVolume);


        if(exerciseVOs.isEmpty()){
            return "nav/exercise_none";
        }

        return "nav/exercise_dia";
    }

    @RequestMapping("/exerciseDiaConfirm")
    public String exerciseDiaConfirm(ExerciseVO exerciseVO, HttpSession session, Model model){

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        List<ExerciseVO> exerciseVOs = service.exercise_list(exerciseVO);

        int totalVolume = 0;
        for(ExerciseVO exerVO : exerciseVOs){
            totalVolume += exerVO.getExer_totalVolume();
        }

        model.addAttribute("exerciseVOs",exerciseVOs);
        model.addAttribute("totalVolume", totalVolume);

        if(exerciseVOs.isEmpty()){
            return "nav/exercise_none";
        }

        return "nav/exercise_history";
    }


/*    @RequestMapping(value="/exerciseProg", method= RequestMethod.GET)

    public String exerciseProg(Model model){

            System.out.println("[ExerciseController:exerciseProg()]");

            String nextPage = "/user/member/exercise_prog";

            List<ExerciseVO> ExerciseVOs = ExerciseService.listupExercise();

            model.addAttribute("ExerciseVOs" , ExerciseVOs);

            return nextPage;

        }*/


    }
