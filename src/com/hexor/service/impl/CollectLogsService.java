package com.hexor.service.impl;

import com.hexor.dao.ICollectLogsMapper;
import com.hexor.repo.CollectLogs;
import com.hexor.repo.Pager;
import com.hexor.service.ICollectLogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-6-7
 * Time: 14:08
 */
@Service("com.hexor.service.impl.CollectLogsService")
public class CollectLogsService implements ICollectLogsService{
    @Autowired
    @Qualifier("com.hexor.dao.ICollectLogsMapper")
    private ICollectLogsMapper mapper;
    public void setMapper(ICollectLogsMapper delegate) {
        this.mapper = delegate;
    }

    @Override
    public List<CollectLogs> limit(Pager pager) {
        return mapper.limit(pager);
    }

    @Override
    public List<CollectLogs> getAllCollectLogs() {
        return mapper.getAllCollectLogs();
    }

    @Override
    public long getCollectLogsCount() {
        return mapper.getCollectLogsCount();
    }

    @Override
    public List<CollectLogs> showCollectLogsByParam(Map map) {
        return mapper.showCollectLogsByParam(map);
    }
}
