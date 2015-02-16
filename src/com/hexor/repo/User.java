package com.hexor.repo;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-1-24
 * Time: 上午11:11
 * To change this template use File | Settings | File Templates.
 */
public class User {
    private int id;//用户id
    private String username="";//会员登录账号
    private String password=""; //会员登录密码
    private String opassword="";//二级密码
    private String email="";//会员email
    private String signupTime="";//注册时间
    private int initCapacity=1024;//初始容量1024mb
    private int usedCapacity;//已用容量
    private int points=100;//会员积分，初始积分100
    private int income;//收入
    private int type;//用户类型 0为普通用户 1为管理员用户
    private String  loginIp;//登陆ip
    private String loginTime;//最后登陆时间
    private String temp="0";//临时字段 如果temp=1 表示有自定义头像 temp!=1表示没有
    private String vcode="";//注册码字段

    public String getVcode() {
        return vcode;
    }

    public void setVcode(String vcode) {
        this.vcode = vcode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOpassword() {
        return opassword;
    }

    public void setOpassword(String opassword) {
        this.opassword = opassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSignupTime() {
        return signupTime;
    }

    public void setSignupTime(String signupTime) {
        this.signupTime = signupTime;
    }

    public int getInitCapacity() {
        return initCapacity;
    }

    public void setInitCapacity(int initCapacity) {
        this.initCapacity = initCapacity;
    }

    public int getUsedCapacity() {
        return usedCapacity;
    }

    public void setUsedCapacity(int usedCapacity) {
        this.usedCapacity = usedCapacity;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getIncome() {
        return income;
    }

    public void setIncome(int income) {
        this.income = income;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime;
    }

    public String getTemp() {
        return temp;
    }

    public void setTemp(String temp) {
        this.temp = temp;
    }
}
