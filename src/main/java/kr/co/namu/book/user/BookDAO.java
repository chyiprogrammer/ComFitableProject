package kr.co.namu.book.user;

import kr.co.namu.book.BookVO;
import kr.co.namu.book.HopeBookVO;
import kr.co.namu.book.RentalBookVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("user.BookDAO")
public class BookDAO {

    @Autowired
    SqlSession sql;

    public List<BookVO> selectBooksBySearch(BookVO bookVO){
        System.out.println("BookDAO] selectBooksBySearch");

        return sql.selectList("book.mapper.searchbooks",bookVO );
    }

    public List<BookVO> selectBook(int b_no){
        System.out.println("[BookDAO] selectBook");

        return sql.selectList("book.mapper.bookdetail", b_no);
    }

    public int insertRentalBook(RentalBookVO rentalBookVO){
        System.out.println("[BookDAO] inserRentalBook");

        return sql.insert("rental.mapper.insert", rentalBookVO);
    }

    public int updateRentalBookAble(RentalBookVO rentalBookVO){
        System.out.println("[BookDAO] updateRentalBookAble");

        return sql.update("book.mapper.updatebookunable",rentalBookVO);
    }

    public List<RentalBookVO> selectRentalBooks(int u_m_no){
        System.out.println("[BookDAO] selectRentalBooks");

        return sql.selectList("rental.mapper.entershelf", u_m_no);
    }

    public List<RentalBookVO> selectRentalBookHistory(int u_m_no){
        System.out.println("[BookDAO] selectRentalBooks");

        return sql.selectList("rental.mapper.rentalbookhistory", u_m_no);
    }

    public int insertHopeBook(HopeBookVO hopeBookVO){
        System.out.println("[BookDAO] insertHopeBook");

        return sql.insert("hope.mapper.insert",hopeBookVO);
    }

    public List<HopeBookVO> listupHopeBook(int u_m_no){
        System.out.println("[BookDAO] listupHopeBook");

        return sql.selectList("hope.mapper.listuphopebook",u_m_no);
    }
}
