package com.reignzzz.mavenssm.service.impl;

import com.reignzzz.mavenssm.dao.UserDao;
import com.reignzzz.mavenssm.entity.User;
import com.reignzzz.mavenssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public void addUser(User user) {
        userDao.insertUser(user);
    }
}
