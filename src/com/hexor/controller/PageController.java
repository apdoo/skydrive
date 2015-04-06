package com.hexor.controller;

import com.hexor.repo.*;
import com.hexor.service.IDownloadLogsService;
import com.hexor.service.IMessagePriService;
import com.hexor.service.ITicketService;
import com.hexor.service.impl.FileBaseInfoService;
import com.hexor.util.Configurer;
import com.hexor.util.ModelMapUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-1-23
 * Time: 下午3:04
 * To change this template use File | Settings | File Templates.
 * 登陆以后的个人中心页面控制器
 * /person/*请求都有个拦截器在拦截
 */
@Controller
@RequestMapping(value = "person")
public class PageController {
    @Autowired
    @Qualifier("com.hexor.service.impl.FileBaseInfoService")
    private FileBaseInfoService fileBaseInfoService = null;
    public void setFileBaseInfoService(FileBaseInfoService fileBaseInfoService) {
        this.fileBaseInfoService = fileBaseInfoService;
    }

    @Autowired
    @Qualifier("com.hexor.service.impl.DownloadLogsService")
    private IDownloadLogsService downloadLogsService=null;

    public void setDownloadLogsService(IDownloadLogsService downloadLogsService) {
        this.downloadLogsService = downloadLogsService;
    }
    @Autowired
    @Qualifier("com.hexor.service.impl.MessagePriService")
    private IMessagePriService messagePriService=null;
    public void setMessagePriService(IMessagePriService messagePriService) {
        this.messagePriService = messagePriService;
    }
    @Autowired
    @Qualifier("com.hexor.service.impl.TicketService")
    private ITicketService ticketService = null;
    public void setUserService(ITicketService ticketService) {
        this.ticketService = ticketService;
    }
    /**
     * [个人中心]-[个人概况]
     */
    @RequestMapping(value="home")
    public ModelAndView home(HttpServletRequest request,HttpServletResponse response){
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return new ModelAndView("fontsize/login");
        //上传文件数
        long uploads=fileBaseInfoService.getTotalUploads(user.getId()+"");
        //文件被下载总数
        long downloads=fileBaseInfoService.getTotalDownloads(user.getId()+"");
        //私信数
        long messages=0;
        //最近文件
        List<FileBaseInfo> list=fileBaseInfoService.getRecentlyFiles(user.getId()+"");
        ModelAndView modelAndView=new ModelAndView("person/personalCenter/home", ModelMapUtil.getDownloadAnalysisMap(uploads, downloads, messages,list));
        return modelAndView;
    }
    /**
     * [个人中心]-[安全中心]
     */
    @RequestMapping(value="safe")
    public String safeCenter(HttpServletRequest request,HttpServletResponse response){
        return "person/personalCenter/safeCenter";
    }

    /**
     * [个人中心]-[创建工单]
     */
    @RequestMapping(value="ticketPost")
    public String ticketPost(HttpServletRequest request){
        //创建工单号

        return "person/personalCenter/ticketPost";
    }

    /**
     *[个人中心]-[我的工单]
     */
    @RequestMapping(value="myTickets")
    public ModelAndView myTickets(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return new ModelAndView("person/personalCenter/home");
        //查询当前我的工单的
        List<TicketInfo> list=ticketService.getMyTickets(String.valueOf(user.getId()));
        ModelAndView modelAndView=new ModelAndView("person/personalCenter/myTickets");
        modelAndView.addObject("mytickets",list);
        return modelAndView;
    }
    /**
     * [分析系统]-[收入概况]
     */
    @RequestMapping(value="incomeAnalysisPage")
    public String incomeAnalysisPage(HttpServletRequest request){
        return "person/analysisSystem/incomeAnalysisPage";
    }
    /**
     * [分析系统]-[下载分析]
     */
    @RequestMapping(value="downloadsAnalysisPage")
    public ModelAndView downloadsAnalysisPage(HttpServletRequest request,HttpServletResponse response){
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return new ModelAndView("person/personalCenter/home");
        //上传文件数
        long uploads=fileBaseInfoService.getTotalUploads(user.getId()+"");
        //文件被下载总数
        long downloads=fileBaseInfoService.getTotalDownloads(user.getId()+"");
        //私信数
        long messages=messagePriService.getMyMessagesCounts(user.getId()+"");
        //热门文件
        List<FileBaseInfo> list=fileBaseInfoService.getHotFiles(user.getId()+"");
        ModelAndView modelAndView=new ModelAndView("person/analysisSystem/downloadsAnalysisPage", ModelMapUtil.getDownloadAnalysisMap(uploads, downloads, messages,list));
        return modelAndView;
    }
    /**
     * [空间管理]-[上传文件]
     * @return
     */
    @RequestMapping(value="uploadPage")
    public String uploadPage(HttpServletRequest request){
        return "person/spaceManager/uploadPage";
    }

    /**
     * [空间管理]-[文件管理]
     */
    @RequestMapping(value="fileManagerPage")
    public String fileManagerPage(HttpServletRequest request){
        return "person/spaceManager/fileManagerPage";
    }
    /**
     * [空间管理]-[文件搜索]
     */
    @RequestMapping(value="fileSearchPage")
    public String fileSearchPage(HttpServletRequest request){
        return "person/spaceManager/fileSearchPage";
    }
    /**
     * [空间管理]-[文件回收]
     */
    @RequestMapping(value="filerecyclingPage")
    public String filerecyclingPage(HttpServletRequest request){
        return "person/spaceManager/filerecyclingPage";
    }
    /**
     * [管理员功能]-[发布公告]
     */
    @RequestMapping(value="announcePost")
    public String announcePost(HttpServletRequest request){
        return "person/admin/announcePost";
    }
    /**
     * [管理员功能]-[公告管理]
     */
    @RequestMapping(value="announceManager")
    public String announceManagerPage(HttpServletRequest request){
        return "person/admin/announceManagerPage";
    }
    /**
     * [管理员功能]-[发送消息]
     */
    @RequestMapping(value="messageSend")
    public String messageSend(HttpServletRequest request){
        return "person/admin/messageSend";
    }
    /**
     * [管理员功能]-[消息管理]
     */
    @RequestMapping(value="messageManager")
    public String messageManager(HttpServletRequest request){
        return "person/admin/messageManager";
    }
    /**
     * [管理员功能]-[用户管理]
     */
    @RequestMapping(value="userManager")
    public String userManager(HttpServletRequest request){
        return "person/admin/userManager";
    }
    /**
     * [管理员功能]-[工单管理]
     */
    @RequestMapping(value="ticketManager")
    public String ticketManager(HttpServletRequest request){
        return "person/admin/ticketManager";
    }


    /**
     * [消息]-[我的消息]
     */
    @RequestMapping(value="myMessage")
    public ModelAndView myMessage(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return new ModelAndView("person/personalCenter/home");
        //根据当前session中的消息查看所有的接收消息
        List<MessagePri> list=messagePriService.getAllMyMessages(String.valueOf(user.getId()));
        ModelAndView modelAndView=new ModelAndView("person/message/myMessage");
        modelAndView.addObject("mymessagelist",list);
        return modelAndView;
    }


}
