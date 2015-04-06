package com.hexor.service;

import com.hexor.repo.MessagePri;
import com.hexor.repo.Pager;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-3-18
 * Time: 下午1:35
 * To change this template use File | Settings | File Templates.
 */
public interface IMessagePriService {
    public int getCounts();
    public int getMyMessagesCounts(String userId);
    public List<MessagePri> getMyMessages(String userId);
    public void insertMessage(MessagePri messagePri);
    public List<MessagePri> getAllMyMessages(String userId);
    public void updateRead(String id);
    public List<MessagePri> limit(Pager pager);
    public long getMessageCounts();
    public void updateMessage(MessagePri messagePri);
    public void deleteMessage(List list);
}
