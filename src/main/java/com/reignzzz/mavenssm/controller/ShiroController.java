package com.reignzzz.mavenssm.controller;

import com.reignzzz.mavenssm.entity.User;
import com.reignzzz.mavenssm.service.UserService;
import com.reignzzz.mavenssm.utils.AESUtil;
import com.reignzzz.mavenssm.utils.UUIDUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.reignzzz.mavenssm.constant.constant.USER_STATUS_UNLOCK;

@Controller
@RequestMapping(value = "/shiros")
public class ShiroController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/get/login.do", method = RequestMethod.GET)
    public String login(Model model, HttpSession session) {
        String code = UUIDUtil.getUUID16Bits();
        model.addAttribute("uuidSalt", code);
        session.setAttribute("uuidSalt", code);
        System.out.println(code);


        return "login";
    }

    @RequestMapping(value = "/post/login.do", method = RequestMethod.POST)
    public String login(User user, HttpServletResponse response, HttpSession session) {
        try {
            Subject subject = SecurityUtils.getSubject();
            String key = (String) session.getAttribute("uuidSalt");
            String iv = (String) session.getAttribute("uuidSalt");
            String password = AESUtil.decrypt(user.getPassword(), key, iv);
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), password);
            subject.login(token);
        } catch (AuthenticationException e) {
            e.printStackTrace();
            return "loginError";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/shiros/index.do";
    }

    @RequestMapping(value = "/index.do")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/register.do")
    public String register(User user) {
        SimpleHash simpleHash = new SimpleHash("MD5", user.getPassword(), user.getUsername(), 1024);
        user.setPassword(simpleHash.toString());
        user.setStatus(USER_STATUS_UNLOCK);
        userService.addUser(user);
        return "forward:index.do";
    }

}
