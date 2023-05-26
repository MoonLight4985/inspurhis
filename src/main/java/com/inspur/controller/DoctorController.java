package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Depart;
import com.inspur.entity.Doctor;
import com.inspur.service.DepartService;
import com.inspur.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @ResponseBody
    public List<Doctor> getDoctorByDepartId(String departId) {
        List<Doctor> doctors = doctorService.getDoctorByDepartId(departId);
        System.out.println(doctors);
        return doctors;
    }
}
