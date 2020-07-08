package com.reignzzz.mavenssm.shiro;

import com.reignzzz.mavenssm.dao.PermissionDao;
import com.reignzzz.mavenssm.dao.RoleDao;
import com.reignzzz.mavenssm.dao.UserDao;
import com.reignzzz.mavenssm.entity.Role;
import com.reignzzz.mavenssm.entity.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import sun.security.provider.MD5;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * shiro已经为Realm接口封装了实现类，所以一般不会直接实现Realm，而是直接使用封装好的实现类
 * AuthenticatingRealm 认证登录的实现类
 * AuthorizingRealm 认证角色与权限实现类
 * 实际开发中使用AuthorizingRealm，后者继承前者，所以后者更牛逼
 */
public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private PermissionDao permissionDao;

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("进入ShiroRealm中进行验证");
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = token.getUsername();
        User user = userDao.getUserByName(username);
        if(user == null){
            throw new UnknownAccountException("没有该用户");
        }
        if (user.getStatus() == 0) {
            throw new LockedAccountException("该用户已被锁定");
        }
        ByteSource salt = new ByteSource.Util().bytes(username);
        AuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), salt, getName());
        return info;
    }

    public static void main(String[] args) {
        SimpleHash simpleHash = new SimpleHash("MD5", "e10adc3949ba59abbe56e057f20f883e", "admin", 1024);
        System.out.println(simpleHash.toString());

        String str = "perms[userlist]";
        int b = str.indexOf("[")+1;
        int e = str.indexOf("]");
        str = str.substring(b, e);
        System.out.println(str);

    }

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("========执行权限验证==========");
        User user = principalCollection.oneByType(User.class);
//        这里需要一个String类型的集合
        Set<String> roles = roleDao.getRolesByUid(user.getId());
        List<Long> roleIds = roleDao.getRoleIdsByUid(user.getId());
        Set<String> permissions = permissionDao.getCodesByRoleIds(roleIds);
        Set<String> handlePermissions = new HashSet<String>();
        for (String code:permissions
             ) {
            if (code.contains("[")) {
                int b = code.indexOf("[") + 1;
                int e = code.indexOf("]");
                code = code.substring(b, e);
                handlePermissions.add(code);
            } else {
                handlePermissions.add(code);
            }
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(roles);
        info.addStringPermissions(handlePermissions);

        return info;
    }


}
