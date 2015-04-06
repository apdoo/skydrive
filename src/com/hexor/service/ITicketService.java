package com.hexor.service;

import com.hexor.repo.Pager;
import com.hexor.repo.TicketInfo;
import com.hexor.repo.TicketReplay;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-3-30
 * Time: 下午11:25
 * To change this template use File | Settings | File Templates.
 */
public interface ITicketService{

    public void insertTicketInfo(TicketInfo ticketInfo);
    public List<TicketInfo> getMyTickets(String userId);
    public List<TicketInfo> getAllTickets();
    public long getTicketCounts();
    public List<TicketInfo> limit(Pager pager);
    public void updateStatus(Map map);
    public int getUnTickets();

    public List<TicketReplay> getTicketReplays(String ticketId);
    public void insertTicketReplay(TicketReplay ticketReplay);
}
