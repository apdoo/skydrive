package com.hexor.repo;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-1-24
 * Time: 下午12:17
 * To change this template use File | Settings | File Templates.
 * 下载日志表
 */
public class DownloadLogs {
    private int id;//id号
    private int userId;//上传该文件的用户id
    private int fileId;//文件id
    private String fileName;//文件名
    private String ip;//下载的ip地址
    private String downloadTime;//下载的时间

    public DownloadLogs(int userId, String fileName, String ip, String downloadTime) {
        this.userId = userId;
        this.fileName = fileName;
        this.ip = ip;
        this.downloadTime = downloadTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getDownloadTime() {
        return downloadTime;
    }

    public void setDownloadTime(String downloadTime) {
        this.downloadTime = downloadTime;
    }
}
