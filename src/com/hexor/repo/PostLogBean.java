package com.hexor.repo;


import com.hexor.util.DateUtil;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-6-5
 * Time: 16:08
 * ������־��ʵ��
 * ������¼��������վ�����ӵļ�¼����ֹ�ظ�����
 */
public class PostLogBean {
    private int id;//id��
    private int collectLogsId;//���������Ӷ�Ӧ�Ĳɼ����ӵ�id
    private String postSite;//��������վ
    private String postUrl;//������Url��ַ(���)
    private String postTime= DateUtil.getStrOfDateTime();//������ʱ��

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCollectLogsId() {
        return collectLogsId;
    }

    public void setCollectLogsId(int collectLogsId) {
        this.collectLogsId = collectLogsId;
    }

    public String getPostSite() {
        return postSite;
    }

    public void setPostSite(String postSite) {
        this.postSite = postSite;
    }

    public String getPostUrl() {
        return postUrl;
    }

    public void setPostUrl(String postUrl) {
        this.postUrl = postUrl;
    }

    public String getPostTime() {
        return postTime;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }
}
