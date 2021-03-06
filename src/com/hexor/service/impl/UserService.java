package com.hexor.service.impl;

import com.hexor.dao.IUserMapper;
import com.hexor.repo.Pager;
import com.hexor.repo.User;
import com.hexor.service.IUserService;
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
@Service("com.hexor.service.impl.UserService")
public class UserService implements IUserService {

    @Autowired
    @Qualifier("com.hexor.dao.IUserMapper")
    private IUserMapper mapper;
    public void setMapper(IUserMapper delegate) {
        this.mapper = delegate;
    }

    @Override
    public List<User> getAllUser() {
        return mapper.getAllUser();
    }

    @Override
    public User checkUser(String username) {
        return mapper.checkUser(username);
    }

    @Override
    public void insertUser(User user) {
       mapper.insertUser(user); //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<User> limit(Pager pager) {
        return mapper.limit(pager);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public long getUsersCount() {
        return mapper.getUsersCount();  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public User checkLogin(User user) {
        return mapper.checkLogin(user);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void loginUpdate(User user) {
       mapper.loginUpdate(user); //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public User getUserByUsername(String name) {
        return mapper.getUserByUsername(name);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void updateUser(User user) {
        mapper.updateUser(user);
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public User getUserById(String id) {
        return mapper.getUserById(id);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void updateTemp(String id) {
        mapper.updateTemp(id);
    }

    @Override
    public void updateType(Map map) {
        mapper.updateType(map);
    }
}
