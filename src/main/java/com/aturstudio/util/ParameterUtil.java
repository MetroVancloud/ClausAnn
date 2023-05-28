package com.aturstudio.util;

import java.io.UnsupportedEncodingException;

/**
 * @author Fan Yunlong
 * @create 2019/1/24 22:27
 * @update 2019/1/24 22:27
 * 参数工具
 */
public class ParameterUtil {
    public static boolean isGBK = false;

//    static {
//        String encoding = Config.getParamValue("Tomcat.URIEncoding");
//        isGBK = "GBK".equalsIgnoreCase(encoding)
//                || "GB2312".equalsIgnoreCase(encoding);
//    }

//    public static String getParameter(HttpServletRequest request, String name) {
//        String value = request.getParameter(name);
//        return reEncode(value);
//    }

    /**
     * 重新编码
     */
    public static String reEncode(String value) {
        if (value != null) {
            try {
                if(isGBK) {
                    // donoting
                } else {
                    value = new String(value.getBytes("ISO8859-1"), "UTF-8");
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                value = "";
            }
        }
        return value;
    }

    /*public static String getParameter(HttpServletRequest request, String... names) {
        for(String name : names) {
            String temp = getParameter(request, name);
            if(temp!=null) {
                return temp;
            }
        }

        return null;
    }*/
}
