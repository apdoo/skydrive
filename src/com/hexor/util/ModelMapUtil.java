package com.hexor.util;

import com.hexor.repo.FileBaseInfo;
import com.hexor.repo.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-9-3
 * Time: 下午3:14
 * To change this template use File | Settings | File Templates.
 */
public class ModelMapUtil {

    public static Map getMsg(String msg){
           Map map=new HashMap();
//           msg= EncodingTool.encodeStr(msg, "GB2312");
           map.put("msg",msg) ;
           return map;
    }
    public static Map getDownloadAnalysisMap(long uploads,long downloads,long mesaages,List<FileBaseInfo> list){
        Map map=new HashMap();
        map.put("uploads",uploads);
        map.put("downloads",downloads);
        map.put("mesaages",mesaages);
        map.put("hotfiles",list);
        return map;
    }
    public static Map getUserMap(User user){
        Map map=new HashMap();
        map.put("userinfo",user) ;
        return map;
    }

    /**
     * 获得map的通用方法
     * @param key
     * @param obj
     * @return
     */
    public static Map getMap(String key,Object obj){
        Map map=new HashMap();
        map.put(key,obj) ;
        return map;
    }
}
