package com.reignzzz.mavenssm.shiro;

import com.reignzzz.mavenssm.utils.AESUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;

/**
 * 自定义密码验证类
 */
public class CustomCredentialsMatcher extends SimpleCredentialsMatcher {

    @Override
    public boolean doCredentialsMatch(AuthenticationToken authenticationToken, AuthenticationInfo info) {

        try {
            Session session = SecurityUtils.getSubject().getSession();
            UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
            String username = token.getUsername();
            String password = new String(token.getPassword());
            String key = (String) session.getAttribute("uuidSalt");
            String iv = (String) session.getAttribute("uuidSalt");
            password = AESUtil.decrypt(password, key, iv);
            session.removeAttribute("uuidSalt");
            SimpleHash simpleHash = new SimpleHash("MD5", password, username, 1024);
            Object accountCredentials = this.getCredentials(info);
            return equals(simpleHash.toString(), accountCredentials.toString());
        } catch (Exception e) {
            throw new IncorrectCredentialsException("重放攻击行为");
        }
    }
}
