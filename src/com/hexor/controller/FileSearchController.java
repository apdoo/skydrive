package com.hexor.controller;

import com.hexor.repo.FileBaseInfo;
import com.hexor.service.impl.FileBaseInfoService;
import com.hexor.util.ModelMapUtil;
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
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-2-3
 * Time: 下午4:39
 * To change this template use File | Settings | File Templates.
 * 网站前端文件搜索功能
 */
@Controller
@RequestMapping(value="search")
public class FileSearchController {
    @Autowired
    @Qualifier("com.hexor.service.impl.FileBaseInfoService")
    private FileBaseInfoService fileBaseInfoService = null;

    public void setFileBaseInfoService(FileBaseInfoService fileBaseInfoService) {
        this.fileBaseInfoService = fileBaseInfoService;
    }

    /**
     * 文件搜索首页
     * @return
     */
    @RequestMapping(value="home")
    public String home(){
        //在此判断是否记住
        return "fontsize/search";
    }

    /**
     * 查询
     * @param fileName
     * @param request
     * @param response
     */
    @RequestMapping(value="doSearch")
    public ModelAndView search(@RequestParam(value = "fileName")String fileName,HttpServletRequest request,HttpServletResponse response){
        try {
            fileName = new String(fileName.getBytes("iso8859-1"),"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        //在此判断是否记住
        List<FileBaseInfo> list= fileBaseInfoService.searchFileName(fileName);
        ModelAndView modelAndView=new ModelAndView("fontsize/searchResult", ModelMapUtil.getDownloadAnalysisMap(0, 0, 0, list));
        return modelAndView;
    }

    /**
     * 下载页面
     * @return
     */
    @RequestMapping(value = "downloadPage")
    public ModelAndView downloadPage(@RequestParam(value = "id")String id,HttpServletRequest request, HttpServletResponse response){
        FileBaseInfo fileBaseInfo=fileBaseInfoService.selectById(id);
        ModelAndView modelAndView=new ModelAndView("fontsize/downloadPage");
        modelAndView.addObject("file",fileBaseInfo);
        return modelAndView;
    }
}
