package com.hexor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-1-19
 * Time: 下午8:45
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class MainController {

    @RequestMapping(value="uptest")
    public String home(HttpSession session, HttpServletResponse response,ModelMap model){
        //在此判断是否记住
        return "uploadTest";
    }


}
