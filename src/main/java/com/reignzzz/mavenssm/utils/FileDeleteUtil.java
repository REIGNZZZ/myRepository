package com.reignzzz.mavenssm.utils;

import java.io.File;

public class FileDeleteUtil {

    public static void fileDelete(String filepath,String filename){
        String diskPath = filepath + File.separator + filename;
        File file = new File(diskPath);
        if (file.exists()) {
            file.delete();
        }
    }

}
