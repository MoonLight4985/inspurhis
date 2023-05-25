package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.*;
import com.inspur.service.DepartService;
import com.inspur.service.DoctorService;
import com.inspur.service.MemberService;
import com.inspur.service.RegisterOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("registerorder")
public class RegisterOrderController {
    @Autowired
    private RegisterOrderService registerOrderService;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private DepartService departService;

    @Autowired
    private MemberService memberService;

    @PostMapping("save")
    public String save(RegisterOrder registerOrder, HttpServletRequest request) {
        RegisterOrder updateRegisterOrder = (RegisterOrder) request.getAttribute("order");
        if (updateRegisterOrder != null) {
            registerOrder.setId(updateRegisterOrder.getId());
        }
        boolean flag = registerOrderService.saveOrUpdateOrder(registerOrder);

        return "redirect:/registerorder/list";
    }

    @GetMapping("list")
    public String getOrderByCondition(RegisterOrder registerOrder,
                                      HttpServletRequest request,
                                      @RequestParam(defaultValue = "1") Integer pageNum,
                                      @RequestParam(defaultValue = "5") Integer pageSize) {
        System.out.println(registerOrder);
        QueryExtends users = (QueryExtends) request.getSession().getAttribute("users");
        if (users.getRole().equals("3")) {
            registerOrder.setMemberId(users.getId());
        }
        PageInfo<RegisterOrder> pageInfo = registerOrderService.getOrderByCondition(registerOrder, pageNum, pageSize);
        List<Member> allMember = memberService.getAllMember();
        List<Depart> allDepart = departService.getAllDepart();
        List<Doctor> allDoctor = doctorService.getAllDoctor();
        request.setAttribute("memberList", allMember);
        request.setAttribute("departList", allDepart);
        request.setAttribute("doctorList", allDoctor);
        request.setAttribute("pageInfo", pageInfo);
        return "ghlist";
    }
    @GetMapping("deleteByOrderId")
    public String deleteByOrderId(String id) {
        boolean flag = registerOrderService.deleteByOrderId(id);
        return "redirect:/registerorder/list";
    }

    @GetMapping("findOrderById")
    public String findOrderById(String id, HttpServletRequest request) {
        RegisterOrder registerOrder = registerOrderService.findOrderById(id);
        request.setAttribute("order", registerOrder);
        System.out.println("save" + registerOrder);
        return "ghadd";
    }

    @GetMapping("toAddOrder")
    public String toAddOrder(HttpServletRequest request) {
        List<Member> allMember = memberService.getAllMember();
        List<Depart> allDepart = departService.getAllDepart();
        List<Doctor> allDoctor = doctorService.getAllDoctor();
        request.setAttribute("memberList", allMember);
        request.setAttribute("departList", allDepart);
        request.setAttribute("doctorList", allDoctor);
        return "ghadd";
    }
}
