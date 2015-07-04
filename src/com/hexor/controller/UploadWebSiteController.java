package com.hexor.controller;

import com.hexor.common.PostCallableThread;
import com.hexor.common.PostParamConstant;
import com.hexor.common.PostTaskListener;
import com.hexor.common.PostTaskThread;
import com.hexor.repo.CollectLogs;
import com.hexor.repo.Pager;
import com.hexor.repo.User;
import com.hexor.service.ICollectLogsService;
import com.hexor.service.impl.CollectLogsService;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-6-6
 * Time: 11:27
 * 将网盘的种子上传到
 *  * mm的地址是 21mybbs.me
 * 御花王朝  184.164.72.160
 * 新巴黎    http://107.150.17.66
 * 这三个站点上
 */
@Controller
@RequestMapping(value="website")
public class UploadWebSiteController {

    @Autowired
    @Qualifier("com.hexor.service.impl.CollectLogsService")
    private ICollectLogsService collectLogsService = null;
    public void setCollectLogsService(ICollectLogsService collectLogsService) {
        this.collectLogsService = collectLogsService;
    }

    /**
     *[发帖管理]-[发布]
     * @param ids 发布的种子的id
     * @param webSite 发布的站点
     * @param section 发布的站点的版块
     * @param response
     * @param request
     */
    @RequestMapping(value = "startPost")
    public void startPost(@RequestParam(value = "ids")String ids,@RequestParam(value = "webSite")String webSite ,@RequestParam(value = "section")String section,@RequestParam( value="bischecked")Boolean bischecked,HttpServletResponse response,HttpServletRequest request){
        System.out.println(ids + webSite + section+bischecked);
        ExecutorService executor = Executors.newCachedThreadPool();
        ids=ids.replace("on,","");//替换是否上传按钮传入的特殊字符
        List<Long> ll=buildList(ids);
        List<CollectLogs> list=collectLogsService.selectInIds(ll);//获得查询到的文件信息结果
        PostCallableThread thread=null;
        //判断网站选择网站不同的登录用户
        if(webSite.equals(PostParamConstant.xinbali_name)){
              //新巴黎线程初始化
              thread=new PostCallableThread(list,webSite,section, bischecked,PostParamConstant.getXinBaLiUser().getUsername(),PostParamConstant.getXinBaLiUser().getPassword());
        }else if(webSite.equals(PostParamConstant.mmhouse_name)){
             //mmhouse线程初始化
            thread=new PostCallableThread(list,webSite,section, bischecked,PostParamConstant.getMMhouseUser().getUsername(),PostParamConstant.getMMhouseUser().getPassword());
        }else if(webSite.equals(PostParamConstant.yhwc_name)){
            //御花王朝线程初始化
            thread=new PostCallableThread(list,webSite,section,bischecked, PostParamConstant.getYhwcUser().getUsername(),PostParamConstant.getYhwcUser().getPassword());
        }
        Future<String> result = executor.submit(thread);
        executor.shutdown();
        JSONObject json=new JSONObject();
        try {
            json.put("data", result.get());
            ResponseUtil.outWriteJson(response, json.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * [发帖管理]-[开始]
     * @param collectlogs_section 采集类型
     * @param updatetime 采集时间
     * @param response
     * @param request
     */
    @RequestMapping(value = "showCollectLogsByParam")
    public void showCollectLogsByParam(@RequestParam(value = "collectlogs_section")String collectlogs_section,@RequestParam(value = "updatetime")String updatetime ,HttpServletResponse response,HttpServletRequest request) {
        Map map=new HashMap();
        map.put("section",collectlogs_section);
        map.put("updatetime", updatetime);
        List<CollectLogs> list=collectLogsService.showCollectLogsByParam(map);
        JSONObject json=new JSONObject();
        json.put("data", list);
        try {
            ResponseUtil.outWriteJson(response, json.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * jqgrid 分页查询
     * @param page
     * @param rows
     * @param response
     * @param request
     */
    @RequestMapping(value = "getCollectLogs")
    public void getCollectLogs(@RequestParam(value = "page")String page,@RequestParam(value = "rows")String rows ,HttpServletResponse response,HttpServletRequest request){
        //判断session中是否有该用户信息
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null||user.getType()!=1) return;//session不存在用户或者用户不为管理员的时候
        Map map = new HashMap();
        Pager pager=new Pager();
        long count=collectLogsService.getCollectLogsCount();
        pager.setData(Integer.parseInt(rows));
        pager= PagerUtil.build(PagerUtil.SetPager(pager, count, Integer.parseInt(page)));
        List<CollectLogs> list=collectLogsService.limit(pager);
        map.put("total",count/Long.parseLong(rows)+1);//jqGrid的total表示的是总数/查询的条数的=总页数
        map.put("page",page);
        map.put("records", count);
        map.put("rows",list);
        JSONObject json = new JSONObject();
        json=JSONObject.fromObject(map); //将map对象转换成为json对象
//        System.out.println("--------"+json.toString());
        try {
            ResponseUtil.outWriteJson(response, json.toString());
        } catch (IOException e) {
        }
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
