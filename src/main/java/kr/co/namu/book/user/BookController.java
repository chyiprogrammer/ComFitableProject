package kr.co.namu.book.user;

import kr.co.namu.book.BookVO;
import kr.co.namu.book.HopeBookVO;
import kr.co.namu.book.RentalBookVO;
import kr.co.namu.user.member.UserMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller("user.BookController")
@RequestMapping("/book/user")
public class BookController {

    @Autowired
    BookService bookService;

    @GetMapping("/searchBookConfirm")
    public String searchBookConfirm(BookVO bookVO, Model model){
        System.out.println("[UserBookController] searchBookConfirm");

        String nextPage ="user/book/search_book";

        List<BookVO> bookVos = bookService.searchBookConfirm(bookVO);

        model.addAttribute("bookVos", bookVos);

        return  nextPage;
    }

    @GetMapping("/bookDetail")
    public String bookDetail(@RequestParam("b_no") int b_no, Model model){
        System.out.println("[UserBookController] bookDetail()");

        String nextPage ="user/book/book_detail";

        BookVO bookVo = bookService.bookDetail(b_no);

        model.addAttribute("bookVo", bookVo);


        return nextPage;
    }

    //도서 대출
    @GetMapping("/rentalBookConfirm")
    public String rentalBookConfirm(RentalBookVO rentalBookVO , HttpSession session) {
        System.out.println("[UserBookController] rentalBookConfirm()");

        String nextPage = "user/book/rental_book_ok";

        UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");

        //RentalBookVo에  u_m_no를 넣는다.
        rentalBookVO.setU_m_no(loginedUserMemberVo.getU_m_no());

        // David : 인터셉터 prehandler로 controller 실행 전 먼저 login 체크 후 리다이렉트함으로 하기 코드 삭제
        /*if (loginedUserMemberVo == null) {
            return "redirect:/user/member/loginForm";
        }*/

        int result = bookService.rentalBookConfirm(rentalBookVO);


        if (result <= 0) {
             nextPage = "user/book/rental_book_ng";
         }

        return nextPage;
    }
  //대출도서 확인
    @GetMapping ("/enterBookshelf")
    public String enterBookshelf(HttpSession session, Model model){
        System.out.println("[UserBookController] rentalBookConfirm()");

        String nextPage = "user/book/bookshelf";

        UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");

        // David : 인터셉터 prehandler로 controller 실행 전 먼저 login 체크 후 리다이렉트함으로 하기 코드 삭제
        /*if (loginedUserMemberVo == null) {
            return "redirect:/user/member/loginForm";
        }*/

        List<RentalBookVO> rentalBookVos = bookService.enterBookshelf(loginedUserMemberVo.getU_m_no());

        model.addAttribute("rentalBookVos", rentalBookVos);

        return nextPage;

    }

    //도서 대출 이력 조회
    @GetMapping("/listupRentalBookHistory")
    public String listupRentalBookHistory(HttpSession session, Model model){
        System.out.println("[UserBookController] listupRentalBookHistory()");
        String nextPage = "user/book/rental_book_history";

        UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");

        // David : 인터셉터 prehandler로 controller 실행 전 먼저 login 체크 후 리다이렉트함으로 하기 코드 삭제
        /*  if (loginedUserMemberVo == null) {
            return "redirect:/user/member/loginForm";
        }*/

        List<RentalBookVO> rentalBookVos = bookService.listupRentalBookHistory(loginedUserMemberVo.getU_m_no());

        model.addAttribute("rentalBookVos", rentalBookVos);

        return  nextPage;

    }

    //희망도서 요청
    @GetMapping("/requestHopeBookForm")
    public String requestHopeBookForm(){
        System.out.println("[UserBookController] requestHopeBookForm()");

        // David : 인터셉터 prehandler로 controller 실행 전 먼저 login 체크 후 리다이렉트함으로 하기 코드 삭제
        /*  UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        if (loginedUserMemberVo == null) {
            return "redirect:/user/member/loginForm";
        }*/
        String nextPage = "user/book/request_hope_book_form";
        return nextPage;
    }

    //희망 도서 요청 확인
    @GetMapping("/requestHopeBookConfirm")
    public String requestHopeBookConfirm(HopeBookVO hopeBookVO, HttpSession session){
        System.out.println("[UserBookController] requestHopeBookConfirm()");

        String nextPage = "user/book/request_hope_book_ok";

        UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");

        hopeBookVO.setU_m_no(loginedUserMemberVo.getU_m_no());

        int result = bookService.requestHopeBookConfirm(hopeBookVO);

        if( result <= 0){
            nextPage = "user/book/request_hope_book_ng";
        }

        return nextPage;
    }

    // 희망 도서 요청 목록
    @GetMapping("/listupRequestHopeBook")
    public String listupReqeustHopeBook(HttpSession session, Model model){
        System.out.println("[UserBookController] listupReqeustHopeBook()");

        String nextPage = "user/book/list_hope_book";

        UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        // David : 인터셉터 prehandler로 controller 실행 전 먼저 login 체크 후 리다이렉트함으로 하기 코드 삭제
        /*  if (loginedUserMemberVo == null) {
            return "redirect:/user/member/loginForm";
        }*/

        List<HopeBookVO> hopeBookVos = bookService.listupRequestHopeBook(loginedUserMemberVo.getU_m_no());

        model.addAttribute("hopeBookVos", hopeBookVos);

        return nextPage;

    }

}
