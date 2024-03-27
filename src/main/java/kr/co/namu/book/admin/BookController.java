package kr.co.namu.book.admin;


import kr.co.namu.book.BookVO;
import kr.co.namu.book.HopeBookVO;
import kr.co.namu.book.RentalBookVO;
import kr.co.namu.book.admin.util.UploadFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller("admin.BookController")
@RequestMapping("/book/admin")
public class BookController {

    @Autowired
    BookService bookService;

    @Autowired
    UploadFileService uploadFileService;
    //도서등록
    @GetMapping("/registerBookForm")
    public String registerBookForm(){
        System.out.println("[BookController] registerBookForm");
        String nextPage = "admin/book/register_book_form";

        return nextPage;
    }

    @PostMapping("/registerBookConfirm")
    public String registerBookConfirm(BookVO bookVO, @RequestParam("file") MultipartFile file){
        System.out.println("[BookController] registerBookConfirm");
        String nextPage = "admin/book/register_book_ok";

        //파일 저장

         String savedFileName = uploadFileService.upload(file);

         if(savedFileName != null){
             bookVO.setB_thumbnail(savedFileName);
             int result = bookService.registerBookConfirm(bookVO);

             if(result <= 0){
                 nextPage = "admin/book/register_book_ng";
             }

         }else{
             nextPage = "admin/book/register_book_ng";
         }
        return nextPage;
    }

    //도서 검색

    @GetMapping("searchBookConfirm")
    public String searchBooConfirm(BookVO bookVO, Model model){
        System.out.println("[BookController] searchBooConfirm");

        String nextPage = "admin/book/search_book";

        List<BookVO> bookVos = bookService.searchBookConfirm(bookVO);

        model.addAttribute("bookVos", bookVos);

        return nextPage;
    }

    //도서 상세보기

    @GetMapping("/bookDetail")
    public String bookDetail(@RequestParam("b_no") int b_no, Model model){
        System.out.println("[BookController] bookDetail()");

        String nextPage = "admin/book/book_detail";

        BookVO bookVo = bookService.bookDetail(b_no);

        model.addAttribute("bookVo", bookVo);

        return nextPage;
    }

   //도서 수정
    @GetMapping("/modifyBookForm")
    public String modifyBookForm(@RequestParam("b_no") int b_no, Model model) {
        System.out.println("[BookController] modifyBookForm()");

        String nextPage = "admin/book/modify_book_form";

        BookVO bookVo = bookService.modifyBookForm(b_no);

        model.addAttribute("bookVo", bookVo);

        return nextPage;
    }
    //도서 수정 확인
    @PostMapping("/modifyBookConfirm")
    public String modifyBookConfirm(BookVO bookVO, @RequestParam("file") MultipartFile file) {
            System.out.println("[BookController] modifyBookConfirm()");

            String nextPage = "admin/book/modify_book_ok";

            if(!file.getOriginalFilename().equals("")){
                //파일 저장
                String saveFileName = uploadFileService.upload(file);
                if(saveFileName != null){
                    bookVO.setB_thumbnail(saveFileName);
                }
            }

            int result = bookService.modifyBookConfirm(bookVO);

            if(result <= 0){
                nextPage ="admin/book/modify_book_ng";
            }
            return nextPage;
    }
    @GetMapping("deleteBookConfirm")
    public String deleteBookConfirm(@RequestParam("b_no") int b_no){
            System.out.println("[BookController] deleteBookConfirm()");
            String nextPage = "admin/book/delete_book_ok";

            int result = bookService.deleteBookConfirm(b_no);

            if(result <= 0){
                nextPage = "admin/book/delete_book_ng";
            }

            return nextPage;
    }
    //대출된 전체 리스트 조회
    @GetMapping("/getRentalBooks")
    public String getRentalBooks(Model model){
        System.out.println("[BookController] getRentalBooks()");

        String nextPage = "admin/book/rental_books";

        List<RentalBookVO> rentalBookVos = bookService.getRentalBooks();

        model.addAttribute("rentalBookVos", rentalBookVos);

        return nextPage;

    }
    //반납된 도서 입력
    @GetMapping("/returnBookConfirm")
    public String returnBookConfirm(RentalBookVO rentalBookVO){
        System.out.println("[BookController] getRentalBooks()");

        String nextPage = "admin/book/return_book_ok";

        int result = bookService.returnBookConfirm(rentalBookVO);

        if(result <= 0){
            nextPage ="admin/book/return_book_ng";
        }
        return nextPage;
    }

    //희망도서 목록
    @GetMapping("/getHopeBooks")
    public String getHopeBooks(Model model){
        System.out.println("[BookController] getHopeBooks()");

        String nextPage = "admin/book/hope_books";

        List<HopeBookVO> hopeBookVos = bookService.getHopeBooks();

        model.addAttribute("hopeBookVos", hopeBookVos);

        return nextPage;
    }

    //희망 도서 입고 처리
    @GetMapping("/registerHopeBookForm")
    public String registerHopeBookForm(Model model, HopeBookVO hopeBookVO){
        System.out.println("[BookController] registerHopeBookForm()");

        String nextPage = "admin/book/register_hope_book_form";

        model.addAttribute("hopeBookVo", hopeBookVO);

        return nextPage;
    }

    //희망 도서 입고 처리 확인
    @PostMapping("/registerHopeBookConfirm")
    public String registerHopeBookConfirm(HopeBookVO hopeBookVO, @RequestParam("file") MultipartFile file){
        System.out.println("[BookController] registerHopeBookConfirm()");

        System.out.println("hb_no : " + hopeBookVO.getHb_no());
        String nextPage = "admin/book/register_book_ok";

        String savedFileName = uploadFileService.upload(file);

        if(savedFileName != null){
            hopeBookVO.setB_thumbnail(savedFileName);
            int result = bookService.registerHopeBookConfirm(hopeBookVO);

            if(result <= 0){
                nextPage = "admin/book/register_book_ng";
            }
        } else {
            nextPage ="admin/book/register_book_ng";
        }

           return  nextPage;
    }

    @GetMapping("/getAllBooks")
    public String getAllBooks(Model model){
        System.out.println("[BookController] getAllBooks()");

        String nextPage ="admin/book/full_list_of_books";

        List<BookVO> bookVos = bookService.getAllBooks();

        model.addAttribute("bookVos", bookVos);

        return nextPage;
    }


}
