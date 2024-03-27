package kr.co.namu.user.member;

import kr.co.namu.admin.AdminMemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import java.util.List;

@Component
public class UserMemberDAO {
    @Autowired
    SqlSession sql;

    @Autowired
    PasswordEncoder passwordEncoder;

    public boolean isUserMember(String u_m_id){
        System.out.println("[UserMemberDAO] isUserMember");
        return (Integer) sql.selectOne("user.mapper.id_check", u_m_id) == 0 ? false : true ;
    }

    public int insertUserAccount(UserMemberVO userMemberVO){
        System.out.println("[UserMemberDAO] insertUserAccount()");
        //Password Encoding
        userMemberVO.setU_m_pw(passwordEncoder.encode((userMemberVO.getU_m_pw())));
        System.out.println("encoded pw: " + userMemberVO.getU_m_pw());

        return sql.insert("user.mapper.join", userMemberVO);
    }

        public UserMemberVO selectUser(UserMemberVO userMemberVO){
        System.out.println("[UserMemberDAO] selectUser()");

         List<UserMemberVO> userMemberVOS = sql.selectList("user.mapper.login", userMemberVO);
         //왜 selectOne으로는 안되는지 확인 필요
        if(!passwordEncoder.matches(userMemberVO.getU_m_pw(), userMemberVOS.get(0).getU_m_pw())){
            userMemberVOS.clear();
        }

        return userMemberVOS.size() > 0 ? userMemberVOS.get(0) : null;

    }

    public int updateUserAccount(UserMemberVO userMemberVO){
        System.out.println("[UserMemberDAO]updateUserAccount()");

        return sql.update("user.mapper.updateAll", userMemberVO);
    }

    public UserMemberVO selectUser(int u_m_no){
        System.out.println("[UserMemberDAO] selectUser()");

        List<UserMemberVO> userMemberVOS = sql.selectList("user.mapper.userinfo", u_m_no);
        //왜 selectOne으로는 안되는지 확인 필요


        return userMemberVOS.get(0);
    }

    public int selectUserForPassword(UserMemberVO userMemberVO){
        System.out.println("[UserMemberDAO] selectUserForPassword()");

        return sql.selectOne("user.mapper.listforpassword",userMemberVO);
    }

    public int updatePassword(UserMemberVO userMemberVO){
        System.out.println("[UserMemberDAO] updatePassword()");

        return sql.update("user.mapper.updatepassword", userMemberVO);

    }
}
