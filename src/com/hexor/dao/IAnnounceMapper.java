package com.hexor.dao;

import com.hexor.repo.Announce;
import com.hexor.repo.Pager;
import com.hexor.repo.User;
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
@Service("com.hexor.dao.IAnnounceMapper")
public interface IAnnounceMapper {
    public List<Announce> selectRecentlyA(Map map) ;
    public void insertAnn(Announce announce);
    public int getCounts();
    public Announce getAnnById(String id);
    public List<Announce> limit(Pager pager);
    public void updateAnnounce(Announce announce);
    public void deleteAnnounce(List list);
}
