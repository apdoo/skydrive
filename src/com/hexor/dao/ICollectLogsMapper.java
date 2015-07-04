package com.hexor.dao;

import com.hexor.repo.CollectLogs;
import com.hexor.repo.Pager;
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
@Service("com.hexor.dao.ICollectLogsMapper")
public interface ICollectLogsMapper {

    public List<CollectLogs> limit(Pager pager);
    public List<CollectLogs>  getAllCollectLogs();
    public long getCollectLogsCount();
    public List<CollectLogs> showCollectLogsByParam(Map map);
    public List<CollectLogs> selectInIds(List list);


}
