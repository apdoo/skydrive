package com.hexor.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-06-27
 * Time: 22:01
 * 发帖线程使用的一些参数
 *  name 该线程对应数据库中torrents表update+temp标志如：2014-10-27,bt亚洲无码转帖 对应本地存储的文件夹名字
 *  withFile 是否包含附件上传的标志
 *  index 首页登录页面用来获得登录表单formhash
 *  loginPostUrl 登录post接口地址
 *  postPage  发帖地址用来获得发帖表单的formhash
 *  uploadUrl 发帖接口地址
 *  type 发布类型
 */
public class PostParamConstant {
    //--新巴黎参数
    public static final String xinbali_name="新巴黎";
    public static final String xinbali_index_url="http://107.150.17.66/logging.php?action=login";
    public static final String xinbali_loginPost_url="http://107.150.17.66/logging.php?action=login&";
    public static final String xinbali_postPage_url="http://107.150.17.66/post.php?action=newthread&fid=&extra=page%3D1";//fid=需要替换如:fid=25 亚洲无码发帖
    public static final String xinbali_upload_url="http://107.150.17.66/post.php?action=newthread&fid=&extra=page%3D1&topicsubmit=yes";
    /**
     * 随机获得一个新巴黎的登录账号
     * @return
     */
    public static PostUser getXinBaLiUser(){
        List<PostUser> list=new ArrayList<PostUser>();
        list.add(new PostUser("liang93370894","asd123123"));
        Random random=new Random();
        return list.get(random.nextInt(list.size()));
    }
    //--mmhouse参数
    public static final String mmhouse_name="MM公寓";
    public static final String mmhouse_index_url="http://21mybbs.me/member.php?mod=logging&action=login&infloat=yes&handlekey=login&inajax=1&ajaxtarget=fwin_content_login";
    public static final String mmhouse_loginPost_url="http://21mybbs.me/member.php?mod=logging&action=login&loginsubmit=yes&handlekey=login&loginhash=LtnzP&inajax=1";
    public static final String mmhouse_postPage_url="http://21mybbs.me/forum.php?mod=post&action=newthread&fid=";
    public static final String mmhouse_upload_url="http://21mybbs.me/post.php?action=newthread&fid=25&extra=page%3D1&topicsubmit=yes";
    /**
     * 随机获得一mmhouse的登录账号
     * @return
     */
    public static PostUser getMMhouseUser(){
        List<PostUser> list=new ArrayList<PostUser>();
        list.add(new PostUser("一品梅136","asd123123"));
        Random random=new Random();
        return list.get(random.nextInt(list.size()));
    }
    //--御花王朝参数
    public static final String yhwc_name="御花王朝";
    public static final String yhwc_index_url="http://184.164.72.160/logging.php?action=login";
    public static final String yhwc_loginPost_url="http://184.164.72.160/logging.php?action=login&";
    public static final String yhwc_postPage_url="http://184.164.72.160/post.php?action=newthread&fid=&extra=page%3D1";
    public static final String yhwc_upload_url="http://184.164.72.160/post.php?action=newthread&fid=&extra=page%3D1&topicsubmit=yes";
    /**
     * 随机获得一御花王朝的登录账号
     * @return
     */
    public static PostUser getYhwcUser(){
        List<PostUser> list=new ArrayList<PostUser>();
        list.add(new PostUser("z1073021759","asd123123"));
        Random random=new Random();
        return list.get(random.nextInt(list.size()));
    }
}



