package kr.co.namu.user;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@ComponentScan
@RequestMapping("/")
public class UserHomeController {

    @GetMapping({"/"})
    public String home(){
        System.out.println("[UserHomeController] home()");

        return "user/home";
    }
}
