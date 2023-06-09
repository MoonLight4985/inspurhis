package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.*;
import com.inspur.service.CostSettleDetailService;
import com.inspur.service.DoctorService;
import com.inspur.service.MemberService;
import com.inspur.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("costSettleDetail")
public class CostSettleDetailController {
    @Autowired
    private CostSettleDetailService costSettleDetailService;
    @Autowired
    private MemberService memberService;

    @Autowired
    private UsersService usersService;

    @Autowired
    private DoctorService doctorService;

    @GetMapping("/list")
    public String getCostSettleDetailList(CostSettleDetail costSettleDetail,
                                          HttpServletRequest request,
                                          @RequestParam(defaultValue = "1") Integer pageNum,
                                          @RequestParam(defaultValue = "5") Integer pageSize) {
        costSettleDetail.setStatus("1");
        QueryExtends queryExtends = (QueryExtends) request.getSession().getAttribute("users");
        if (queryExtends.getRole().equals("3")) {
            costSettleDetail.setMemberId(queryExtends.getId());
        }
        PageInfo<CostSettleDetail> pageInfo = costSettleDetailService.getCostSettleDetailByCondition(costSettleDetail, pageNum, pageSize);
        List<Member> allMember = memberService.getAllMember();
        List<Users> allUsers = usersService.getAllUsers();
        List<Doctor> allDoctor = doctorService.getAllDoctor();
        request.getSession().setAttribute("doctorList", allDoctor);
        request.getSession().setAttribute("userList", allUsers);
        request.getSession().setAttribute("memberList", allMember);
        request.setAttribute("pageInfo", pageInfo);
        return "settleDlist";
    }

    @GetMapping("/listByMemberId")
    public String listByMemberId(CostSettleDetail costSettleDetail,
                                 HttpServletRequest request,
                                 @RequestParam(defaultValue = "1") Integer pageNum,
                                 @RequestParam(defaultValue = "5") Integer pageSize) {
        QueryExtends queryExtends = (QueryExtends) request.getSession().getAttribute("users");
        if (queryExtends.getRole().equals("3"))
            costSettleDetail.setMemberId(queryExtends.getId());
        costSettleDetail.setStatus("0");
        List<Member> allMember = memberService.getAllMember();
        List<Users> allUsers = usersService.getAllUsers();
        List<Doctor> allDoctor = doctorService.getAllDoctor();
        request.getSession().setAttribute("doctorList", allDoctor);
        request.getSession().setAttribute("userList", allUsers);
        request.getSession().setAttribute("memberList", allMember);
        PageInfo<CostSettleDetail> pageInfo = costSettleDetailService.getCostSettleDetailByCondition(costSettleDetail, pageNum, pageSize);
        request.setAttribute("pageInfo", pageInfo);
        return "settle";
    }
}
