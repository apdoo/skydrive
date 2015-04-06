package com.hexor.dao;

import com.hexor.repo.Announce;
import com.hexor.repo.Pager;
import com.hexor.repo.TicketInfo;
import com.hexor.repo.TicketReplay;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-8-27
 * Time: 下午2:49
 * To change this template use File | Settings | File Templates.
 * 工单dao包含工单记录，工单回复
 */
@Service("com.hexor.dao.ITicketMapper")
public interface ITicketMapper {
    //--工单类
     public void insertTicketInfo(TicketInfo ticketInfo);
     public List<TicketInfo> getMyTickets(String userId);
     public List<TicketInfo> getAllTickets();
     public long getTicketCounts();
     public List<TicketInfo> limit(Pager pager);
     public void updateStatus(Map map);
     public int getUnTickets();
     //--工单回复类
     public List<TicketReplay> getTicketReplays(String ticketId);
     public void insertTicketReplay(TicketReplay ticketReplay);
}
