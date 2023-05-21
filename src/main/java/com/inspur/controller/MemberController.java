package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Member;
import com.inspur.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

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
}
