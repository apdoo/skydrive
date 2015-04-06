package com.hexor.service.impl;

import com.hexor.dao.IAnnounceMapper;
import com.hexor.repo.Announce;
import com.hexor.repo.Pager;
import com.hexor.service.IAnnounceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-8-27
 * Time: 下午4:08
 * To change this template use File | Settings | File Templates.
 */
@Service("com.hexor.service.impl.AnnounceService")
public class AnnounceService implements IAnnounceService {

    @Autowired
    @Qualifier("com.hexor.dao.IAnnounceMapper")
    private IAnnounceMapper mapper;
    public void setMapper(IAnnounceMapper delegate) {
        this.mapper = delegate;
    }


    @Override
    public List<Announce> selectRecentlyA(Map map) {
        return mapper.selectRecentlyA(map);
    }

    @Override
    public void insertAnn(Announce announce) {
        mapper.insertAnn(announce);
    }

    @Override
    public int getCounts() {
        return mapper.getCounts();
    }

    @Override
    public Announce getAnnById(String id) {
        return mapper.getAnnById(id);
    }

    @Override
    public List<Announce> limit(Pager pager) {
        return mapper.limit(pager);
    }

    @Override
    public void updateAnnounce(Announce announce) {
        mapper.updateAnnounce(announce);
    }

    @Override
    public void deleteAnnounce(List list) {
        mapper.deleteAnnounce(list);
    }
}
