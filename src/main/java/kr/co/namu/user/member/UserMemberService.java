package kr.co.namu.user.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.security.SecureRandom;
import java.util.Date;

@Service
public class UserMemberService {

    final static public int USER_ACCOUNT_ALREADY_EXIST = 0;
    final static public int USER_ACCOUNT_CREATE_SUCCESS = 1;
    final static public int USER_ACCOUNT_CREATE_FAIL = -1;

    @Autowired
    UserMemberDAO userMemberDAO;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    JavaMailSenderImpl javaMailSender;

    public int createAccountConfirm(UserMemberVO userMemberVO){
        System.out.println("[UserMemberService]createAccountConfirm()");

        boolean isMember = userMemberDAO.isUserMember(userMemberVO.getU_m_id());

        if(!isMember){
            int result =userMemberDAO.insertUserAccount(userMemberVO);

            if(result >0){
                return USER_ACCOUNT_CREATE_SUCCESS;
            } else {
                return USER_ACCOUNT_CREATE_FAIL;
            }
        } else {
            return USER_ACCOUNT_ALREADY_EXIST;
        }
    }

    public UserMemberVO loginConfirm(UserMemberVO userMemberVO){
        System.out.println("[UserMemberService]loginConfirm()");

        UserMemberVO loginedUserMemberVo = userMemberDAO.selectUser(userMemberVO);

        if(loginedUserMemberVo != null){
            System.out.println("[UserMemberService] USER MEMBER LOGIN SUCCESS!!");
        }else{
            System.out.println("[UserMemberService] USER MEMBER LOGIN FAIL!!");
        }

        return loginedUserMemberVo;
    }

    public int modifyAccountConfirm(UserMemberVO userMemberVO){
        System.out.println("[UserMemberService]modifyAccountConfirm()");

        return userMemberDAO.updateUserAccount(userMemberVO);
    }

    public UserMemberVO getLoginedUser(int u_m_no ){
        System.out.println("[UserMemberService]getLoginedUser()");

        return userMemberDAO.selectUser(u_m_no);
    }

    public int findPasswordConfirm(UserMemberVO userMemberVO){
        System.out.println("[UserMemberService]findPasswordConfirm()");

        int returnedNO = userMemberDAO.selectUserForPassword(userMemberVO);

        int result = 0;
        String rowpassword = "";

        if(returnedNO > 0 ){
            String newPassword = createNewPassword();
            //신규로 생성된 비번을 vo에 추가 (mybatis는 인자값이 하나밖에 안됨으로, vo로 던져야 함.)
            userMemberVO.setU_m_no(returnedNO);
            rowpassword = newPassword;
            userMemberVO.setU_m_pw(passwordEncoder.encode(newPassword));
            result = userMemberDAO.updatePassword(userMemberVO);
        }
        if( result > 0){
            sendNewPasswordByMail(userMemberVO.getU_m_mail(), rowpassword);
        }

        return result;

    }

    //비번 새로 생성

    private String createNewPassword(){
        System.out.println("[AdminMemberService] createNewPassword()");

        char[] chars = new char[]{
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
                'u', 'v', 'w', 'x', 'y', 'z' };

        StringBuffer stringBuffer = new StringBuffer();
        SecureRandom secureRandom = new SecureRandom();
        secureRandom.setSeed(new Date().getTime());

        int index = 0;
        int length = chars.length;

        for(int i=0; i<8; i++){
            index = secureRandom.nextInt(length);

            if(index % 2 == 0){
                stringBuffer.append(String.valueOf(chars[index]).toUpperCase());
            } else {
                stringBuffer.append(String.valueOf(chars[index]).toLowerCase());
            }
        }

        System.out.println("[AdminMemberService] NEW PASSWORD: " + stringBuffer.toString());

        return stringBuffer.toString();
    }

    // 신규 비번 메일로 발송
    private void sendNewPasswordByMail(String toMailAddr, String newPassword){
        System.out.println("[AdminMemberService] sendNewPasswordBtMail()");

        final MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                final MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                mimeMessageHelper.setTo(toMailAddr);
                mimeMessageHelper.setSubject(("[나무도서관] 새비밀번호 안내입니다."));
                mimeMessageHelper.setText("새 비밀번호: " + newPassword, true);
            }
        };

        javaMailSender.send(mimeMessagePreparator);
    }

}
