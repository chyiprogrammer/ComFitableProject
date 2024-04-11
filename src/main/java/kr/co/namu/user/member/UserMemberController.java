package kr.co.namu.user.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/member")
public class UserMemberController {

    @Autowired
    UserMemberService userMemberService;

    //회원가입
    @GetMapping("/createAccountForm")
    public String createAccountForm() {
        System.out.println("[UserMemberController] createAccountForm()");

        String nextPage = "user/member/create_account_form";

        return nextPage;
    }

    //회원가입 확인
    @PostMapping("/createAccountConfirm")
    public String createAccountConfirm(UserMemberVO userMemberVO) {
        System.out.println("[UserMemberController] createAccountconfirm()");

        String nextPage = "user/member/create_account_ok";

        int result = userMemberService.createAccountConfirm(userMemberVO);

        if (result <= 0) {
            nextPage = "user/member/create_account_ng";
        }

        return nextPage;
    }

    @GetMapping("/loginForm")
    public String loginForm() {
        System.out.println("[UserMemberController] loginForm()");

        String nextPage = "user/member/login_form";

        return nextPage;
    }

    @PostMapping("loginConfirm")
    public String loginConfirm(UserMemberVO userMemberVO, HttpSession session) {
        System.out.println("[UserMemberController]  loginConfirm");

        String nextPage = "user/home";

        UserMemberVO loginedUserMemberVo = userMemberService.loginConfirm(userMemberVO);

        if (loginedUserMemberVo == null) {
            nextPage = "user/member/login_ng";
        } else {
            session.setAttribute("loginedUserMemberVo", loginedUserMemberVo);
            session.setMaxInactiveInterval(60 * 30);
        }

        return nextPage;
    }

    //계정수정

    @GetMapping("/modifyAccountForm")
    public String modifyAccountForm(HttpSession session){
        System.out.println("[UserMemberController]modifyAccountForm");

        String nextPage = "user/member/modify_account_form";

        //sevlet-context에 prehandle interceptor로 미로그인시 로그인페이지로 자동이동
        /*UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");

        if(loginedUserMemberVo == null){
            nextPage ="redirect:/user/member/loginForm";
        }*/

        return nextPage;
    }

    //회원정보 수정 확인
    @PostMapping("/modifyAccountConfirm")
    public String modifyAccountConfirm(UserMemberVO userMemberVO, HttpSession session) {
        System.out.println("[UserMemberController]  modifyAccountConfirm");

        String nextPage = "user/member/modify_account_ok";
        System.out.println("modify success");
        
        
        int result = userMemberService.modifyAccountConfirm(userMemberVO);

        if (result >= 0) {

            UserMemberVO loginedUserMemberVo = userMemberService.getLoginedUser(userMemberVO.getU_m_no());

            session.setAttribute("LoginedUserMemberVo", loginedUserMemberVo);
            session.setMaxInactiveInterval(60*30);

        } else {
            System.out.println("modify fail");
            nextPage = "user/member/modify_account_ng";
        }

        return nextPage;
    }

    @GetMapping("logoutConfirm")
    public String logoutConfirm(HttpSession session){
        System.out.println("[UserMemberController]  logoutConfirm");

        String nextPage = "redirect:/";

        session.invalidate();

        return nextPage;
    }


    // 비밀번호 찾기
    @GetMapping("/findPasswordForm")
    public String findPasswordForm(){
        System.out.println("[UserMemberController]  findPasswordForm");

        String nextPage = "user/member/find_password_form";

        return nextPage;

    }

    @PostMapping("/findPasswordConfirm")
    public String findPasswordConfirm(UserMemberVO userMemberVO){
        System.out.println("[UserMemberController]  findPasswordConfirm");

        String nextPage = "user/member/find_password_ok";

        int result = userMemberService.findPasswordConfirm(userMemberVO);

        if(result <= 0){
            nextPage ="user/member/find_password_ng";
        }

        return nextPage;
    }


}