package com.lsware.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
* 

* Filename  : Base64Util.java
* Class     : Base64Util    
* Function  : Base64 Encoding/Decoding�� �����ϴ� Ŭ���� 
* Comment   : 
* History	: 2000-08-16 2:48����                 	
* 
* @version  1.0
* @author carouser
*/
public class Base64Util {

    public Base64Util() {}

    /**
     * Base64Encoding�� �����Ѵ�. binany in ascii out
     *
     * @param encodeBytes encoding�� byte array
     * @return encoding �� String
     */
    public static String encode(byte[] encodeBytes) {
        
        BASE64Encoder base64Encoder = new BASE64Encoder();
        ByteArrayInputStream bin = new ByteArrayInputStream(encodeBytes);
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        byte[] buf = null;

        try{
            base64Encoder.encodeBuffer(bin, bout);
        } catch(Exception e) {
            System.out.println("Exception");
            e.printStackTrace();
        }
        buf = bout.toByteArray();
        return new String(buf).trim();
    }

    /**
     * Base64Decoding �����Ѵ�. binany out ascii in
     *
     * @param strDecode decoding�� String
     * @return decoding �� byte array
     */
    public static byte[] decode(String strDecode) {
        
        BASE64Decoder base64Decoder = new BASE64Decoder();
        ByteArrayInputStream bin = new ByteArrayInputStream(strDecode.getBytes());
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        byte[] buf = null;

        try { 
            base64Decoder.decodeBuffer(bin, bout);
        } catch(Exception e) {
            System.out.println("Exception");
            e.printStackTrace();
        }

        buf = bout.toByteArray();

        return buf;

    }
}

