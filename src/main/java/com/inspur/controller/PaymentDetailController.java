package com.inspur.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.Member;
import com.inspur.entity.PaymentDetail;
import com.inspur.entity.QueryExtends;
import com.inspur.entity.Users;
import com.inspur.service.MemberService;
import com.inspur.service.PaymentDetailService;
import com.inspur.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("payment")
public class PaymentDetailController {
    @Autowired
    private PaymentDetailService paymentDetailService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private UsersService usersService;

    @GetMapping("/list")
    public String getpaymentDetailList(PaymentDetail paymentDetail, HttpServletRequest request,
                                       @RequestParam(defaultValue = "1") Integer pageNum,
                                       @RequestParam(defaultValue = "5") Integer pageSize) {
        QueryExtends queryExtends = (QueryExtends) request.getSession().getAttribute("users");
        if (!queryExtends.getRole().equals("1")) {
            paymentDetail.setMemberId(queryExtends.getId());
        }
        PageInfo<PaymentDetail> paymentDetails = paymentDetailService.getPaymentDetailListByCondition(paymentDetail, pageNum, pageSize);
        List<Member> allMember = memberService.getAllMember();
        List<Users> allUsers = usersService.getAllUsers();
        request.getSession().setAttribute("userList", allUsers);
        request.getSession().setAttribute("memberList", allMember);
        request.setAttribute("pageInfo", paymentDetails);
        return "payDlist";
    }
}
