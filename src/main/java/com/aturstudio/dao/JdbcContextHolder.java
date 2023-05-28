package com.aturstudio.dao;

public class JdbcContextHolder {
    private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();

    public static void setJdbcType(String jdbcType) {
        contextHolder.set(jdbcType);
    }

    //设置连接默认数据库源
    public static void setMaster(){
        clearJdbcType();
    }

    public static String getJdbcType() {
        return (String) contextHolder.get();
    }

    //设置连接默认数据库源
    public static void clearJdbcType() {
        contextHolder.remove();
    }
}
