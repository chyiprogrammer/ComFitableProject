package kr.co.namu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {

    @RequestMapping(value = {"","/"}, method = RequestMethod.GET)
    public String home(){
        System.out.println("[adminhomecontroller] home()");
        String nextPage = "admin/home";

        return nextPage;
    }
}
