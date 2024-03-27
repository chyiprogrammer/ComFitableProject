package kr.co.namu.book.admin;

import kr.co.namu.book.BookVO;
import kr.co.namu.book.HopeBookVO;
import kr.co.namu.book.RentalBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("admin.BookService")
public class BookService {

    final static public int BOOK_ISBN_ALREADY_EXIST = 0; //이미 등록된 도서
    final static public int BOOK_REGISTER_SUCCESS = 1; //  신규 도서 등록 성공
    final static public int BOOK_REGISTER_FAIL = -1; // 신규 도서 등록 실패

    @Autowired
     BookDAO bookDAO;

    public int registerBookConfirm(BookVO bookVO){
        System.out.println("[BOOKSERVICE] registerBookConfirm");

        boolean isISBN = bookDAO.isISBN(bookVO.getB_isbn());

        if(!isISBN){
            int result = bookDAO.insertBook(bookVO);

            if(result > 0){
                return BOOK_REGISTER_SUCCESS;
            } else {
                return BOOK_REGISTER_FAIL;
            }
        } else{
            return BOOK_ISBN_ALREADY_EXIST;
        }
    }

    public List<BookVO> searchBookConfirm(BookVO bookVO){
        System.out.println("[BOOKSERVICE] searchBookConfirm");

        return bookDAO.selectBooksBySearch(bookVO);
    }

    public BookVO bookDetail(int b_no){
        System.out.println("[BOOKSERVICE] bookDetail");

        List<BookVO> bookVOS = bookDAO.selectBook(b_no);

        return bookVOS.get(0);
    }

    public BookVO modifyBookForm(int b_no){
        System.out.println("[BOOKSERVICE] modifyBookForm()");
        List<BookVO> bookVOS = bookDAO.selectBook(b_no);

        return bookVOS.get(0);
    }

     public int modifyBookConfirm(BookVO bookVO){
         System.out.println("[BOOKSERVICE] modifyBookConfirm()");
          return bookDAO.updateBook(bookVO);
     }

     public int deleteBookConfirm(int b_no){
         System.out.println("[BOOKSERVICE] deleteBookConfirm()");
         return bookDAO.deleteBook(b_no);

     }

     public List<RentalBookVO> getRentalBooks(){
         System.out.println("[BOOKSERVICE] getRentalBooks()");
         return bookDAO.selectRentalBooks();
     }

     public int returnBookConfirm(RentalBookVO rentalBookVO){
         System.out.println("[BOOKSERVICE] returnBookConfirm()");
         int result = bookDAO.updateRentalBook(rentalBookVO);

         if(result > 0){
             result = bookDAO.updateBook(rentalBookVO);
         }

         return result;
     }

     public List<HopeBookVO> getHopeBooks(){
         System.out.println("[BOOKSERVICE] getHopeBooks()");

         return bookDAO.getHopeBooks();
     }

     public int registerHopeBookConfirm(HopeBookVO hopeBookVO){
         System.out.println("[BOOKSERVICE] registerHopeBookConfirm()");

         boolean isISBN = bookDAO.isISBN(hopeBookVO.getB_isbn());

         if(!isISBN){
             int result = bookDAO.insertHopeBook(hopeBookVO);

             if(result > 0){
                 bookDAO.updateHopeBookResult(hopeBookVO.getHb_no());
                 return BOOK_REGISTER_SUCCESS;
             } else {
                 return BOOK_REGISTER_FAIL;
             }

         } else {
             return BOOK_ISBN_ALREADY_EXIST;
         }

     }

     public List<BookVO> getAllBooks(){
         System.out.println("[BOOKSERVICE] getAllBooks()");

         return bookDAO.getAllBooks();
     }


}
