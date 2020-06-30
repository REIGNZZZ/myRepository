package com.reignzzz.mavenssm.controller;

import com.reignzzz.mavenssm.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "shiros")
public class ShiroController {

    @RequestMapping(value = "login.do",method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value = "login.do",method = RequestMethod.POST)
    public String login(User user){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),user.getPassword());
        try {
            subject.login(token);
        } catch (AuthenticationException e) {
            e.printStackTrace();
            return "loginError";
        }
        return "redirect:index.do";
    }

    @RequestMapping(value = "index.do")
    public String index(){
        return "index";
    }

}
