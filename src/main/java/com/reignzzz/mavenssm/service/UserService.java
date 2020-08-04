package com.reignzzz.mavenssm.service;

import com.reignzzz.mavenssm.entity.User;

public interface UserService {
    void addUser(User user);

    int updatePhotoURL(String savePath,String username);

    User getById(Long id);
}
