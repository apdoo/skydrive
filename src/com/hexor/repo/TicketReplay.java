package com.hexor.repo;

import com.hexor.util.DateUtil;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-3-29
 * Time: 上午8:48
 * To change this template use File | Settings | File Templates.
 * 工单回复记录
 */
public class TicketReplay {
    private int id;// id号
    private int ticketId;//该工单对应的工单号
    private int userId;//创建该工单的用户id
    private String userName;//创建该工单的用户名
    private int relayUserId;//回复该工单的用户id
    private String replayUserName;//回复该工单的用户名
    private String title;//回复标题
    private String content;//回复内容
    private String replayTime= DateUtil.getStrOfDateTime();//回复时间

    public TicketReplay() {
    }

    public TicketReplay(int ticketId, int userId, String userName, int relayUserId, String replayUserName, String content) {
        this.ticketId = ticketId;
        this.userId = userId;
        this.userName = userName;
        this.relayUserId = relayUserId;
        this.replayUserName = replayUserName;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
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

    public int getRelayUserId() {
        return relayUserId;
    }

    public void setRelayUserId(int relayUserId) {
        this.relayUserId = relayUserId;
    }

    public String getReplayUserName() {
        return replayUserName;
    }

    public void setReplayUserName(String replayUserName) {
        this.replayUserName = replayUserName;
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

    public String getReplayTime() {
        return replayTime;
    }

    public void setReplayTime(String replayTime) {
        this.replayTime = replayTime;
    }
}
