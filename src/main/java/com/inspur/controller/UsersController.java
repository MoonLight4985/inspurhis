package com.inspur.controller;

import com.inspur.entity.Users;
import com.inspur.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users")// 窄化管理
public class UsersController {
    @Autowired
    private UsersService usersService;

    @PostMapping("save")
    public void save(Users user) {
        boolean flag = usersService.addUser(user);
        if (flag) {
            System.out.println("OKKKKKK!");
        }
    }
}
