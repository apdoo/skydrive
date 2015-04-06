package com.hexor.service.impl;

import com.hexor.dao.IMessagePriMapper;
import com.hexor.repo.MessagePri;
import com.hexor.repo.Pager;
import com.hexor.service.IMessagePriService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-3-18
 * Time: 下午1:35
 * To change this template use File | Settings | File Templates.
 */
@Service("com.hexor.service.impl.MessagePriService")
public class MessagePriService implements IMessagePriService {

    @Autowired
    @Qualifier("com.hexor.dao.IMessagePriMapper")
    private IMessagePriMapper mapper;

    public void setMapper(IMessagePriMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public int getCounts() {
        return mapper.getCounts();  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public int getMyMessagesCounts(String userId) {
        return mapper.getMyMessagesCounts(userId);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<MessagePri> getMyMessages(String userId) {
        return mapper.getMyMessages(userId);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void insertMessage(MessagePri messagePri) {
        mapper.insertMessage(messagePri);//To change body of implemented methods use File | Settings | File Templates.

    }

    @Override
    public List<MessagePri> getAllMyMessages(String userId) {
        return mapper.getAllMyMessages(userId);
    }

    @Override
    public void updateRead(String id) {
        mapper.updateRead(id);
    }

    @Override
    public List<MessagePri> limit(Pager pager) {
        return mapper.limit(pager);
    }

    @Override
    public long getMessageCounts() {
        return mapper.getMessageCounts();
    }

    @Override
    public void updateMessage(MessagePri messagePri) {
        mapper.updateMessage(messagePri);
    }

    @Override
    public void deleteMessage(List list) {
        mapper.deleteMessage(list);
    }
}
