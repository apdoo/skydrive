package com.hexor.service;

import com.hexor.repo.Announce;
import com.hexor.repo.Pager;
import com.hexor.repo.User;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-8-27
 * Time: 下午3:06
 * To change this template use File | Settings | File Templates.
 */
public interface IAnnounceService {
    public List<Announce> selectRecentlyA(Map map) ;
    public void insertAnn(Announce announce);
    public int getCounts();
    public Announce getAnnById(String id);
}
