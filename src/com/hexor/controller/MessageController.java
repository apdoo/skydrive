package com.hexor.controller;

import com.hexor.repo.MessagePri;
import com.hexor.repo.Pager;
import com.hexor.repo.User;
import com.hexor.service.IMessagePriService;
import com.hexor.service.impl.UserService;
import com.hexor.util.Configurer;
import com.hexor.util.PagerUtil;
import com.hexor.util.ResponseUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sun.org.mozilla.javascript.internal.json.JsonParser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-3-18
 * Time: 下午1:40
 * To change this template use File | Settings | File Templates.
 * 消息接口
 */
@Controller
@RequestMapping(value="message")
public class MessageController {
    @Autowired
    @Qualifier("com.hexor.service.impl.UserService")
    private UserService userService = null;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    @Autowired
    @Qualifier("com.hexor.service.impl.MessagePriService")
    private IMessagePriService messagePriService=null;
    public void setMessagePriService(IMessagePriService messagePriService) {
        this.messagePriService = messagePriService;
    }


    /**
     * 根据用户id查看当前用户还未查看的私信
     * @param userId
     * @param request
     * @param response
     */
    @RequestMapping(value = "getMyMessages")
    public void getMyMessages(@RequestParam(value = "userId") String userId,HttpServletRequest request,HttpServletResponse response){
         //就不判断session了 反正是ajax请求
         List<MessagePri> list=messagePriService.getMyMessages(userId);
         JSONObject jsonObject =new JSONObject();
         jsonObject.put("success",false);
         if(list!=null&&list.size()>0){
             jsonObject.put("success",true);
             jsonObject.put("data",list);
         }
        try {
            ResponseUtil.outWriteJson(response, jsonObject.toString());
        } catch (IOException e) {
        }
    }

    /**
     * 发送消息
     */
     @RequestMapping(value = "sendMessage")
     public void sendMessage(@RequestParam(value = "userName") String userName,@RequestParam(value = "messageTitle") String messageTitle,@RequestParam(value = "messageContent") String messageContent, HttpServletRequest request,HttpServletResponse response){
         //判断session中是否有该用户信息
         User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
         if(user==null||user.getType()!=1) return;//session不存在用户或者用户不为管理员的时候
        try{
            //获得发送的用户 拿去id
            String temp[]=userName.split(",");
            List<User> list=new ArrayList<User>();
            //循环发送的用户名
            for(int i=0;i<temp.length;i++){
                User u=userService.getUserByUsername(temp[i]);
                if(u!=null) {
                    //如果存在当前用户则插入到私信记录表中
                    MessagePri messagePri=new MessagePri(u.getId(),u.getUsername(),messageTitle,messageContent);
                    messagePriService.insertMessage(messagePri);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("send message Exception!");
        }
         ResponseUtil.outWriteJsonSuccess(response);
     }

    /**
     * 阅读了某个消息
     * @param id
     * @param request
     * @param response
     */
    @RequestMapping(value = "myMessageRead")
    public void myMessageRead(@RequestParam(value = "id") String id,HttpServletRequest request,HttpServletResponse response){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return;//session不存在用户或者用户不为管理员的时候
        JSONObject jsonObject =new JSONObject();
        jsonObject.put("success",true);
        //修改该消息的阅读标志
         messagePriService.updateRead(id);
        try {
            ResponseUtil.outWriteJson(response, jsonObject.toString());
        } catch (IOException e) {
        }
    }

    /**
     * 管理员-分页查看消息
     */
    @RequestMapping(value = "getMessages")
    public void getMessages(@RequestParam(value = "page")String page,@RequestParam(value = "rows")String rows ,HttpServletResponse response,HttpServletRequest request){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null||user.getType()!=1) return;//session不存在用户或者用户不为管理员的时候
        Map map = new HashMap();
        Pager pager=new Pager();
        long count= messagePriService.getMessageCounts();//获得当前用户总数
        pager.setData(Integer.parseInt(rows));
        pager= PagerUtil.build(PagerUtil.SetPager(pager, count, Integer.parseInt(page)));
        List<MessagePri> list =messagePriService.limit(pager);
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
     * 修改消息内容
     */
    @RequestMapping(value = "updateMessage")
    public void updateMessage(MessagePri messagePri, HttpServletRequest request,HttpServletResponse response){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null||user.getType()!=1) return;//session不存在用户或者用户不为管理员的时候
        messagePriService.updateMessage(messagePri);
        ResponseUtil.outWriteJsonSuccess(response);
    }
    /**
     * 删除消息
     */
    @RequestMapping(value = "deleteMessage")
    public void  deleteMessage(@RequestParam(value = "ids") String ids,HttpServletRequest request,HttpServletResponse response){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null||user.getType()!=1) return;//session不存在用户或者用户不为管理员的时候
        List<Long> ll=buildList(ids);
        messagePriService.deleteMessage(ll);
        ResponseUtil.outWriteJsonSuccess(response);
    }
    /**
     * 适应mybatis select in sql写法所需的参数
     * @param str
     * @return
     */
    public  List<Long>  buildList(String str){
        List<Long> ll=new ArrayList<Long>();
        String temp[]=str.split(",");
        for(int i=0;i<temp.length;i++){
            ll.add(Long.parseLong(temp[i]));
        }
        return ll;
    }
}
