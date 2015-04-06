package com.hexor.dao;

import com.hexor.repo.MessagePri;
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
@Service("com.hexor.dao.IMessagePriMapper")
public interface IMessagePriMapper {
    public int getCounts();
    public int getMyMessagesCounts(String userId);
    public List<MessagePri> getMyMessages(String userId);
    public List<MessagePri> getAllMyMessages(String userId);
    public void insertMessage(MessagePri messagePri);
    public void updateRead(String id);
    public List<MessagePri> limit(Pager pager);
    public long getMessageCounts();
    public void updateMessage(MessagePri messagePri);
    public void deleteMessage(List list);
}
