package com.lixiang.ssm.utils;

import java.security.MessageDigest;

import sun.misc.BASE64Encoder;

public class Tool {
	
	public static String MD5(String str){
		String newstr="";
		try {
        //确定计算方法
        MessageDigest md5= MessageDigest.getInstance("MD5");
        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串
        newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return newstr;
    }

}
