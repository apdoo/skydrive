package com.hexor.service.impl;

import com.hexor.dao.IDownloadLogsMapper;
import com.hexor.repo.DownloadLogs;
import com.hexor.service.IDownloadLogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-2-10
 * Time: 下午2:43
 * To change this template use File | Settings | File Templates.
 */
@Service("com.hexor.service.impl.DownloadLogsService")
public class DownloadLogsService implements IDownloadLogsService{
    @Autowired
    @Qualifier("com.hexor.dao.IDownloadLogsMapper")
    private IDownloadLogsMapper mapper;
    public void setMapper(IDownloadLogsMapper delegate) {
        this.mapper = delegate;
    }
    @Override
    public List<DownloadLogs> getAll() {
        return  mapper.getAll();
    }


    @Override
    public void insertDownloadLogs(DownloadLogs downloadLogs) {
        mapper.insertDownloadLogs(downloadLogs);
    }

    @Override
    public int getDownloadsByUserId(String userId) {
        return mapper.getDownloadsByUserId(userId);
    }
}
