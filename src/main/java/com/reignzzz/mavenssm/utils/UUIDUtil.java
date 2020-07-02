package com.reignzzz.mavenssm.utils;

import java.util.UUID;

public class UUIDUtil {

    public static String getUUID16Bits(){
        int hashCode = UUID.randomUUID().hashCode();
        if (hashCode < 0) {
            hashCode = -hashCode;
        }
        String code = String.format("%016d", hashCode);
        return code;
    }


}
