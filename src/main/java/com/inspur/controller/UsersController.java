package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Users;
import com.inspur.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/users")// 窄化管理
public class UsersController {
    @Autowired
    private UsersService usersService;

    @PostMapping("save")
    public String save(Users user, HttpServletRequest request) {
        Users updateUser = (Users) request.getAttribute("user");
        if (updateUser != null) {
            user.setId(updateUser.getId());
        }
        boolean flag = usersService.saveOrUpdateUser(user);

        return "redirect:/users/list";
    }

    @GetMapping("list")
    public String getUsersByCondition(Users users,
                                      HttpServletRequest request,
                                      @RequestParam(defaultValue = "1") Integer pageNum,
                                      @RequestParam(defaultValue = "5") Integer pageSize) {
        PageInfo<Users> pageInfo = usersService.getUsersByCondition(users, pageNum, pageSize);
        request.setAttribute("pageInfo", pageInfo);
        return "adminlist";
    }
    @GetMapping("deleteByUserId")
    public String deleteByUserId(String id) {
        boolean flag = usersService.deleteByUserId(id);
        return "redirect:/users/list";
    }

    @GetMapping("findUserById")
    public String findUserById(String id, HttpServletRequest request) {
        Users user = usersService.findUserById(id);
        request.setAttribute("user", user);
        System.out.println(user);
        return "adminadd";
    }
}
