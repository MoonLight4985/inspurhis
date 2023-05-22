package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Doctor;
import com.inspur.entity.DoctorDuty;
import com.inspur.service.DoctorDutyService;
import com.inspur.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("doctorduty")
public class DoctorDutyController {
    @Autowired
    private DoctorDutyService doctorDutyService;

    @Autowired
    private DoctorService doctorService;

    @GetMapping("list")
    public String getDoctorDutyByCondition(DoctorDuty doctorDuty,
                                         HttpServletRequest request,
                                         @RequestParam(defaultValue = "1") Integer pageNum,
                                         @RequestParam(defaultValue = "5") Integer pageSize) {
        PageInfo<DoctorDuty> pageInfo = doctorDutyService.getDoctorDutyByCondition(doctorDuty, pageNum, pageSize);
        List<Doctor> allDoctor = doctorService.getAllDoctor();
        request.setAttribute("doctorList", allDoctor);
        request.setAttribute("pageInfo", pageInfo);
        return "yszblist";
    }

    @PostMapping("save")
    public String save(DoctorDuty doctorDuty, HttpServletRequest request) {
        DoctorDuty updateDoctorDuty = (DoctorDuty) request.getAttribute("doctorDuty");
        if (updateDoctorDuty != null) {
            doctorDuty.setId(updateDoctorDuty.getId());
        }
        boolean flag = doctorDutyService.saveOrUpdateDoctorDuty(doctorDuty);

        return "redirect:/doctorduty/list";
    }

    @GetMapping("deleteByDoctorDutyId")
    public String deleteByDoctorDutyId(String id) {
        boolean flag = doctorDutyService.deleteByDoctorDutyId(id);
        return "redirect:/doctorduty/list";
    }

    @GetMapping("findDoctorDutyById")
    public String findUserById(String id, HttpServletRequest request) {
        DoctorDuty doctorDuty = doctorDutyService.findDoctorDutyById(id);
        List<Doctor> doctorList = doctorService.getAllDoctor();
        request.setAttribute("doctorDuty", doctorDuty);
        request.setAttribute("doctorList", doctorList);
        return "yszbadd";
    }

    @GetMapping("toAddDoctorDuty")
    public String toAddDoctorDuty(HttpServletRequest request) {
        List<Doctor> allDoctor = doctorService.getAllDoctor();
        request.setAttribute("doctorList", allDoctor);
        return "yszbadd";
    }
}
