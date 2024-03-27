package kr.co.namu;


import kr.co.namu.admin.AdminMemberService;
import kr.co.namu.admin.AdminMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

    @Autowired
    AdminMemberService adminMemberService;

    //회원가입
    @RequestMapping(value="/createAccountForm", method = RequestMethod.GET)
    public String createAccountForm(){
        System.out.println("[adminMemberController] createAccountForm");

        String nextPage = "admin/member/create_account_form";

        return nextPage;
    }

    //회원가입 확인
    @PostMapping("/createAccountConfirm")
    public String createAccountConfirm(AdminMemberVO adminMemberVO){
        System.out.println("[AdminmemberController] createAccountConfirm");

        String nextPage = "admin/member/create_account_ok";

        int result = adminMemberService.createAccountConfirm(adminMemberVO);

        if(result <=0){
            nextPage = "admin/member/create_account_ng";
        }
        return nextPage;
    }
    @GetMapping("/loginForm")
    public String loginForm(){
        System.out.println("[AdminmemberController] loginForm");

        String nextPage = "admin/member/login_form";

        return nextPage;
    }

    @PostMapping("/loginConfirm")
    public String loginConfirm(AdminMemberVO adminMemberVO, HttpSession session){
        System.out.println("[AdminmemberController] loginConfirm");

        String nextPage = "admin/member/login_ok";

        AdminMemberVO loginedAdminMemberVO = adminMemberService.loginConfirm(adminMemberVO);


        if(loginedAdminMemberVO == null){
            nextPage = "admin/member/login_ng";
        } else {
            session.setAttribute("loginedAdminMemberVo", loginedAdminMemberVO);
            session.setMaxInactiveInterval(60*30);
        }

        return nextPage;
    }

    @RequestMapping(value ="/logoutConfirm", method = RequestMethod.GET)
    public String logoutConfirm(HttpSession session){
        System.out.println("[AdminmemberController] logoutConfirm");

        String nextPage = "redirect:/admin";

        session.invalidate();

        return nextPage;

    }

    @RequestMapping(value = "/listupAdmin", method = RequestMethod.GET)
    public String listupAdmin(Model model){
        System.out.println("[AdminmemberController] listupAdmin");

        String nextPage = "/admin/member/listup_admins";

        List<AdminMemberVO> adminMemberVos = adminMemberService.listupAdmin();

        model.addAttribute("adminMemberVos",adminMemberVos);

        return nextPage;

    }
    // 관리자승인(a_m_approval "1"로 변경
    @RequestMapping(value = "/setAdminApproval", method = RequestMethod.GET)
    public String setAdminApproval(@RequestParam("a_m_no") int a_m_no){
        System.out.println("[AdminmemberController] setAdminApproval");
        
       String nextPage = "redirect:/admin/member/listupAdmin";
       adminMemberService.setAdminApproval(a_m_no);
       
       return nextPage;
    }

    //관리자 회원정보 수정
    @GetMapping("/modifyAccountForm")
    public String modifyAccountForm(HttpSession session){
        System.out.println("[AdminmemberController] modifyAccountForm");

        String nextPage = "admin/member/modify_account_form";

        //sevlet-context에 prehandle interceptor로 미로그인시 로그인페이지로 자동이동
        /*AdminMemberVO loginedAdminMemberVo = (AdminMemberVO) session.getAttribute("loginedAdminMemberVo");
        if(loginedAdminMemberVo == null){
            nextPage = "redirect:/admin/member/loginForm";
        }*/

        return nextPage;

    }
    //관리자 회원정보 수정 확인
    @PostMapping("/modifyAccountConfirm")
    public String modifyAccountConfirm(AdminMemberVO adminMemberVO, HttpSession session){
        System.out.println("[AdminmemberController] modifyAccountconfirm");

        String nextPage ="admin/member/modify_account_ok";

        int result = adminMemberService.modifyAccountConfirm(adminMemberVO);

        if(result >0) {
            List<AdminMemberVO> loginedAdminMemberVos = adminMemberService.getLoginedAdminMemberVO(adminMemberVO.getA_m_no());
            session.setAttribute("loginedAdminMemberVo", loginedAdminMemberVos.get(0));
            session.setMaxInactiveInterval(60*30);
        } else{
            nextPage ="admin/member/modify_account_ng";
        }

        return  nextPage;
    }

    @GetMapping("/findPasswordForm")
    public String findPasswordForm(){
        System.out.println("[AdminmemberController] findpasswordForm");

        String nextPage = "admin/member/find_password_form";

        return nextPage;
    }

    //비밀번호 찾기 확인

    @RequestMapping("/findPasswordConfirm")
    public String findPasswordConfirm(AdminMemberVO adminMemberVO){
        System.out.println("[AdminmemberController] findPasswordConfirm");

        String nextPage = "admin/member/find_password_ok";

        int result =adminMemberService.findPasswordConfirm(adminMemberVO);

        if(result <= 0){
            nextPage ="admin/member/find_password_ng";
        }

        return nextPage;
    }
}
