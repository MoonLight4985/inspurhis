package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Depart;
import com.inspur.entity.QueryExtends;
import com.inspur.entity.Users;
import com.inspur.service.DepartService;
import com.inspur.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("depart")
public class DepartController {
    @Autowired
    private DepartService departService;
    @Autowired
    private UsersService usersService;

    @PostMapping("save")
    public String save(Depart depart, HttpServletRequest request) {
        Depart updateDepart = (Depart) request.getAttribute("depart");
        QueryExtends users = (QueryExtends) request.getSession().getAttribute("users");
        depart.setUserId(users.getId());
        System.out.println(users.getId());
        if (updateDepart != null) {
            depart.setId(updateDepart.getId());
        }
        boolean flag = departService.saveOrUpdateDepart(depart);

        return "redirect:/depart/list";
    }

    @GetMapping("list")
    public String getDepartByCondition(Depart depart,
                                      HttpServletRequest request,
                                      @RequestParam(defaultValue = "1") Integer pageNum,
                                      @RequestParam(defaultValue = "5") Integer pageSize) {
        PageInfo<Depart> pageInfo = departService.getDepartByCondition(depart, pageNum, pageSize);
        List<Users> allUsers = usersService.getAllUsers();
        request.setAttribute("userList", allUsers);
        request.setAttribute("pageInfo", pageInfo);
        return "kslist";
    }
    @GetMapping("deleteByDepartId")
    public String deleteByDepartId(String id) {
        boolean flag = departService.deleteByDepartId(id);
        return "redirect:/depart/list";
    }

    @GetMapping("findDepartById")
    public String findDepartById(String id, HttpServletRequest request) {
        Depart depart = departService.findDepartById(id);
        request.setAttribute("depart", depart);
        System.out.println(depart);
        return "ksadd";
    }
}
