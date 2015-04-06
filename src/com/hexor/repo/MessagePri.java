package com.hexor.repo;

import com.hexor.util.DateUtil;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-2-27
 * Time: 下午3:50
 * To change this template use File | Settings | File Templates.
 * 私信
 */
public class MessagePri {
    private int id;// id号
    private int userId;//发给用户的id号
    private String userName;//发给用户的用户名
    private int fromId;//发送私信的id号
    private String fromName="管理员";//发送私信的用户名 默认都是管理员发送的
    private String messageTitle;//私信标题
    private String messageContent;//私信内容
    private String sendTime= DateUtil.getStrOfDateTime();//发送的时间
    private String flag="0";//私信状态 0未读 1已读 2删除

    public MessagePri() {
    }

    public MessagePri(int userId, String userName, String messageTitle, String messageContent) {
        this.userId = userId;
        this.userName = userName;
        this.messageTitle = messageTitle;
        this.messageContent = messageContent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
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

    public int getFromId() {
        return fromId;
    }

    public void setFromId(int fromId) {
        this.fromId = fromId;
    }

    public String getFromName() {
        return fromName;
    }

    public void setFromName(String fromName) {
        this.fromName = fromName;
    }

    public String getMessageTitle() {
        return messageTitle;
    }

    public void setMessageTitle(String messageTitle) {
        this.messageTitle = messageTitle;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }



    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
}
