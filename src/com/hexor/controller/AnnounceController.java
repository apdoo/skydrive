package com.hexor.controller;

import com.hexor.repo.Announce;
import com.hexor.repo.User;
import com.hexor.service.IAnnounceService;
import com.hexor.util.Configurer;
import com.hexor.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-2-4
 * Time: 上午3:13
 * To change this template use File | Settings | File Templates.
 * 公告相关 控制器
 */
@Controller
@RequestMapping(value="announce")
public class AnnounceController {
    @Autowired
    @Qualifier("com.hexor.service.impl.AnnounceService")
    private IAnnounceService announceService = null;

    public void setAnnounceService(IAnnounceService announceService) {
        this.announceService = announceService;
    }

    /**
     * 获得最新的10条公告
     */
    @RequestMapping(value = "getAnns")
    public void getAnns(HttpServletResponse response) throws IOException {
        Map map=new HashMap();
        map.put("index",0);
        map.put("data",10);
        JSONObject jsonObject=new JSONObject();
        JSONArray josnArr=new JSONArray();
        List<Announce> list=announceService.selectRecentlyA(map) ;
        jsonObject.put("list",JSONArray.fromObject(list));
        ResponseUtil.outWriteJson(response,jsonObject.toString());
    }

    /**
     * 获得一条公告
     * @param request
     * @param aid 公告ID号
     * @param response
     */
    @RequestMapping(value = "detail")
    public ModelAndView detail(@RequestParam("aid")String aid,HttpServletRequest request,HttpServletResponse response){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("fontsize/announce");
        Announce announce=announceService.getAnnById(aid);
        modelAndView.addObject("announce",announce);
        return modelAndView;
    }

    /**
     * 公告历史记录
     * @param page 当前请求的页数
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "history")
    public ModelAndView history(@RequestParam("page")String page,HttpServletRequest request,HttpServletResponse response){
           ModelAndView modelAndView=new ModelAndView();
           modelAndView.setViewName("fontsize/announcehistory");
           int count=0;
           int p=1;
           try{
                count= announceService.getCounts()/10+1;
                p=Integer.parseInt(page);
           }catch (Exception e){
           }
           Map map=new HashMap();
           map.put("index",10*(p-1));
           map.put("data",10*p);
            List<Announce> list=announceService.selectRecentlyA(map) ;
            modelAndView.addObject("count",count);
            modelAndView.addObject("current_page",page);
            modelAndView.addObject("list",list);
           return modelAndView;
    }

    /**
     * 发布公告
     * @param request
     * @param response
     */
    @RequestMapping(value = "issueAnnounce")
    public void  issueAnnounce(@RequestParam(value = "title") String title,@RequestParam(value = "content") String content,@RequestParam(value = "top") Boolean top, HttpServletRequest request,HttpServletResponse response){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null||user.getType()!=1) return;//session不存在用户或者用户不为管理员的时候
        Announce announce=new Announce(content,title,top,user);
        announceService.insertAnn(announce);
        ResponseUtil.outWriteJsonSuccess(response);

    }

    @RequestMapping(value="recently")
    public void  recently(HttpServletRequest request,HttpServletResponse response){
        Map map=new HashMap();
        map.put("index",0);
        map.put("data",9);
         List<Announce> list=announceService.selectRecentlyA(map);
        JSONObject json = new JSONObject();
        json.put("success",false);
        json.put("data",list);
        if(list.size()>0) json.put("success",true);
        try {
            ResponseUtil.outWriteJson(response, json.toString());
        } catch (IOException e) {
        }
    }

}