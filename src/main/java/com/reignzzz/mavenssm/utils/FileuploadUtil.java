package com.reignzzz.mavenssm.utils;

import com.reignzzz.mavenssm.exception.CustomException;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

import static com.reignzzz.mavenssm.constant.Constant.NO_CHOOSE_FILE;

public class FileuploadUtil {

    public static String fileupload(MultipartFile[] multipartFiles, String desPath, String desName) throws Exception {

        if (multipartFiles == null && multipartFiles.length <= 0) {
            throw new CustomException(NO_CHOOSE_FILE);
        }
        for (MultipartFile file : multipartFiles) {
            String filename = file.getOriginalFilename();
            File desFile = new File(desPath);
            if (!desFile.exists()) {
                desFile.mkdirs();
            }
            file.transferTo(new File(desPath + File.separator + desName));
        }

        return desPath + File.separator + desName;

    }


}
