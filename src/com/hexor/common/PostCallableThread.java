package com.hexor.common;

import com.hexor.dao.ICollectLogsMapper;
import com.hexor.repo.CollectLogs;
import com.hexor.util.ContextUtil;
import com.hexor.util.CrawlerUtil;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.SocketException;
import java.nio.charset.Charset;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-06-27
 * Time: 21:15
 * 可以返回执行结果的子线程
 *
 *!!!!!!!!!注意啊 发送附件必须要使用   CloseableHttpClient httpclient = HttpClients.createDefault();
 * 创建的httpclient 才能够发！！！！！！！！！！！！1
 *
 */
public class PostCallableThread implements Callable<String> {
    //编码方式
    private static String GBK="GBK";
    private static String UTF8="UTF-8";
    //服务器上种子的路径前缀
//    private static  String path="/home/1/";
    private static  String path="E:\\uploads\\1\\";
    //使用的用户名与密码
    private String username="";
    private String password="";
    private List list;
    //采集的站点与版块
    private String webSite="";
    private String section="";
    //是否上传附件
    private Boolean bischecked=true;
    private CloseableHttpClient httpclient = HttpClients.createDefault();

    private static CrawlerUtil crawlerUtil=new CrawlerUtil();



    public PostCallableThread() {
    }

    public PostCallableThread(List list,String webSite, String section,Boolean bischecked,String username, String password) {
        this.list=list;
        this.username = username;
        this.password = password;
        this.webSite = webSite;
        this.section = section;
        this.bischecked=bischecked;
    }

    @Override
    public String call() throws Exception {

     return  start();
    }

    /**
     * 线程开始方法
     * @return
     */
    public String start() throws IOException, NoSuchAlgorithmException, CloneNotSupportedException, KeyManagementException {
        if(webSite.equals(PostParamConstant.xinbali_name)){//新巴黎登录
            if(xinbali_login()){//登录成功
              return xinbali_post(bischecked); //调用新巴黎发帖
            }else{//登录失败
                return username+"登录"+PostParamConstant.xinbali_name+"失败";
            }
        }else if(webSite.equals(PostParamConstant.mmhouse_name)){//mm公寓登录
//           if(mmhouse_login()){
//               return mmhouse_post();//调用mmhouse发帖
//           }else {
//               return username+"登录"+PostParamConstant.xinbali_name+"失败";
//           }
            return "MM公寓发帖暂时不可用！";
        }else if(webSite.equals(PostParamConstant.yhwc_name)){//御花王朝登录
            if(yhwc_login()){
                return yhwc_post(bischecked);
            }else {
                return username+"登录"+PostParamConstant.yhwc_name+"失败";
            }
        }
        return "没有该网站信息"+webSite;
    }


    /**
     * 御花王朝发帖
     * @param bischecked
     * @return
     * @throws IOException
     * @throws CloneNotSupportedException
     */

    public String yhwc_post(Boolean bischecked)throws IOException, CloneNotSupportedException {
        String []fid=section.split("\\|");
        String postPageUrl=PostParamConstant.yhwc_postPage_url.replace("fid=", "fid=" + fid[0]);
        String postUrl=PostParamConstant.yhwc_upload_url.replace("fid=","fid="+fid[0]);
        HttpPost post = new HttpPost(postUrl);
        for(int i=0;i<list.size();i++){
            CollectLogs bean= (CollectLogs)list.get(i);
            MultipartEntityBuilder builder = MultipartEntityBuilder.create();
            builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);//设置为浏览器兼容模式
            builder.setCharset(Charset.forName(GBK));// 设置请求的编码格式
            builder.addTextBody("formhash", getFormhash(postPageUrl,"formhash"), ContentType.TEXT_PLAIN);//设置formhash，从发表帖子页面读取formhash参数填充
            builder.addTextBody("isblog", "", ContentType.TEXT_PLAIN);
            builder.addTextBody("frombbs", "1", ContentType.TEXT_PLAIN);
            String subjectStr=bean.getName();
            StringBody subject=new StringBody(subjectStr,ContentType.create("text/plain",GBK));
            //内容
            String msg=bean.getContent()+"[url="+bean.getDownloadUrl()+"]网盘下载地址:"+bean.getDownloadUrl()+"[/url]\n";
            String []imgurls=bean.getImgUrls().split(",");
            for(int j=0;j<imgurls.length;j++){
                msg=msg+"[img]"+imgurls[j]+"[/img]";
            }
            StringBody   message=new StringBody(msg,ContentType.create("text/plain", GBK));
            //typeid需要根据具体的读取
            builder.addTextBody("posteditor_mediatyperadio", "on", ContentType.TEXT_PLAIN);//主题类型
            builder.addTextBody("selecttypeid", "33", ContentType.TEXT_PLAIN); //选择的主题类型
            builder.addPart("subject", subject);//帖子标题
            builder.addPart("message", message); //帖子内容
            if(bischecked) {
                File file = new File(path+bean.getName());
                builder.addBinaryBody("attach[]", file, ContentType.APPLICATION_OCTET_STREAM, path + bean.getName());
            }
            builder.addTextBody("localid[]", "1", ContentType.TEXT_PLAIN);
            builder.addTextBody("attachperm[]", "0", ContentType.TEXT_PLAIN);
            builder.addTextBody("attachprice[]", "0", ContentType.TEXT_PLAIN);
            builder.addTextBody("attachdesc[]", "", ContentType.TEXT_PLAIN);
            builder.addTextBody("iconid", "0", ContentType.TEXT_PLAIN);//图标id
            builder.addTextBody("wysiwyg", "0", ContentType.TEXT_PLAIN);//
            HttpEntity entity = builder.build();
            post.setEntity(entity);
            try {
                HttpResponse response=httpclient.execute(post);
                Document doc=crawlerUtil.getDocGBK(response);
                if(doc!=null){
                    System.out.println(doc.toString());
                }
            } catch (IOException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
        }

        return "发布完成！";
    }
    /**
     * 新巴黎发帖
     * @param bischecked 是否发布附件
     * @return
     */
    public String xinbali_post(Boolean bischecked) throws IOException, CloneNotSupportedException {
        String []fid=section.split("\\|");
        String postPageUrl=PostParamConstant.xinbali_postPage_url.replace("fid=", "fid=" + fid[0]);
        String postUrl=PostParamConstant.xinbali_upload_url.replace("fid=","fid="+fid[0]);
        HttpPost post = new HttpPost(postUrl);
        for(int i=0;i<list.size();i++){
            CollectLogs bean= (CollectLogs)list.get(i);
            MultipartEntityBuilder builder = MultipartEntityBuilder.create();
            builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);//设置为浏览器兼容模式
            builder.setCharset(Charset.forName(GBK));// 设置请求的编码格式
            builder.addTextBody("formhash", getFormhash(postPageUrl,"formhash"), ContentType.TEXT_PLAIN);//设置formhash，从发表帖子页面读取formhash参数填充
            builder.addTextBody("isblog", "", ContentType.TEXT_PLAIN);
            builder.addTextBody("frombbs", "1", ContentType.TEXT_PLAIN);
            String subjectStr=bean.getName();
            StringBody subject=new StringBody(subjectStr,ContentType.create("text/plain",GBK));
            //内容
            String msg=bean.getContent()+"[url="+bean.getDownloadUrl()+"]网盘下载地址:"+bean.getDownloadUrl()+"[/url]\n";
            String []imgurls=bean.getImgUrls().split(",");
            for(int j=0;j<imgurls.length;j++){
                msg=msg+"[img]"+imgurls[j]+"[/img]";
            }
            StringBody   message=new StringBody(msg,ContentType.create("text/plain", GBK));
            //typeid需要根据具体的读取
            builder.addTextBody("typeid", "33", ContentType.TEXT_PLAIN);//主题类型
            builder.addTextBody("selecttypeid", "33", ContentType.TEXT_PLAIN); //选择的主题类型
            builder.addPart("subject", subject);//帖子标题
            builder.addPart("message", message); //帖子内容
            if(bischecked) {
                File file = new File(path+bean.getName());
                builder.addBinaryBody("attach[]", file, ContentType.APPLICATION_OCTET_STREAM, path + bean.getName());
            }
            builder.addTextBody("localid[]", "1", ContentType.TEXT_PLAIN);
            builder.addTextBody("attachperm[]", "0", ContentType.TEXT_PLAIN);
            builder.addTextBody("attachprice[]", "0", ContentType.TEXT_PLAIN);
            builder.addTextBody("attachdesc[]", "", ContentType.TEXT_PLAIN);
            builder.addTextBody("readperm", "0", ContentType.TEXT_PLAIN);
            builder.addTextBody("price", "0", ContentType.TEXT_PLAIN);//单价
            builder.addTextBody("iconid", "0", ContentType.TEXT_PLAIN);//图标id
            builder.addTextBody("wysiwyg", "0", ContentType.TEXT_PLAIN);//
            HttpEntity entity = builder.build();
            post.setEntity(entity);
            try {
                HttpResponse response=httpclient.execute(post);
                Document doc=crawlerUtil.getDocGBK(response);
                if(doc!=null){
                    System.out.println(doc.toString());
                }
            } catch (IOException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
        }

        return "发布完成！";
    }

    /**
     * mmhouse发帖方法
     * @return
     */
    public String mmhouse_post(){
        return ""+list.size();
    }
    /**
     * 新巴黎登录方法
     * 验证formhash
     * @return
     */
    public Boolean xinbali_login() throws NoSuchAlgorithmException, KeyManagementException, IOException, CloneNotSupportedException {
        // 创建httppost
        HttpPost httppost = new HttpPost(PostParamConstant.xinbali_loginPost_url);
        // 创建参数队列
        List<NameValuePair> list = new ArrayList<NameValuePair>();
        //--新巴黎参数
        list.add(new BasicNameValuePair("formhash", getFormhash(PostParamConstant.xinbali_index_url,"formhash")));
        list.add(new BasicNameValuePair("cookietime", "2592000"));
        list.add(new BasicNameValuePair("referer", "http://107.150.17.66"));
        list.add(new BasicNameValuePair("loginfield", "username"));
        list.add(new BasicNameValuePair("questionid", "0"));
        list.add(new BasicNameValuePair("answer", ""));
        list.add(new BasicNameValuePair("loginmode", ""));
        list.add(new BasicNameValuePair("styleid", ""));
        list.add(new BasicNameValuePair("loginsubmit", "true"));
        list.add(new BasicNameValuePair("username", username));
        list.add(new BasicNameValuePair("password", password));
        UrlEncodedFormEntity uefEntity;
        uefEntity = new UrlEncodedFormEntity(list, GBK);
        httppost.setEntity(uefEntity);
        System.out.println("executing request " + httppost.getURI());
        CloseableHttpResponse response = httpclient.execute(httppost);
        Document document = crawlerUtil.getDocGBK(response);
//        System.out.println(document.toString());
        if(document.toString().contains(username)){
            return true;//登录成功
        }
        return false;//登录成功
    }

    /**
     * mm公寓登录方法
     * 不验证formhash
     * @return
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     * @throws IOException
     * @throws CloneNotSupportedException
     */
    public Boolean mmhouse_login() throws NoSuchAlgorithmException, KeyManagementException, IOException, CloneNotSupportedException {
        // 创建httppost
        HttpPost httppost = new HttpPost(PostParamConstant.mmhouse_loginPost_url);
        // 创建参数队列
        List<NameValuePair> list = new ArrayList<NameValuePair>();
        //--mm公寓的参数
        list.add(new BasicNameValuePair("fastloginfield", "username"));
        list.add(new BasicNameValuePair("quickforward", "yes"));
        list.add(new BasicNameValuePair("cookietime", "2592000"));
        list.add(new BasicNameValuePair("handlekey", "1s"));
        list.add(new BasicNameValuePair("username", username));
        list.add(new BasicNameValuePair("password", password));
        UrlEncodedFormEntity uefEntity;
        uefEntity = new UrlEncodedFormEntity(list, GBK);
        httppost.setEntity(uefEntity);
        System.out.println("executing request " + httppost.getURI());
        CloseableHttpResponse response = httpclient.execute(httppost);
        Document document = crawlerUtil.getDocGBK(response);
//        System.out.println(document.toString());
        if(document.toString().contains(username)){
            return true;//登录成功
        }
        return false;//登录成功
    }

    /**
     * 御花王朝登录方法
     * 验证formhash与refer
     * @return
     */
    public Boolean yhwc_login() throws NoSuchAlgorithmException, KeyManagementException, IOException, CloneNotSupportedException {
        // 创建httppost
        HttpPost httppost = new HttpPost(PostParamConstant.yhwc_loginPost_url);
        // 创建参数队列
        List<NameValuePair> list = new ArrayList<NameValuePair>();
        //--mm公寓的参数
        list.add(new BasicNameValuePair("formhash", getFormhash(PostParamConstant.yhwc_index_url,"formhash")));
        list.add(new BasicNameValuePair("referer", "index.php"));
        list.add(new BasicNameValuePair("loginfield", "username"));
        list.add(new BasicNameValuePair("questionid", "0"));
        list.add(new BasicNameValuePair("answer", ""));
        list.add(new BasicNameValuePair("cookietime", "2592000"));
        list.add(new BasicNameValuePair("loginmode", ""));
        list.add(new BasicNameValuePair("styleid", ""));
        list.add(new BasicNameValuePair("loginsubmit", "true"));
        list.add(new BasicNameValuePair("username", username));
        list.add(new BasicNameValuePair("password", password));
        UrlEncodedFormEntity uefEntity;
        uefEntity = new UrlEncodedFormEntity(list, GBK);
        httppost.setEntity(uefEntity);
        System.out.println("executing request " + httppost.getURI());
        CloseableHttpResponse response = httpclient.execute(httppost);
        Document document = crawlerUtil.getDocGBK(response);
//        System.out.println(document.toString());
        if(document.toString().contains(username)){
            return true;//登录成功
        }
        return false;//登录成功
    }

    /**
     * 获得当前发表新帖页面的formhash 放入参数中
     * @param url
     * @param keyname 要获得的隐藏参数
     * @throws IOException
     */
    public  String  getFormhash(String url,String keyname) throws IOException, CloneNotSupportedException {
        HttpGet get=new HttpGet(url);
        CloseableHttpResponse response = null;
        try {
            response = httpclient.execute(get);
        } catch (IOException e) {
            return "";
        }
        HttpEntity entity = response.getEntity();
        if (entity != null) {
            Document doc=crawlerUtil.getDocument(entity,GBK);
            Elements elements=doc.select("form[method=post]").select("input[name="+keyname+"]");
            String formhash=elements.toString();
//            System.out.println("fff"+formhash);
            if(formhash.length()>10){
                formhash=formhash.substring(formhash.indexOf("value=\"")+7,formhash.indexOf("\" />"));
//                System.out.println("keyname.."+keyname+":"+formhash);
            }
            return formhash;
        }
        return "";
    }


}
