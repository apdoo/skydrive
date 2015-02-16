package com.hexor.controller;

import com.hexor.repo.DownloadLogs;
import com.hexor.repo.FileBaseInfo;
import com.hexor.repo.User;
import com.hexor.service.IDownloadLogsService;
import com.hexor.service.impl.DownloadLogsService;
import com.hexor.service.impl.FileBaseInfoService;
import com.hexor.util.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-2-2
 * Time: 下午10:39
 * To change this template use File | Settings | File Templates.
 * 网盘文件上传下载接口
 */
@Controller
@RequestMapping(value="file")
public class FileBaseInfoController {

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

    /**
     * 文件还原-修改文件标志，将文件从回收站还原
     * @param ids
     * @param request
     * @param response
     */
    @RequestMapping(value = "reduction")
    public void fileReduction(@RequestParam(value = "ids")String ids,HttpServletRequest request,HttpServletResponse response){
        List<Long> ll=buildList(ids);
        fileBaseInfoService.reductionInIds(ll);
        ResponseUtil.outWriteJsonSuccess(response);
    }
    /**
     * 文件回收-修改文件标志 使文件进入回收站
     * @param ids
     * @param request
     * @param response
     */
    @RequestMapping(value = "recover")
    public void fileRecover(@RequestParam(value = "ids")String ids,HttpServletRequest request,HttpServletResponse response){
        List<Long> ll=buildList(ids);
        fileBaseInfoService.recoverInIds(ll);
        ResponseUtil.outWriteJsonSuccess(response);
    }

    /**
     * 文件删除
     * @param ids
     * @param request
     * @param response
     */
    @RequestMapping(value = "delete")
    public void delete(@RequestParam(value = "ids")String ids,HttpServletRequest request,HttpServletResponse response){
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return;
        String savePath=(String) Configurer.getContextProperty("savePath");//获得当前存文件的本地跟路径
        String path=savePath+"/"+user.getId()+"/";
        List<Long> ll=buildList(ids);
        //当前文件名，删除本地所存的文件
        List<FileBaseInfo> list=fileBaseInfoService.selectInIds(ll);//获得查询到的文件信息结果
        for(FileBaseInfo bean:list){
            MyFileUtils.deleteQuietlyByFilePath(path+bean.getFileName());
        }
        fileBaseInfoService.deleteInIds(ll);
        JSONObject json = new JSONObject();
        json.put("success",true);
        ResponseUtil.outWriteJsonSuccess(response);
    }

    /**
     * 根据ids查询当前文件列表信息并且拼装为下载链接地址返回
     * @param ids
     */
    @RequestMapping(value="downloadUrl")
    public void  downloadUrl(@RequestParam(value = "ids")String ids,HttpServletRequest request,HttpServletResponse response){
        JSONArray jsonArray = new JSONArray();
        String rootUrl= request.getRequestURL().toString().replace(request.getServletPath(),"");//请求url根路径
         List<Long> ll=buildList(ids);
        List<FileBaseInfo> list=fileBaseInfoService.selectInIds(ll);//获得查询到的文件信息结果
        for(FileBaseInfo bean:list){
            jsonArray.add(rootUrl+"/file/download?userId="+bean.getUserId()+"&fileName="+bean.getFileName());
        }
        try {
            ResponseUtil.outWriteJson(response, jsonArray.toString());
        } catch (IOException e) {
        }
    }

    /**
     * 根据用户id和文件名下载文件
     * @param userId
     * @param fileName
     * @param response
     * @return
     */
    @RequestMapping(value="download")
    public HttpServletResponse download(@RequestParam(value = "userId")String userId,@RequestParam(value = "fileName")String fileName,HttpServletRequest request, HttpServletResponse response){
        String savePath=(String) Configurer.getContextProperty("savePath");//获得当前存文件的本地跟路径
        try {
            fileName = new String(fileName.getBytes("iso8859-1"),"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        String path=savePath+"/"+userId+"/"+fileName;
        try{
        // path是指欲下载的文件的路径。
        File file = new File(path);
        // 取得文件名。
        String filename = file.getName();
        // 取得文件的后缀名。
        String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
        // 以流的形式下载文件。
        InputStream fis = new BufferedInputStream(new FileInputStream(path));
        byte[] buffer = new byte[fis.available()];
        fis.read(buffer);
        fis.close();
        // 清空response
        response.reset();
        // 设置response的Header
//        response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
        response.addHeader("Content-Disposition", "attachment;filename=" +  java.net.URLEncoder.encode(fileName, "UTF-8")); //解决中文乱码问题
//        response.addHeader("Content-Disposition", "attachment;filename=" +  new String( fileName.getBytes("gb2312"), "ISO8859-1" ) ); 也可以
        response.addHeader("Content-Length", "" + file.length());
        OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
        response.setContentType("application/octet-stream");
        toClient.write(buffer);
        toClient.flush();
        toClient.close();
    } catch (IOException ex) {
        ex.printStackTrace();
    }
        Map map=new HashMap();
        map.put("userId",userId);
        map.put("fileName",fileName);
      //文件下载次数+1
      fileBaseInfoService.fileDownloadsAdd(map);
      //记录下载日志
      String ip= IpUtil.getIpAddr(request);
      String time=DateUtil.getStrOfDateTime();
      DownloadLogs downloadLogs=new DownloadLogs(Integer.parseInt(userId),fileName,ip,time);
      downloadLogsService.insertDownloadLogs(downloadLogs);
      return response;
    }
    /**
     * 文件下载测试
     * @param path 本地文件的路径
     * @param response
     * @return
     */
    @RequestMapping(value="downloadTest")
    public HttpServletResponse downloadTest(@RequestParam(value = "path")String path, HttpServletResponse response){
        try {
            // path是指欲下载的文件的路径。
            File file = new File(path);
            // 取得文件名。
            String filename = file.getName();
            // 取得文件的后缀名。
            String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
            // 以流的形式下载文件。
            InputStream fis = new BufferedInputStream(new FileInputStream(path));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            // 清空response
            response.reset();
            // 设置response的Header
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
            response.addHeader("Content-Length", "" + file.length());
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return response;
    }


    /**
     * 文件上传
     * @param request
     * @param response
     */
    @RequestMapping(value="upload")
    public void upload(HttpServletRequest request, HttpServletResponse response) {
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));//获得当前session中的用户
        if(user==null) return;//如果当前session中不存在用户
        //System.out.println("当前session"+user.getUsername());
        String savePath=(String) Configurer.getContextProperty("savePath");
        savePath = savePath+user.getId()+"/"; //设置当前用户的存储路径
        File f1 = new File(savePath);
        //如果文件夹不存在，创建文件夹
        if (!f1.exists())  f1.mkdirs();
        DiskFileItemFactory fac = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fac);
        upload.setHeaderEncoding("utf-8");
        List fileList = null;
        try {
            fileList = upload.parseRequest(request);
        } catch (FileUploadException ex) {
            ex.printStackTrace();
            return;
        }
        //获得当前传入的文件列表
        Iterator<FileItem> it = fileList.iterator();
        String name = "";
        String extName = "";
        //判断是否文件列表有下一个文件
        while (it.hasNext()) {
            FileItem item = it.next();
            if (!item.isFormField()) {
                name = item.getName();
                name=name.replace("&","").replace("?","");
//                System.out.println("sss"+item.getSize()+"bbb"+item.getSize()/(1024*1024));
                long size = item.getSize()/(1024*1024);//byte转换为mb
                if(size==0) size=size+1;//如果不足1MB的 默认为1MB大小
                String type = item.getContentType();
//                System.out.println(name+" "+size + " " + type);
                if (name == null || name.trim().equals("")) {
                    continue;
                }
                //扩展名格式：
                if (name.lastIndexOf(".") >= 0)  extName = name.substring(name.lastIndexOf(".")+1);
                File file = null;
                //插入上传列表
                FileBaseInfo bean=new FileBaseInfo(user.getId(),user.getUsername(), DateUtil.getStrOfDateTime(),name,String.valueOf(size),extName);
               name= fileBaseInfoService.checkSameFile(bean);
                do {
                    //本地文件不存在的时候，则创建本地文件
                    file = new File(savePath + name);
                } while (file.exists());
                File saveFile = new File(savePath + name);
                try {
                    item.write(saveFile);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        try {
            response.getWriter().print(name);
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
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