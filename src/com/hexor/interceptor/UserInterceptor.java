package com.hexor.interceptor;

import com.hexor.repo.MessagePri;
import com.hexor.repo.User;
import com.hexor.service.IMessagePriService;
import com.hexor.util.Configurer;
import com.hexor.util.ModelMapUtil;
import com.hexor.util.MyFileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-2-2
 * Time: 上午9:22
 * To change this template use File | Settings | File Templates.
 * 用户登录拦截器
 * 检查当前用户session是否存在
 */
public class UserInterceptor implements HandlerInterceptor {
    @Autowired
    @Qualifier("com.hexor.service.impl.MessagePriService")
    private IMessagePriService messagePriService=null;
    public void setMessagePriService(IMessagePriService messagePriService) {
        this.messagePriService = messagePriService;
    }

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        User user=(User)httpServletRequest.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));
        if(user==null){
            //session没有用户信息，跳转到登录页面
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/user/login");
        }else{
            //有session信息的时候 查看当前用户的消息 放入session中
            httpServletRequest.getSession().setAttribute("messages",messagePriService.getMyMessagesCounts(user.getId()+""));
        }
        return true;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        //To change body of implemented methods use File | Settings | File Templates.
    }
}
