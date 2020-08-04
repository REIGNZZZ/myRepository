package com.reignzzz.mavenssm.controller;

import com.reignzzz.mavenssm.constant.ZZZResult;
import com.reignzzz.mavenssm.entity.User;
import com.reignzzz.mavenssm.service.UserService;
import com.reignzzz.mavenssm.utils.FileDeleteUtil;
import com.reignzzz.mavenssm.utils.FileuploadUtil;
import com.reignzzz.mavenssm.utils.UUIDUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

import static com.reignzzz.mavenssm.constant.Constant.FAILED;
import static com.reignzzz.mavenssm.constant.Constant.SUCCESS;

@Controller
@RequestMapping(value = "/users")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/uploadPhoto.do")
    public String uploadPhoto(HttpServletRequest request,String abc, @RequestParam(value = "userphoto") MultipartFile multipartFile) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        user = userService.getById(user.getId());
        if (user.getPhotoURL()!=null && !user.getPhotoURL().equals("")) {
            String desPath = request.getSession().getServletContext().getRealPath("/");
            FileDeleteUtil.fileDelete(desPath,user.getPhotoURL());
        }
        ZZZResult result = new ZZZResult(SUCCESS);
        String desPath = request.getSession().getServletContext().getRealPath("/upload/userphoto");
        String desName = UUIDUtil.getUUID16Bits() + multipartFile.getOriginalFilename();
        MultipartFile[] m = new MultipartFile[1];
        m[0] = multipartFile;
        String diskPath = FileuploadUtil.fileupload(m, desPath, desName);
        String relativePath = diskPath.substring(diskPath.indexOf("upload"));
        int row = userService.updatePhotoURL(relativePath, user.getUsername());
        if (row != 1) {
            result.setMsg(FAILED);
        }
        return "redirect:/view/index.jsp";
    }

    @RequestMapping(value = "getCurrentUser.do")
    @ResponseBody
    public Object getCurrentUser() {
        ZZZResult result = new ZZZResult(SUCCESS);
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        user = userService.getById(user.getId());
        result.setData(user);
        return result;
    }
}
