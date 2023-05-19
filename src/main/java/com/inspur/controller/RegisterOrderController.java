package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.RegisterOrder;
import com.inspur.service.RegisterOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("registerorder")
public class RegisterOrderController {
    @Autowired
    private RegisterOrderService registerOrderService;

    @PostMapping("save")
    public String save(RegisterOrder registerOrder, HttpServletRequest request) {
        RegisterOrder updateRegisterOrder = (RegisterOrder) request.getAttribute("order");
        if (updateRegisterOrder != null) {
            registerOrder.setId(updateRegisterOrder.getId());
        }
        boolean flag = registerOrderService.saveOrUpdateOrder(registerOrder);

        return "redirect:/order/list";
    }

    @GetMapping("list")
    public String getOrderByCondition(RegisterOrder registerOrder,
                                      HttpServletRequest request,
                                      @RequestParam(defaultValue = "1") Integer pageNum,
                                      @RequestParam(defaultValue = "5") Integer pageSize) {
        System.out.println(registerOrder);
        PageInfo<RegisterOrder> pageInfo = registerOrderService.getOrderByCondition(registerOrder, pageNum, pageSize);
        System.out.println(pageInfo);
        request.setAttribute("pageInfo", pageInfo);
        return "ghlist";
    }
    @GetMapping("deleteByOrderId")
    public String deleteByOrderId(String id) {
        boolean flag = registerOrderService.deleteByOrderId(id);
        return "redirect:/order/list";
    }

    @GetMapping("findOrderById")
    public String findOrderById(String id, HttpServletRequest request) {
        RegisterOrder registerOrder = registerOrderService.findOrderById(id);
        request.setAttribute("order", registerOrder);
        System.out.println("save" + registerOrder);
        return "ghadd";
    }
}
