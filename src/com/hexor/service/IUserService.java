package com.hexor.service;

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
public interface IUserService {
    public List<User> getAllUser();

    public User checkUser(String username);

    public void insertUser(User user);

    public List<User> limit(Pager pager);
    public long getUsersCount();
    public User checkLogin(User user);
    public void loginUpdate(User user);
    public User getUserByUsername(String id);
    public void updateUser(User user);
    public User getUserById(String id);
    public void updateTemp(String id);
    public void updateType(Map map);
}
