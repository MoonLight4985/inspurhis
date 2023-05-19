package com.inspur.controller;

import com.inspur.entity.QueryExtends;
import com.inspur.service.QueryExtendsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class QueryExtendsController {
    @Autowired
    private QueryExtendsService queryExtendsService;
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
}
