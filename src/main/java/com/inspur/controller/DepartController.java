package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Depart;
import com.inspur.service.DepartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("depart")
public class DepartController {
    @Autowired
    private DepartService departService;

    @PostMapping("save")
    public String save(Depart depart, HttpServletRequest request) {
        Depart updateDepart = (Depart) request.getAttribute("depart");
        System.out.println("session" + updateDepart);
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
