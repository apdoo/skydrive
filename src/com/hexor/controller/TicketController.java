package com.hexor.controller;

import com.hexor.repo.Pager;
import com.hexor.repo.TicketInfo;
import com.hexor.repo.TicketReplay;
import com.hexor.repo.User;
import com.hexor.service.ITicketService;
import com.hexor.service.impl.TicketService;
import com.hexor.util.Configurer;
import com.hexor.util.PagerUtil;
import com.hexor.util.ResponseUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-3-30
 * Time: 下午11:27
 * To change this template use File | Settings | File Templates.
 * 工单接口
 */
@Controller
@RequestMapping(value="ticket")
public class TicketController {
    @Autowired
    @Qualifier("com.hexor.service.impl.TicketService")
    private ITicketService ticketService = null;
    public void setUserService(ITicketService ticketService) {
        this.ticketService = ticketService;
    }

    /**
     * 创建一条工单
     */
    @RequestMapping(value="ticketCreate")
    public void ticketCreate(TicketInfo ticketInfo,HttpServletRequest request,HttpServletResponse response){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return;
        //设置user信息
        ticketInfo.setUserId(user.getId());
        ticketInfo.setUserName(user.getUsername());
        ticketService.insertTicketInfo(ticketInfo);
        ResponseUtil.outWriteJsonSuccess(response);
    }
    /**
     * 管理员分页查看工单
     */
    @RequestMapping(value="getAllTickets")
    public void getAllTickets(@RequestParam(value = "page")String page,@RequestParam(value = "rows")String rows ,HttpServletResponse response,HttpServletRequest request){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null||user.getType()!=1) return;//session不存在用户或者用户不为管理员的时候
        Map map = new HashMap();
        Pager pager=new Pager();
        long count=ticketService.getTicketCounts();//
        pager.setData(Integer.parseInt(rows));
        pager= PagerUtil.build(PagerUtil.SetPager(pager, count, Integer.parseInt(page)));
        List<TicketInfo> list =ticketService.limit(pager);
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
     * 用户自己追加工单问题
     */
    @RequestMapping(value = "userAddTicket")
    public void   userAddTicket(@RequestParam(value = "ticketId")String ticketId,@RequestParam(value = "content")String content,HttpServletResponse response,HttpServletRequest request){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return;
        TicketReplay ticketReplay=new TicketReplay(Integer.parseInt(ticketId),user.getId(),user.getUsername(),user.getId(),user.getUsername(),content);
        //设置工单状态
        Map map=new HashMap();
        map.put("id",ticketId);
        map.put("status","0");
        ticketService.updateStatus(map);
        ticketService.insertTicketReplay(ticketReplay);
        ResponseUtil.outWriteJsonSuccess(response);
    }

    /**
     * 管理员用户回复一条工单
     */
   @RequestMapping(value = "insertTicketReplay")
   public void  insertTicketReplay(@RequestParam(value = "userName")String userName,@RequestParam(value = "userId")String userId,@RequestParam(value = "ticketId")String ticketId,@RequestParam(value = "content")String content,HttpServletResponse response,HttpServletRequest request){
       //判断session中是否有该用户信息
       User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
       if(user==null||user.getType()!=1) return;//session不存在用户或者用户不为管理员的时候
       TicketReplay ticketReplay=new TicketReplay(Integer.parseInt(ticketId),Integer.parseInt(userId),userName,user.getId(),user.getUsername(),content);
       //设置工单状态
       Map map=new HashMap();
       map.put("id",ticketId);
       map.put("status","1");
       ticketService.updateStatus(map);
       ticketService.insertTicketReplay(ticketReplay);
       ResponseUtil.outWriteJsonSuccess(response);
   }

    /**
     * 查询当前工单号所对应的工单回复信息
     */
    @RequestMapping(value = "getTicketReplays")
    public void   getTicketReplays(@RequestParam(value = "ticketId")String ticketId,HttpServletResponse response,HttpServletRequest request){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return;
        List<TicketReplay> list=ticketService.getTicketReplays(ticketId);
        JSONObject json=new JSONObject();
        json.put("success",false);
        if(list.size()>0){
            json.put("success",true);
            json.put("data",list);
        }
        try {
            ResponseUtil.outWriteJson(response,json.toString());
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }

    /**
     * 查询当前工单号所对应的工单回复信息
     */
    @RequestMapping(value = "getUnTickets")
    public void   getUnTickets(HttpServletResponse response,HttpServletRequest request){
          JSONObject jsonObject=new JSONObject();
          jsonObject.put("data",ticketService.getUnTickets());
        try {
            ResponseUtil.outWriteJson(response,jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
}
