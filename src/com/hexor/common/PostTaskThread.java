package com.hexor.common;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-06-27
 * Time: 16:14
 * 发帖工具类
 * mm的地址是 21mybbs.me
 * 御花王朝  184.164.72.160
 * 新巴黎    http://107.150.17.66
 *
 */
public class PostTaskThread extends Thread {
    //编码方式
    private static String GBK="GBK";
    private static String UTF8="UTF-8";
    //使用的用户名与密码
    private String userName="";
    private String password="";


    /**
     * 构造方法
     * @param name 线程名
     * @param userName 用户名
     * @param password 密码
     */
    public PostTaskThread(String name, String userName, String password) {
        super(name);
        this.userName = userName;
        this.password = password;
    }

    /**
     * 无参构造方法
     */
    public PostTaskThread() {
    }

    public void run(){
        xinbali_login();
    }

    /**
     * 新巴黎登录方法
     * @return
     */
    public Boolean xinbali_login(){

        return true;
    }

}
