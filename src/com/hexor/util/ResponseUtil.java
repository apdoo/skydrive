package com.hexor.util;

import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/** 
 * @author  hexd
 */
public class ResponseUtil {

	public static void outWriteJson(HttpServletResponse response,Map  map) throws IOException{
		response.setContentType("application/json");  
        response.setCharacterEncoding("utf-8");  
        //ƴװjson
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", map.get("msg"));
        jsonObject.put("count", map.get("count"));
        jsonObject.put("username", map.get("username"));  
        jsonObject.put("datetime", map.get("datetime"));  
        PrintWriter out = response.getWriter(); 
        out.write(jsonObject.toString());  
	}
	public static void outWriteJsonMessage(HttpServletResponse response,Map  map) throws IOException{
		response.setContentType("application/json");  
        response.setCharacterEncoding("utf-8");  
        //ƴװjson
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", map.get("msg"));
        PrintWriter out = response.getWriter();
//        System.out.println(jsonObject.toString());
        out.write(jsonObject.toString());  
		
	} 
	public static void outWriteJson(HttpServletResponse response,String json) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.write(json);
    }

    /**
     * 简单的快速返回成功的ajax响应
     * @param response
     */
    public static void outWriteJsonSuccess(HttpServletResponse response){
        JSONObject json = new JSONObject();
        json.put("success",true);
        try {
             outWriteJson(response,json.toString());
        } catch (IOException e) {
        }
    }

    /**
     * 简单的快速返回失败的ajax响应信息
     * @param response
     */
    public static void outWriteJsonFall(HttpServletResponse response,String msg){
        JSONObject json = new JSONObject();
        json.put("success",false);
        json.put("msg",msg) ;
        try {
            outWriteJson(response,json.toString());
        } catch (IOException e) {
        }
    }
	public static void outWriteErrorVcode() throws IOException{
		
		
	}
}
