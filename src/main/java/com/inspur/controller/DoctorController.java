package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Depart;
import com.inspur.entity.Doctor;
import com.inspur.service.DepartService;
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
@RequestMapping("doctor")
public class DoctorController {
    @Autowired
    private DoctorService doctorService;

    @Autowired
    private DepartService departService;

    @PostMapping("save")
    public String save(Doctor doctor, HttpServletRequest request) {
        Doctor updateDoctor = (Doctor) request.getAttribute("doctor");
        if (updateDoctor != null) {
            doctor.setId(updateDoctor.getId());
        }
        boolean flag = doctorService.saveOrUpdateDoctor(doctor);

        return "redirect:/doctor/list";
    }

    @GetMapping("list")
    public String getDoctorByCondition(Doctor doctor,
                                       HttpServletRequest request,
                                       @RequestParam(defaultValue = "1") Integer pageNum,
                                       @RequestParam(defaultValue = "5") Integer pageSize) {
        System.out.println(doctor);
        PageInfo<Doctor> pageInfo = doctorService.getDoctorByCondition(doctor, pageNum, pageSize);
        System.out.println(pageInfo);
        List<Depart> allDepart = departService.getAllDepart();
        request.setAttribute("departList", allDepart);
        request.setAttribute("pageInfo", pageInfo);
        return "yslist";
    }
    @GetMapping("deleteByDoctorId")
    public String deleteByDoctorId(String id) {
        boolean flag = doctorService.deleteByDoctorId(id);
        return "redirect:/doctor/list";
    }

    @GetMapping("findDoctorById")
    public String findDoctorById(String id, HttpServletRequest request) {
        Doctor doctor = new Doctor();
        if (id != null)
            doctor = doctorService.findDoctorById(id);
        List<Depart> allDepart = departService.getAllDepart();
        request.setAttribute("departList", allDepart);
        request.setAttribute("doctor", doctor);
        return "ysadd";
    }

    @GetMapping("getDoctorByDepartId")
    public String getDoctorByDepartId(String departId, HttpServletRequest request) {
        List<Doctor> doctors = doctorService.getDoctorByDepartId(departId);
        request.setAttribute("doctorList", doctors);
        return "ghadd";
    }
}
