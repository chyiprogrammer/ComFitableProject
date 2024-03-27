package kr.co.namu.book;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HopeBookVO {
    int hb_no;
    String hb_name;
    String hb_author;
    String hb_publisher;
    String hb_publish_year;
    String hb_reg_date;
    String hb_mod_date;
    int hb_result;
    String hb_result_last_date;

    int u_m_no;
    String u_m_id;
    String u_m_pw;
    String u_m_name;
    String u_m_gender;
    String u_m_mail;
    String u_m_phone;
    String u_m_reg_date;
    String u_m_mod_date;

    int b_no;
    String b_thumbnail;
    String b_name;
    String b_author;
    String b_publisher;
    String b_publish_year;
    String b_isbn;
    String b_call_number;
    int b_rental_able;
    String b_reg_date;
    String b_mod_date;

}
