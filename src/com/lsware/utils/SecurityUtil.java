package com.lsware.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class SecurityUtil {

    /**
     * byte[] ret = HashUtil.digest("MD5", "abcd".getBytes());
     *  ó�� ȣ��
     */
    public static byte[] digest(String alg, byte[] input) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance(alg);
        return md.digest(input);
    }

    public static String getCryptoMD5String(String inputValue) throws Exception {
        if( inputValue == null ) throw new Exception("Can't conver to Message Digest 5 String value!!");
        byte[] ret = digest("MD5", inputValue.getBytes());
        String result = Base64Util.encode(ret);    
        return result;
    }
}