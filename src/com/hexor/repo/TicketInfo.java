package com.hexor.repo;

import com.hexor.util.DateUtil;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-3-18
 * Time: 上午10:49
 * To change this template use File | Settings | File Templates.
 * 工单类
 */
public class TicketInfo {
    private int id;// 工单id号
    private int userId;//发送该工单的用户id
    private String userName;//发送该工单的用户名
    private String title;//该工单的标题
    private String content;//该工单的内容
    private String status="0";//工单状态 0 未处理 1处理 2退回
    private String createTime= DateUtil.getStrOfDateTime();//工单创建时间

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }


}
