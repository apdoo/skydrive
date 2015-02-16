package com.hexor.dao;

import com.hexor.repo.DownloadLogs;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-8-27
 * Time: 下午2:49
 * To change this template use File | Settings | File Templates.
 */
@Service("com.hexor.dao.IDownloadLogsMapper")
public interface IDownloadLogsMapper {
    public List<DownloadLogs> getAll();
    public void insertDownloadLogs(DownloadLogs downloadLogs);
    public int getDownloadsByUserId(String  userId);
}
