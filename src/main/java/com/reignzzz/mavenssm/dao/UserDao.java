package com.reignzzz.mavenssm.dao;

import com.reignzzz.mavenssm.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    User getUserByName(@Param("username") String username);
}
