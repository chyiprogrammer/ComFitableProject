package kr.co.namu.user.member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserMemberVO {
    int u_m_no;
    String u_m_id, u_m_pw, u_m_name, u_m_gender, u_m_mail, u_m_mailchoose, u_m_phone, u_m_reg_date, u_m_mod_date ;

    public UserMemberVO() {
    }

    public UserMemberVO(int u_m_no, String u_m_id, String u_m_pw, String u_m_name, String u_m_gender, String u_m_mail, String u_m_phone, String u_m_reg_date, String u_m_mod_date) {
        this.u_m_no = u_m_no;
        this.u_m_id = u_m_id;
        this.u_m_pw = u_m_pw;
        this.u_m_name = u_m_name;
        this.u_m_gender = u_m_gender;
        this.u_m_mail = u_m_mail;
        this.u_m_phone = u_m_phone;
        this.u_m_reg_date = u_m_reg_date;
        this.u_m_mod_date = u_m_mod_date;
    }

}