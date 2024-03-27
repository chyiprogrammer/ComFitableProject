package kr.co.namu.book.admin;

import kr.co.namu.book.BookVO;
import kr.co.namu.book.HopeBookVO;
import kr.co.namu.book.RentalBookVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("admin.BookDAO")
public class BookDAO {

    @Autowired
    SqlSession sql;

    public boolean isISBN(String b_isbn){
        System.out.println("[BOOKDAO] isISBN");

        return (Integer) sql.selectOne("book.mapper.checkisbn", b_isbn) > 0 ? true : false;

    }

    public int insertBook(BookVO bookVO){
        System.out.println("[BOOKDAO] insertBOOK");

        return sql.insert("book.mapper.insertbook", bookVO);
    }

    public List<BookVO> selectBooksBySearch(BookVO bookVO){
        System.out.println("[BOOKDAO] selectBooksBySearch");
        return sql.selectList("book.mapper.searchbooks", bookVO);

    }

    public List<BookVO> selectBook(int b_no){
        System.out.println("[BOOKDAO] selectBook");
        return sql.selectList("book.mapper.bookdetail", b_no);
    }

    public int updateBook(BookVO bookVO){
        System.out.println("[BOOKDAO] updateBook");
        return sql.update("book.mapper.updatebook", bookVO);
    }

    public int deleteBook(int b_no){
        System.out.println("[BOOKDAO] deletebook()");
        return sql.delete("book.mapper.deletebook",b_no);
    }

    public List<RentalBookVO> selectRentalBooks(){
        System.out.println("[BOOKDAO] selectRentalBooks()");
        return sql.selectList("rental.mapper.rentalallbooks");
    }

    public int updateRentalBook(RentalBookVO rentalBookVO){
        System.out.println("[BOOKDAO] updateRentalBook()");

        return sql.update("rental.mapper.updaterentalbook", rentalBookVO);
    }
    public int updateBook(RentalBookVO rentalBookVO){
        System.out.println("[BOOKDAO] updateBook()");

        return sql.update("book.mapper.updatebookable", rentalBookVO);
    }

    public List<HopeBookVO> getHopeBooks(){
        System.out.println("[BOOKDAO] updateBook()");

        return sql.selectList("hope.mapper.hopelists");
    }
    public int insertHopeBook(HopeBookVO hopeBookVO){
        System.out.println("[BOOKDAO] insertHopeBook()");

        return sql.insert("book.mapper.inserthopebook", hopeBookVO);
    }

    public void updateHopeBookResult(int h_m_no){
        System.out.println("[BOOKDAO] updateHopeBookResult()");

        sql.update("hope.mapper.updatehopebook", h_m_no);
    }

    public List<BookVO> getAllBooks(){
        System.out.println("[BOOKDAO] getAllBooks()");

        return sql.selectList("book.mapper.allbooks");
    }
}
