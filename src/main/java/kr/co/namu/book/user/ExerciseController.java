package kr.co.namu.book.user;

import kr.co.namu.book.ExerciseVO;
import kr.co.namu.user.member.UserMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    // 운동 부위에 따라 url 시작

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

    // 가슴 루틴 추천
    @RequestMapping("/exerciseType/chest/rutin")
    public String exerciseTypeChest(HttpSession session, Model model){
        ExerciseVO exerciseVO = new ExerciseVO();

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        ExerciseVO exerciseVO1 = new ExerciseVO();
        exerciseVO1.setExer_id(userMemberVO.getU_m_id());
        exerciseVO1.setExer_name("덤벨 벤치 프레스");
        exerciseVO1.setExer_wgt(8);
        exerciseVO1.setExer_cnt(8);
        exerciseVO1.setExer_set(3);

        ExerciseVO exerciseVO2 = new ExerciseVO();
        exerciseVO2.setExer_id(userMemberVO.getU_m_id());
        exerciseVO2.setExer_name("덤벨 벤치 플라이");
        exerciseVO2.setExer_wgt(8);
        exerciseVO2.setExer_cnt(8);
        exerciseVO2.setExer_set(3);

        ExerciseVO exerciseVO3 = new ExerciseVO();
        exerciseVO3.setExer_id(userMemberVO.getU_m_id());
        exerciseVO3.setExer_name("푸쉬업");
        exerciseVO3.setExer_wgt(1);
        exerciseVO3.setExer_cnt(15);
        exerciseVO3.setExer_set(3);

        service.exercise_insert(exerciseVO1);
        service.exercise_insert(exerciseVO2);
        service.exercise_insert(exerciseVO3);


        System.out.println("가슴 값 데이터베이스로");

        return "user/exerciseType/chest";
    } // 가슴 루틴



    // shoulder
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



    // 어깨 루틴 추천
    @RequestMapping("/exerciseType/shoulder/rutin")
    public String exerciseTypeShoulder(HttpSession session, Model model){
        ExerciseVO exerciseVO = new ExerciseVO();

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        ExerciseVO exerciseVO4 = new ExerciseVO();
        exerciseVO4.setExer_id(userMemberVO.getU_m_id());
        exerciseVO4.setExer_name("덤벨 프론트 레이즈");
        exerciseVO4.setExer_wgt(4);
        exerciseVO4.setExer_cnt(15);
        exerciseVO4.setExer_set(3);

        ExerciseVO exerciseVO5 = new ExerciseVO();
        exerciseVO5.setExer_id(userMemberVO.getU_m_id());
        exerciseVO5.setExer_name("덤벨 사이드 레터럴 레이즈");
        exerciseVO5.setExer_wgt(4);
        exerciseVO5.setExer_cnt(15);
        exerciseVO5.setExer_set(3);

        ExerciseVO exerciseVO6 = new ExerciseVO();
        exerciseVO6.setExer_id(userMemberVO.getU_m_id());
        exerciseVO6.setExer_name("시티드 벤트오버 레터럴 레이즈");
        exerciseVO6.setExer_wgt(4);
        exerciseVO6.setExer_cnt(15);
        exerciseVO6.setExer_set(3);

        service.exercise_insert(exerciseVO4);
        service.exercise_insert(exerciseVO5);
        service.exercise_insert(exerciseVO6);

        return "user/exerciseType/shoulder";
    } // 어깨 루틴



    // core
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


    // 코어 루틴 추천
    @RequestMapping("/exerciseType/core/rutin")
    public String exerciseTypeCore(HttpSession session, Model model){
        ExerciseVO exerciseVO = new ExerciseVO();

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        ExerciseVO exerciseVO7 = new ExerciseVO();
        exerciseVO7.setExer_id(userMemberVO.getU_m_id());
        exerciseVO7.setExer_name("윗몸 일으키기");
        exerciseVO7.setExer_wgt(1);
        exerciseVO7.setExer_cnt(20);
        exerciseVO7.setExer_set(3);

        ExerciseVO exerciseVO8 = new ExerciseVO();
        exerciseVO8.setExer_id(userMemberVO.getU_m_id());
        exerciseVO8.setExer_name("마운틴 클라이머");
        exerciseVO8.setExer_wgt(1);
        exerciseVO8.setExer_cnt(30);
        exerciseVO8.setExer_set(2);

        ExerciseVO exerciseVO9 = new ExerciseVO();
        exerciseVO9.setExer_id(userMemberVO.getU_m_id());
        exerciseVO9.setExer_name("레그 레이즈");
        exerciseVO9.setExer_wgt(1);
        exerciseVO9.setExer_cnt(15);
        exerciseVO9.setExer_set(3);

        service.exercise_insert(exerciseVO7);
        service.exercise_insert(exerciseVO8);
        service.exercise_insert(exerciseVO9);

        return "user/exerciseType/core";
    } // 코어 루틴




    @RequestMapping("/exerciseType/arm_yet")
    public String exerciseTypeArm_yet(Model model){

        model.addAttribute("list", 1);
        System.out.println("팔 운동으로 이동만");

        return "user/exerciseType/arm";

    }



    // arm
    @RequestMapping("/exerciseType/arm") // arm에서 from 보내는 url
    public String exerciseTypeArm(ExerciseVO exerciseVO, HttpSession session, Model model){

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        service.exercise_insert(exerciseVO);

        System.out.println("팔 값 데이터베이스로");

        return "user/exerciseType/arm";
    } // arm



    // 팔 루틴 추천
    @RequestMapping("/exerciseType/arm/rutin")
    public String exerciseTypeArm(HttpSession session, Model model){
        ExerciseVO exerciseVO = new ExerciseVO();

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        ExerciseVO exerciseVO10 = new ExerciseVO();
        exerciseVO10.setExer_id(userMemberVO.getU_m_id());
        exerciseVO10.setExer_name("덤벨 컬");
        exerciseVO10.setExer_wgt(8);
        exerciseVO10.setExer_cnt(15);
        exerciseVO10.setExer_set(3);

        ExerciseVO exerciseVO11 = new ExerciseVO();
        exerciseVO11.setExer_id(userMemberVO.getU_m_id());
        exerciseVO11.setExer_name("얼터네이팅 덤벨 컬");
        exerciseVO11.setExer_wgt(8);
        exerciseVO11.setExer_cnt(15);
        exerciseVO11.setExer_set(2);

        ExerciseVO exerciseVO12 = new ExerciseVO();
        exerciseVO12.setExer_id(userMemberVO.getU_m_id());
        exerciseVO12.setExer_name("덤벨 킥백");
        exerciseVO12.setExer_wgt(8);
        exerciseVO12.setExer_cnt(15);
        exerciseVO12.setExer_set(2);

        service.exercise_insert(exerciseVO10);
        service.exercise_insert(exerciseVO11);
        service.exercise_insert(exerciseVO12);

        return "user/exerciseType/arm";
    } // 팔 루틴



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


    // 하체 루틴 추천
    @RequestMapping("/exerciseType/low/rutin")
    public String exerciseTypeLow(HttpSession session, Model model){
        ExerciseVO exerciseVO = new ExerciseVO();

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        ExerciseVO exerciseVO13 = new ExerciseVO();
        exerciseVO13.setExer_id(userMemberVO.getU_m_id());
        exerciseVO13.setExer_name("덤벨 스쿼트");
        exerciseVO13.setExer_wgt(8);
        exerciseVO13.setExer_cnt(12);
        exerciseVO13.setExer_set(3);

        ExerciseVO exerciseVO14 = new ExerciseVO();
        exerciseVO14.setExer_id(userMemberVO.getU_m_id());
        exerciseVO14.setExer_name("덤벨 스플릿 스쿼트");
        exerciseVO14.setExer_wgt(8);
        exerciseVO14.setExer_cnt(15);
        exerciseVO14.setExer_set(2);

        ExerciseVO exerciseVO15 = new ExerciseVO();
        exerciseVO15.setExer_id(userMemberVO.getU_m_id());
        exerciseVO15.setExer_name("덤벨 리어런지");
        exerciseVO15.setExer_wgt(8);
        exerciseVO15.setExer_cnt(15);
        exerciseVO15.setExer_set(2);

        service.exercise_insert(exerciseVO13);
        service.exercise_insert(exerciseVO14);
        service.exercise_insert(exerciseVO15);

        return "user/exerciseType/low";
    } // 하체 루틴



    // 맨몸 운동

    @RequestMapping("/exerciseType/Body_yet")
    public String exerciseTypeBody(Model model){

        model.addAttribute("list", 1);
        System.out.println("맨몸으로 이동만");

        return "user/exerciseType/body";

    }

    @RequestMapping("/exerciseType/Body")
    public String exerciseTypeBody(ExerciseVO exerciseVO, HttpSession session, Model model) {

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        service.exercise_insert(exerciseVO);

        System.out.println("맨몸운동 값 데이터베이스로");

        return "user/exerciseType/body";
    }

    // 하체 루틴 추천
    @RequestMapping("/exerciseType/body/rutin")
    public String exerciseTypeBody(HttpSession session, Model model){
        ExerciseVO exerciseVO = new ExerciseVO();

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        ExerciseVO exerciseVO16 = new ExerciseVO();
        exerciseVO16.setExer_id(userMemberVO.getU_m_id());
        exerciseVO16.setExer_name("푸쉬업");
        exerciseVO16.setExer_wgt(1);
        exerciseVO16.setExer_cnt(15);
        exerciseVO16.setExer_set(2);

        ExerciseVO exerciseVO17 = new ExerciseVO();
        exerciseVO17.setExer_id(userMemberVO.getU_m_id());
        exerciseVO17.setExer_name("파이크 푸쉬업");
        exerciseVO17.setExer_wgt(1);
        exerciseVO17.setExer_cnt(15);
        exerciseVO17.setExer_set(2);

        ExerciseVO exerciseVO18 = new ExerciseVO();
        exerciseVO18.setExer_id(userMemberVO.getU_m_id());
        exerciseVO18.setExer_name("윗몸 일으키기");
        exerciseVO18.setExer_wgt(1);
        exerciseVO18.setExer_cnt(15);
        exerciseVO18.setExer_set(2);

        ExerciseVO exerciseVO19 = new ExerciseVO();
        exerciseVO19.setExer_id(userMemberVO.getU_m_id());
        exerciseVO19.setExer_name("레그 레이즈");
        exerciseVO19.setExer_wgt(1);
        exerciseVO19.setExer_cnt(20);
        exerciseVO19.setExer_set(2);

        ExerciseVO exerciseVO20 = new ExerciseVO();
        exerciseVO20.setExer_id(userMemberVO.getU_m_id());
        exerciseVO20.setExer_name("마운틴 클라이머");
        exerciseVO20.setExer_wgt(1);
        exerciseVO20.setExer_cnt(30);
        exerciseVO20.setExer_set(2);

        service.exercise_insert(exerciseVO16);
        service.exercise_insert(exerciseVO17);
        service.exercise_insert(exerciseVO18);
        service.exercise_insert(exerciseVO19);
        service.exercise_insert(exerciseVO20);

        return "redirect:/user/member/exerciseDia";

    } // 맨몸 운동 루틴





    // 운동 부위에 따른 url 끝

    @RequestMapping("/exerciseDia")
    public String exerciseDia(ExerciseVO exerciseVO, HttpSession session, Model model){

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

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

    @RequestMapping("/exerDeleteOne")
    public String exerDelete(ExerciseVO exerciseVO, HttpSession session, Model model){

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        String nextPage;

        int exercise_DeleteOne = service.exercise_deleteOne(exerciseVO);

        if(exercise_DeleteOne > 0){
            nextPage = "nav/success";
        }else{
            nextPage = "nav/fail";
        }
        return nextPage;

    }


    @RequestMapping("/exerDeleteAll")
    public String exerDeleteAll(ExerciseVO exerciseVO, HttpSession session, Model model){

        model.addAttribute("list", 1); // 이걸 붙여줘야 다시 선택 가능함 만들때마다 꼭 붙여주기

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        String nextPage;

        int exercise_DeleteAll = service.exercise_deleteAll(exerciseVO);

        if(exercise_DeleteAll > 0){
            nextPage = "nav/success";
        }else{
            nextPage = "nav/fail";
        }
        return nextPage;

    }



    }
