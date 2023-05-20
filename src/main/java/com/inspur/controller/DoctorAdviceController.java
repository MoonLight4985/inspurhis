package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.DoctorAdvice;
import com.inspur.service.DoctorAdviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("doctorAdvice")
public class DoctorAdviceController {
    @Autowired
    private DoctorAdviceService doctorAdviceService;

    @PostMapping("save")
    public String save(DoctorAdvice doctorAdvice, HttpServletRequest request) {
        DoctorAdvice updateDoctorAdvice = (DoctorAdvice) request.getAttribute("doctorAdvice");
        System.out.println("cang" + doctorAdvice);
        if (updateDoctorAdvice != null) {
            doctorAdvice.setId(updateDoctorAdvice.getId());
        }
        boolean flag = doctorAdviceService.saveOrUpdateDoctorAdvice(doctorAdvice);

        return "redirect:/doctorAdvice/list";
    }

    @GetMapping("list")
    public String getDoctorAdviceByCondition(DoctorAdvice doctorAdvice,
                                       HttpServletRequest request,
                                       @RequestParam(defaultValue = "1") Integer pageNum,
                                       @RequestParam(defaultValue = "5") Integer pageSize) {
        System.out.println(doctorAdvice);
        PageInfo<DoctorAdvice> pageInfo = doctorAdviceService.getDoctorAdviceByCondition(doctorAdvice, pageNum, pageSize);
        request.setAttribute("pageInfo", pageInfo);
        return "yzlist";
    }
    @GetMapping("deleteByDoctorAdviceId")
    public String deleteByDoctorAdviceId(String id) {
        boolean flag = doctorAdviceService.deleteByDoctorAdviceId(id);
        return "redirect:/doctorAdvice/list";
    }

    @GetMapping("findDoctorAdviceById")
    public String findDoctorAdviceById(String id, HttpServletRequest request) {
        DoctorAdvice doctorAdvice = doctorAdviceService.findDoctorAdviceById(id);
        request.setAttribute("doctorAdvice", doctorAdvice);
        return "yzadd";
    }

}
