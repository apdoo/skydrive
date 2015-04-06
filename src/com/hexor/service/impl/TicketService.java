package com.hexor.service.impl;

import com.hexor.dao.ITicketMapper;
import com.hexor.repo.Pager;
import com.hexor.repo.TicketInfo;
import com.hexor.repo.TicketReplay;
import com.hexor.service.ITicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-3-30
 * Time: 下午11:25
 * To change this template use File | Settings | File Templates.
 */
@Service("com.hexor.service.impl.TicketService")
public class TicketService implements ITicketService {
    @Autowired
    @Qualifier("com.hexor.dao.ITicketMapper")
    private ITicketMapper mapper;
    public void setMapper(ITicketMapper delegate) {
        this.mapper = delegate;
    }
    @Override
    public void insertTicketInfo(TicketInfo ticketInfo) {
        mapper.insertTicketInfo(ticketInfo);
    }

    @Override
    public List<TicketInfo> getMyTickets(String userId) {
        return mapper.getMyTickets(userId);
    }

    @Override
    public List<TicketInfo> getAllTickets() {
        return mapper.getAllTickets();
    }

    @Override
    public long getTicketCounts() {
        return mapper.getTicketCounts();
    }

    @Override
    public List<TicketInfo> limit(Pager pager) {
        return mapper.limit(pager);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void updateStatus(Map map) {
        mapper.updateStatus(map);
    }

    @Override
    public int getUnTickets() {
        return mapper.getUnTickets();
    }

    @Override
    public List<TicketReplay> getTicketReplays(String ticketId) {
        return mapper.getTicketReplays(ticketId);
    }

    @Override
    public void insertTicketReplay(TicketReplay ticketReplay) {
        mapper.insertTicketReplay(ticketReplay);
    }
}
