package com.hexor.controller;

import com.hexor.repo.FileBaseInfo;
import com.hexor.repo.Pager;
import com.hexor.repo.User;
import com.hexor.service.impl.FileBaseInfoService;
import com.hexor.service.impl.UserService;
import com.hexor.util.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-8-27
 * Time: 下午4:10
 * To change this template use File | Settings | File Templates.
 * 用户接口
 */
@Controller
@RequestMapping(value="user")
public class UserController {
    @Autowired
    @Qualifier("com.hexor.service.impl.UserService")
    private UserService userService = null;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    @Qualifier("com.hexor.service.impl.FileBaseInfoService")
    private FileBaseInfoService fileBaseInfoService = null;

    public void setFileBaseInfoService(FileBaseInfoService fileBaseInfoService) {
        this.fileBaseInfoService = fileBaseInfoService;
    }
    /**
     * 返回注册页面
     * @return
     */
    @RequestMapping(value="reg")
    public String reg(){
        //在此判断是否记住
        return "fontsize/register";
    }
    /**
     * 返回登陆页面
     * @return
     */
    @RequestMapping(value="login")
    public String login(){
        //在此判断是否记住
        return "fontsize/login";
    }
    /**
     * 注册接口
     * @param session
     */
    @RequestMapping(value="signup")
    public ModelAndView signup(User user,HttpSession session,HttpServletRequest request){
        User result=userService.checkUser(user.getUsername());
        String vcode=(String)session.getAttribute("validation_code");
        //当数据库中存在同名用户的时候
        if(result!=null){
            return new ModelAndView("fontsize/register", ModelMapUtil.getMsg("This username already exists!"));
        }
        if(vcode!=null&&user.getVcode()!=null){
            //转换大小写
            vcode=vcode.toLowerCase();
            String in=user.getVcode().toLowerCase();
            if(!in.equals(vcode)){
                return new ModelAndView("fontsize/register",ModelMapUtil.getMsg("Verification code  input is not correct"));
            }
        }
        try{
            user.setLoginIp(IpUtil.getIpAddr(request));
            user.setSignupTime(DateUtil.getStrOfDateTime());
            user.setLoginTime(DateUtil.getStrOfDateTime());
        }catch (Exception e){
            System.out.println("user/toSignup fall");
            Map map=ModelMapUtil.getMsg("signup fall,please try agagin!");
            return new ModelAndView("fontsize/register",map);
        }
        //验证成功，加入用户信息岛session与插入到数据库
        session.setAttribute((String) Configurer.getContextProperty("session.userinfo"), user);
        userService.insertUser(user);
        long used=fileBaseInfoService.getTotalUsed(user.getId()+"");
        ModelAndView  modelAndView=new ModelAndView("person/personalCenter/home",ModelMapUtil.getUserMap(user));
        session.setAttribute("used",used);
        //同步返回一些用户信息到个人中心主页中
        return  modelAndView;
    }
    /**
     * 登录接口
     * @return
     */
    @RequestMapping(value="tologin")
    public ModelAndView tologin(User user,HttpSession session,HttpServletRequest request){
        User result=userService.checkLogin(user);
        String vcode=(String)session.getAttribute("validation_code");
        //当数据库检验用户名密码
        if(result==null){
            return new ModelAndView("fontsize/login", ModelMapUtil.getMsg("Incorrect username or password!"));
        }
        if(vcode!=null&&user.getVcode()!=null){
            //转换大小写
            vcode=vcode.toLowerCase();
            String in=user.getVcode().toLowerCase();
            if(!in.equals(vcode)){
                return new ModelAndView("fontsize/login",ModelMapUtil.getMsg("Verification code  input is not correct"));
            }
        }
        //登录成功
        try{
            result.setLoginIp(IpUtil.getIpAddr(request));
            result.setLoginTime(DateUtil.getStrOfDateTime());
            userService.loginUpdate(result);
        }catch (Exception e){
            System.out.println("登录异常");
        }
        session.setAttribute((String) Configurer.getContextProperty("session.userinfo"), result);
        //同步返回一些用户信息到个人中心主页中
        ModelAndView modelAndView=new ModelAndView("person/personalCenter/home",ModelMapUtil.getUserMap(result)) ;
        long used=fileBaseInfoService.getTotalUsed(result.getId()+"");
        session.setAttribute("used",used);
        //添加已经使用容量

        return modelAndView;
    }

    /**
     * 用户上传文件记录
     * jqGrid前端传入参数:page 第几页 rows 一次查询多少行 sidx 排序字段 sord 升降序
     * 输出json串:total 查出的总数 page 当前第几页 records 总共多少条 rows json数据数组  flag 文件状态表示
     */
    @RequestMapping(value="uploadLogs")
    public void uploadLogs(@RequestParam(value = "page")String page,@RequestParam(value = "rows")String rows,@RequestParam(value = "flag")String flag ,HttpServletResponse response,HttpServletRequest request){
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return;//如果当前session中不存在用户
//        System.out.println("page:"+page+"rows:"+rows);
        Map map = new HashMap();
        Pager pager=new Pager();
        pager.setFlag(flag);
        pager.setType(user.getId()+""); //当前用户下的分页查询
        long count=fileBaseInfoService.getCounts(pager);//当前用户id所上传的文件总数
        pager.setData(Integer.parseInt(rows));
        pager= PagerUtil.build(PagerUtil.SetPager(pager,count,Integer.parseInt(page)));
        List<FileBaseInfo> list=fileBaseInfoService.limit(pager);
        map.put("total",count/Long.parseLong(rows)+1);//jqGrid的total表示的是总数/查询的条数的=总页数
        map.put("page",page);
        map.put("records",count);
        map.put("rows",list);
        JSONObject json = new JSONObject();
        json=JSONObject.fromObject(map); //将map对象转换成为json对象
//        System.out.println("--------"+json.toString());
        try {
            ResponseUtil.outWriteJson(response,json.toString());
        } catch (IOException e) {
        }

    }

    /**
     * 修改用户二级密码
     * @param opassword
     */
    @RequestMapping(value="modifyOPwd")
    public void modifyOPwd(@RequestParam(value = "opassowrd")String opassword,HttpServletRequest request,HttpServletResponse response){
         //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return;
        user.setOpassword(opassword);//设置二级密码
        userService.updateUser(user);
        ResponseUtil.outWriteJsonSuccess(response);

    }

    /**
     * 修改用户登录密码
     * @param request
     */
    @RequestMapping(value="modifyPwd")
    public void modifyPwd(@RequestParam(value = "oldpassword")String oldpassword,@RequestParam(value = "newpassword")String newpassword,HttpSession session,@RequestParam(value = "opassowrd")String opassowrd,HttpServletRequest request,HttpServletResponse response){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return;
        //检查密码是否匹配
        if(user.getPassword().equals(oldpassword)&&user.getOpassword().equals(opassowrd)){
            user.setPassword(newpassword);
            userService.updateUser(user);
            //更新session中用户信息
            session.setAttribute((String) Configurer.getContextProperty("session.userinfo"), user);
            ResponseUtil.outWriteJsonSuccess(response);
        }else {
            //验证成功，加入用户信息岛session与插入到数据库
            session.setAttribute((String) Configurer.getContextProperty("session.userinfo"), user);
            ResponseUtil.outWriteJsonFall(response, "登录密码或二级密码错误!");
        }
    }

    /**
     * 修改个人主页的头像
     */
    @RequestMapping(value="modifyAvatar")
    public void modifyAvatar(@RequestParam(value = "base64")String base64,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return;
//        String savePath=(String) Configurer.getContextProperty("savePath")+user.getId()+"\\avatar\\";
        String realPath=request.getSession().getServletContext().getRealPath("/")+"resources\\img\\avatar\\";//项目本地绝对路径
        System.out.println(realPath);
        //如果路径不存在，则创建路径
        MyFileUtils.newFolderMuti(realPath);
        base64=base64.substring(base64.indexOf("base64,")+"base64,".length());
        //更新下用户头像标志
        userService.updateTemp(user.getId()+"");
        ImageUtils.decodeBase64ToImage(base64,realPath,"avatar_"+user.getId()+".jpg");
        //更新session
        User newuser=userService.getUserById(user.getId()+"");
        session.setAttribute((String) Configurer.getContextProperty("session.userinfo"), newuser);
    }

    /**
     *  修改email
     * @param email
     * @param request
     */
    @RequestMapping(value="modifyEmail")
    public void modifyEmail(@RequestParam(value = "email")String email,@RequestParam(value = "password")String password,@RequestParam(value = "opassowrd")String opassowrd,HttpServletRequest request,HttpServletResponse response){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return;
        //检查密码是否匹配
        if(user.getPassword().equals(password)&&user.getOpassword().equals(opassowrd)){
            user.setEmail(email);
            userService.updateUser(user);
            ResponseUtil.outWriteJsonSuccess(response);
        } else {
            ResponseUtil.outWriteJsonFall(response,"登录密码或二级密码错误!");
        }
    }

    /**
     * 用户退出登录
     */
    @RequestMapping(value="exit")
    public void userExit(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException {
        session.removeAttribute((String) Configurer.getContextProperty("session.userinfo"));
        response.sendRedirect(request.getContextPath());
    }

    /**
     * 测试flot pie chart
     * @param request
     * @param response
     */
    @RequestMapping(value="test2")
    public void test2(HttpServletRequest request, HttpServletResponse response){
        JSONArray jsonArray=new JSONArray();
        Map map1=new HashMap();
        map1.put("label","lable1");
        map1.put("data",38.7);
        map1.put("color","#68BC31");
        jsonArray.add(map1) ;
        Map map2=new HashMap();
        map2.put("label","lable2");
        map2.put("data",48.7);
        map2.put("color","#2091CF");
        jsonArray.add(map2);
        try {
            ResponseUtil.outWriteJson(response,jsonArray.toString());
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }


    /**
     * 测试表格
     * @param request
     * @param response
     */
    @RequestMapping(value="test")
    public void test(HttpServletRequest request, HttpServletResponse response){
        Map map=new HashMap();
        map.put("total",100);
        map.put("page",5);
        map.put("records",10);
        List list=new ArrayList();
        Map map1=new HashMap();
        map1.put("id","1");
        map1.put("name","name1");
        Map map2=new HashMap();
        map2.put("name","name2");
        map2.put("id","2");
        Map map3=new HashMap();
        map3.put("name","name3");
        map3.put("id","3");
        list.add(map1);
        list.add(map2);
        list.add(map3);
        map.put("rows",list);
        JSONObject json = new JSONObject();
        json=JSONObject.fromObject(map); //将map对象转换成为json对象
        System.out.println("--------"+json.toString());
        try {
            ResponseUtil.outWriteJson(response,json.toString());
        } catch (IOException e) {
        }
    }

}
