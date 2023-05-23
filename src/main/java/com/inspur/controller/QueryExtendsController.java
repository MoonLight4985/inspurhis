package com.inspur.controller;

import com.inspur.entity.QueryExtends;
import com.inspur.service.DoctorService;
import com.inspur.service.MemberService;
import com.inspur.service.QueryExtendsService;
import com.inspur.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Controller
@RequestMapping("/")
public class QueryExtendsController {
    @Autowired
    private QueryExtendsService queryExtendsService;

    @Autowired
    private UsersService usersService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private DoctorService doctorService;

    //登录
    @RequestMapping("login")
    public String login(String name, String password, HttpSession session){
        QueryExtends queryExtends = queryExtendsService.login(name, password);
        if(queryExtends!=null){//登录成功跳转到后端页面
            session.setAttribute("users",queryExtends);
            return "index";
        }else {
            return "login";//登录失败跳转到登录面
        }

    }
    //注销
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("users");
        return "login";
    }

    @PostMapping("updatepwd")
    public String updatepwd(String password1, String password2, String password3, HttpServletRequest request) {
        QueryExtends users = (QueryExtends) request.getSession().getAttribute("users");
        String message = "";
        if (password2.equals(password3)) {
            if (password1.equals(users.getPassword())) {
                if (Objects.equals(users.getRole(), "1")) {
                    usersService.updatePassword(users.getId(), password3);
                } else if (Objects.equals(users.getRole(), "2")) {
                    doctorService.updatePassword(users.getId(), password3);
                } else {
                    memberService.updatePassword(users.getId(), password3);
                }
            } else {
                message = "原密码输入错误！";
                request.getSession().setAttribute("message", message);
                return "userpwdupdate";
            }
        } else {
            message = "两次输入的密码不一致！";
            request.getSession().setAttribute("message", message);
            return "userpwdupdate";
        }
        return "index";
    }
}
