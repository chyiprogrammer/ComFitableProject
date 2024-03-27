package kr.co.namu.book.user;

import kr.co.namu.book.BookVO;
import kr.co.namu.book.HopeBookVO;
import kr.co.namu.book.RentalBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("user.BookService")
public class BookService {

    @Autowired
    BookDAO bookDAO;

    public List<BookVO> searchBookConfirm(BookVO bookVO){
        System.out.println("[BookService] searchBookConfirm");

        return bookDAO.selectBooksBySearch(bookVO);
    }

    public BookVO bookDetail(int b_no){
        System.out.println("[BookService] searchBookConfirm");
        List<BookVO> bookVOS = bookDAO.selectBook(b_no);

        return bookVOS.get(0);
    }

    public int rentalBookConfirm(RentalBookVO rentalBookVO){
        System.out.println("[BookService] rentalBookConfirm");

         int result = bookDAO.insertRentalBook(rentalBookVO);

         if(result > 0){
             bookDAO.updateRentalBookAble(rentalBookVO);
         }

         return result;
    }

    public List<RentalBookVO> enterBookshelf(int u_m_no){
        System.out.println("[BookService] enterBookshelf");

        return bookDAO.selectRentalBooks(u_m_no);
    }

    public List<RentalBookVO> listupRentalBookHistory(int u_m_no){
        System.out.println("[BookService] listupRentalBookHistory");

        return bookDAO.selectRentalBookHistory(u_m_no);
    }

    public int requestHopeBookConfirm(HopeBookVO hopeBookVO){
        System.out.println("[BookService] requestHopeBookConfirm");

        return bookDAO.insertHopeBook(hopeBookVO);
    }

    public List<HopeBookVO> listupRequestHopeBook(int u_m_no){
        System.out.println("[BookService] listupRequestHopeBook");

        return bookDAO.listupHopeBook(u_m_no);
    }
}
