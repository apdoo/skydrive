package com.hexor.interceptor;

import com.hexor.repo.User;
import com.hexor.util.Configurer;
import com.hexor.util.ModelMapUtil;
import com.hexor.util.MyFileUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        User user=(User)httpServletRequest.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));
        if(user==null){
            //session没有用户信息，跳转到登录页面
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/user/login");
        }else{
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
