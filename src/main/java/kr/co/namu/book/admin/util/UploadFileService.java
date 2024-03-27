package kr.co.namu.book.admin.util;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class UploadFileService {

    public String upload(MultipartFile file)  {

        boolean result = false;

        //파일 저장

        String fileOriName = file.getOriginalFilename();
        String fileExtension = fileOriName.substring(fileOriName.lastIndexOf("."), fileOriName.length());
        String uploadDir = "c:\\library\\upload\\";

        UUID uuid = UUID.randomUUID();
        String uniqueName = uuid.toString().replace("-","");

        File saveFile = new File(uploadDir +"\\" + uniqueName + fileExtension);

        if(!saveFile.exists()){
            saveFile.mkdirs();
        }

        try {
            file.transferTo(saveFile);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }


        if(result){
            System.out.println("[uploadFileService] FILE UPLOAD SUCCESS!!");
            return uniqueName + fileExtension;
        } else{
            System.out.println("[uploadFileService] FILE UPLOAD FAIL!!");
            return null;
        }


    }
}
