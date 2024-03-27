package kr.co.namu.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.security.SecureRandom;
import java.util.Date;
import java.util.List;

@Service
public class AdminMemberService {

    final static public int ADMIN_ACCOUNT_ALREADY_EXIST = 0;
    final static public int ADMIN_ACCOUNT_CREATE_SUCCESS = 1;
    final static public int ADMIN_ACCOUNT_CREATE_FAIL = -1;


    @Autowired
    AdminMemberDAO adminMemberDAO;

    @Autowired
    JavaMailSenderImpl javaMailSender; // 비번 메일 발송용

    @Autowired
    PasswordEncoder passwordEncoder ;



    public int createAccountConfirm(AdminMemberVO adminMemberVO){
        System.out.println("[AdminMemberService] createAccountConfirm");

        boolean isMember = adminMemberDAO.isAdminMember(adminMemberVO.getA_m_id());

        if(!isMember) {
            int result = adminMemberDAO.insertAdminAccount(adminMemberVO);
            if (result > 0) {
                return ADMIN_ACCOUNT_CREATE_SUCCESS;
            } else {
                return ADMIN_ACCOUNT_CREATE_FAIL;
            }

        } else {
            return ADMIN_ACCOUNT_ALREADY_EXIST;
        }
    }

    public AdminMemberVO loginConfirm(AdminMemberVO adminMemberVO){
        System.out.println("[AdminMemberService] loginConfirm");

        AdminMemberVO loginedAdminMemberVO = adminMemberDAO.selectAdmin(adminMemberVO);

        if(loginedAdminMemberVO != null) {
            System.out.println("[AdminMemberService] ADMIN MEMBER LOGIN SUCCESS!");
        } else{
            System.out.println("[AdminMemberService] ADMIN MEMBER LOGIN FAIL!");
        }

        return loginedAdminMemberVO;
    }

    public List<AdminMemberVO> listupAdmin(){
        System.out.println("[AdminMemberService] listupAdmin");

        return adminMemberDAO.selectAdmins();
    }

     public void setAdminApproval(int a_m_no){
         System.out.println("[AdminMemberService] setAdminApproval");

         int result = adminMemberDAO.updateAdminAccount(a_m_no);

     }

     public int modifyAccountConfirm(AdminMemberVO adminMemberVO){
         System.out.println("[AdminMemberService] modifyAccountConfirm");

         return adminMemberDAO.updateAdminAccount(adminMemberVO);
     }

     public List<AdminMemberVO> getLoginedAdminMemberVO(int a_m_no){
         System.out.println("[AdminMemberService] getLoginedAdminMemberVO");
         return adminMemberDAO.selectAdmin(a_m_no);
     }


     public int findPasswordConfirm(AdminMemberVO adminMemberVO){
         System.out.println("[AdminMemberService] findPasswordCofirm");

         int returnedNO = adminMemberDAO.selectAdminForPassword(adminMemberVO);



         int result = 0;
         String rowpassword = "";

         if(returnedNO > 0 ){
             String newPassword = createNewPassword();
             //신규로 생성된 비번을 vo에 추가 (mybatis는 인자값이 하나밖에 안됨으로, vo로 던져야 함.)
             adminMemberVO.setA_m_no(returnedNO);
              rowpassword = newPassword;
             adminMemberVO.setA_m_pw(passwordEncoder.encode(newPassword));
             result = adminMemberDAO.updatePassword(adminMemberVO);
         }
         if( result > 0){
             sendNewPasswordByMail(adminMemberVO.getA_m_mail(), rowpassword);
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
