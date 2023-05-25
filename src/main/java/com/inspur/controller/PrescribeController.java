package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Doctor;
import com.inspur.entity.Medicine;
import com.inspur.entity.Member;
import com.inspur.entity.Prescribe;
import com.inspur.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("prescribe")
public class PrescribeController {
    @Autowired
    private PrescribeService prescribeService;
    @Autowired
    private MedicineService medicineService;

    @Autowired
    private RegisterOrderService registerOrderService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private DoctorService doctorService;

    @GetMapping("/list")
    public String getPrescribeListByOrderId(String registerOrderId, String doctorAdviceId, HttpServletRequest request) {
        List<Prescribe> prescribeListByOrderId = prescribeService.getPrescribeListByOrderId(registerOrderId);
        request.setAttribute("pageInfo", prescribeListByOrderId);
        List<Medicine> medicineList = medicineService.getAllMedicine();
        request.getSession().setAttribute("registerOrderId", registerOrderId);
        request.getSession().setAttribute("doctorAdviceId", doctorAdviceId);
        System.out.println(registerOrderId);
        System.out.println(doctorAdviceId);
        request.setAttribute("medicineList", medicineList);
        return "kylist";
    }

    @GetMapping("deleteByPrescribeId")
    public String deleteByPrescribeId(String id, String registerOrderId) {
        boolean flag = prescribeService.deleteByPrescribeId(id);
        return "redirect:/prescribe/list?registerOrderId=" + registerOrderId;
    }

    @PostMapping("/save")
    public String savePrescribe(Prescribe prescribe) {
        prescribe.setMemberId(registerOrderService.findOrderById(prescribe.getRegisterOrderId()).getMemberId());
        prescribe.setDoctorId(registerOrderService.findOrderById(prescribe.getRegisterOrderId()).getDoctorId());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        prescribe.setCreateTime(simpleDateFormat.format(new Date()));
        prescribeService.save(prescribe);
        return "redirect:/prescribe/list?registerOrderId=" + prescribe.getRegisterOrderId() + "&doctorAdviceId=" + prescribe.getDoctorAdviceId();
    }

    @GetMapping("toAdd")
    public String toAdd(String registerOrderId, String doctorAdviceId, HttpServletRequest request) {
        request.getSession().setAttribute("registerOrderId", registerOrderId);
        request.getSession().setAttribute("doctorAdviceId", doctorAdviceId);
        List<Medicine> allMedicine = medicineService.getAllMedicine();
        request.getSession().setAttribute("medicineList", allMedicine);
        return "yzkyadd";
    }

    @GetMapping("sendList")
    public String getSendList(Prescribe prescribe,
                              HttpServletRequest request,
                              @RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "5") Integer pageSize) {
        PageInfo<Prescribe> pageInfo = prescribeService.getPrescribeListByCondition(prescribe, pageNum, pageSize);
        List<Member> allMember = memberService.getAllMember();
        List<Doctor> allDoctor = doctorService.getAllDoctor();
        request.getSession().setAttribute("memberList", allMember);
        request.getSession().setAttribute("doctorList", allDoctor);
        request.setAttribute("pageInfo", pageInfo);
        return "ypfflist";
    }

    @GetMapping("sendMedicineById")
    public String sendMedicineById(String id, HttpServletRequest request) {
        prescribeService.sendMedicineById(id, request);
        return "redirect:/prescribe/sendList";
    }

}
