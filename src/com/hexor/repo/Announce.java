package com.hexor.repo;

import com.hexor.util.DateUtil;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-2-4
 * Time: 上午3:01
 * To change this template use File | Settings | File Templates.
 * 公告类
 */
public class Announce {
    private int id;// id号
    private int userId;//发布公告的作者id
    private String userName="";//发布公告的作者用户名
    private String title="";//公告标题
    private String content="";//公告内容
    private String type="common";//公告类型 置顶 紧急 等..
    private String updateTime;//公告发布时间

    public Announce() {
    }

    public Announce(int id, String title, String content, String type) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.type = type;
    }

    public Announce(String content, String title,Boolean isTop,User user) {
        this.content = content;
        if(isTop){
            this.type="top";
            this.title="置顶: "+title;
        }else{
            this.title=title;
        }
        this.userId=user.getId();
        this.userName=user.getUsername();
        this.updateTime= DateUtil.getStrOfDateTime();
    }

    @Override
    public String toString() {
        return "Announce{" +
                "id=" + id +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", type='" + type + '\'' +
                ", updateTime='" + updateTime + '\'' +
                '}';
    }

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}
