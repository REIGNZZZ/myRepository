package com.reignzzz.mavenssm.shiro;

import com.reignzzz.mavenssm.dao.UserDao;
import com.reignzzz.mavenssm.entity.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * shiro已经为Realm接口封装了实现类，所以一般不会直接实现Realm，而是直接使用封装好的实现类
 */
public class ShiroRealm2 extends AuthenticatingRealm {

    @Autowired
    private UserDao userDao;

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("进入ShiroRealm2中进行验证");
        AuthenticationInfo info = new SimpleAuthenticationInfo("admin", "123456", null, getName());
        return info;
    }

}
