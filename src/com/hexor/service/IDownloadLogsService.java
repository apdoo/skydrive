package com.hexor.service;

import com.hexor.repo.DownloadLogs;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-2-10
 * Time: 下午2:42
 * To change this template use File | Settings | File Templates.
 */
public interface IDownloadLogsService {
    public List<DownloadLogs> getAll();
    public void insertDownloadLogs(DownloadLogs downloadLogs);
    public int getDownloadsByUserId(String  userId);
}
