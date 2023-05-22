package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.CostSettleDetail;
import com.inspur.entity.Member;
import com.inspur.entity.PaymentDetail;
import com.inspur.entity.QueryExtends;
import com.inspur.service.CostSettleDetailService;
import com.inspur.service.MemberService;
import com.inspur.service.PaymentDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @Autowired
    private CostSettleDetailService costSettleDetailService;

    @Autowired
    private PaymentDetailService paymentDetailService;

    @PostMapping("save")
    public String save(Member member, HttpServletRequest request) {
        Member updateMember = (Member) request.getAttribute("member");
        System.out.println("cang" + member);
        if (updateMember != null) {
            member.setId(updateMember.getId());
        }
        boolean flag = memberService.saveOrUpdateMember(member);

        return "redirect:/member/list";
    }

    @GetMapping("list")
    public String getMemberByCondition(Member member,
                                       HttpServletRequest request,
                                       @RequestParam(defaultValue = "1") Integer pageNum,
                                       @RequestParam(defaultValue = "5") Integer pageSize) {
        PageInfo<Member> pageInfo = memberService.getMemberByCondition(member, pageNum, pageSize);
        request.setAttribute("pageInfo", pageInfo);
        return "memberlist";
    }
    @GetMapping("deleteByMemberId")
    public String deleteByMemberId(String id) {
        boolean flag = memberService.deleteByMemberId(id);
        return "redirect:/member/list";
    }

    @GetMapping("findMemberById")
    public String findMemberById(String id, HttpServletRequest request) {
        Member member = memberService.findMemberById(id);
        request.setAttribute("member", member);
        return "membermodify";
    }

    @GetMapping("increase")
    public String increase(String id, HttpServletRequest request) {
        Member member = memberService.findMemberById(id);
        request.getSession().setAttribute("czMember", member);
        return "membercz";
    }

    @PostMapping("saveIncrease")
    public String saveIncrease(Integer money, HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute("czMember");
        member.setBalance(member.getBalance() + money);
        System.out.println(member);
        boolean b = memberService.saveOrUpdateMember(member);
        return "redirect:/member/list";
    }

    @GetMapping("payById")
    public String payById(Integer money, String costSettleDetailId, HttpServletRequest request) {
        QueryExtends queryExtends = (QueryExtends) request.getSession().getAttribute("users");
        Member member = memberService.findMemberById(queryExtends.getId());
        member.setBalance(member.getBalance() - money);
        memberService.saveOrUpdateMember(member);//扣钱
        costSettleDetailService.finishBySettleId(costSettleDetailId);
        PaymentDetail paymentDetail = new PaymentDetail();
        paymentDetail.setMemberId(member.getId());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
        paymentDetail.setId(simpleDateFormat.format(new Date()));
        paymentDetail.setRechargeAmount(money);
        paymentDetail.setBalance(member.getBalance() - money);
        paymentDetail.setCreateTime(simpleDateFormat2.format(new Date()));
        paymentDetail.setRechargeMethod("微信支付");

        CostSettleDetail costSettleDetail = costSettleDetailService.getCostSettleById(costSettleDetailId);
        paymentDetail.setUserId(costSettleDetail.getUserId());
//        System.out.println("看过来 " + queryExtends.getId());
        paymentDetailService.save(paymentDetail);
        return "redirect:/costSettleDetail/listByMemberId";
    }
}
