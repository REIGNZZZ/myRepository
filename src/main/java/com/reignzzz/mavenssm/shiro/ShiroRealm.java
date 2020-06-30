package com.reignzzz.mavenssm.shiro;

import com.reignzzz.mavenssm.dao.UserDao;
import com.reignzzz.mavenssm.entity.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * shiro已经为Realm接口封装了实现类，所以一般不会直接实现Realm，而是直接使用封装好的实现类
 */
public class ShiroRealm extends AuthenticatingRealm {

    @Autowired
    private UserDao userDao;

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = token.getUsername();
        User user = userDao.getUserByName(username);
        if(user == null){
            throw new UnknownAccountException("没有该用户");
        }
        if (user.getStatus() == 0) {
            throw new LockedAccountException("该用户已被锁定");
        }
        AuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), null, getName());
        return info;
    }
}
