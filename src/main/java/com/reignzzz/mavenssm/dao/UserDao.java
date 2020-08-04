package com.reignzzz.mavenssm.dao;

import com.reignzzz.mavenssm.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    User getUserByName(@Param("username") String username);

    void insertUser(User user);

    int updatePhotoURL(@Param("savePath")String savePath,@Param("username")String username);

    User selectById(@Param("id")Long id);
}
