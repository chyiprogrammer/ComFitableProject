package kr.co.namu.admin;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AdminMemberDAO {

   @Autowired
    SqlSession sql;

     @Autowired
    PasswordEncoder passwordEncoder ;

    public boolean isAdminMember(String a_m_id){

        System.out.println("[adminMemberDao] isAdminMember");

        return (Integer) sql.selectOne("admin.mapper.id_check", a_m_id) == 0 ? false : true;
    }

    public int insertAdminAccount(AdminMemberVO adminMemberVO){
        System.out.println("[adminMemberDao] insertAdminAccount");

        //Password Encoding
        adminMemberVO.setA_m_pw(passwordEncoder.encode((adminMemberVO.getA_m_pw())));
        System.out.println("encoded pw: " + adminMemberVO.getA_m_pw());
        return sql.insert("admin.mapper.join", adminMemberVO);
    }

    public AdminMemberVO selectAdmin(AdminMemberVO adminMemberVO){
        System.out.println("[adminMemberDao] selectAdmin()");

        List<AdminMemberVO> adminMemberVOS = sql.selectList("admin.mapper.list",adminMemberVO.getA_m_id());

        if(!passwordEncoder.matches(adminMemberVO.getA_m_pw(), adminMemberVOS.get(0).getA_m_pw())){
            adminMemberVOS.clear();
        }

        return adminMemberVOS.size() > 0 ? adminMemberVOS.get(0) : null;
    }

    public List<AdminMemberVO> selectAdmins(){
        System.out.println("[adminMemberDao] selectAdmins()");

        return sql.selectList("admin.mapper.lists");
    }

    public int updateAdminAccount(int a_m_no){
        System.out.println("[adminMemberDao] updateAdminAccount()");

        return sql.update("admin.mapper.listup", a_m_no);
    }

    public int updateAdminAccount(AdminMemberVO adminMemberVO){
        System.out.println("[adminMemberDao] updateAdminAccount()");

        return sql.update("admin.mapper.updateAll", adminMemberVO);
    }

    public List<AdminMemberVO> selectAdmin(int a_m_no){
        System.out.println("[adminMemberDao] selectAdmin()");

        return sql.selectList("admin.mapper.listOne", a_m_no);
        // 왜 sql.selectOne 이 안되는지 확인 필요
    }

    public int selectAdminForPassword(AdminMemberVO adminMemberVO){
        System.out.println("[adminMemberDao] selectAdmin()");

        return sql.selectOne("admin.mapper.listforpassword", adminMemberVO);
        // 왜 sql.selectOne 이 안되는지 확인 필요
    }

   public int updatePassword(AdminMemberVO adminMemberVO){
       System.out.println("[adminMemberDao] updatePassword()");

        return sql.update("admin.mapper.updatepassword", adminMemberVO);
   }
}
