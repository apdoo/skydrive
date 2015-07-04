package com.hexor.service;

import com.hexor.repo.CollectLogs;
import com.hexor.repo.Pager;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-6-7
 * Time: 14:07
 *
 */
public interface ICollectLogsService {
    public List<CollectLogs> limit(Pager pager);
    public List<CollectLogs>  getAllCollectLogs();
    public long getCollectLogsCount();
    public List<CollectLogs> showCollectLogsByParam(Map map);
    public List<CollectLogs> selectInIds(List list);
}
