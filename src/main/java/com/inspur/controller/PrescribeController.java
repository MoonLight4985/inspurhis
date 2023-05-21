package com.inspur.controller;

import com.inspur.entity.Prescribe;
import com.inspur.service.PrescribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("prescribe")
public class PrescribeController {
    @Autowired
    private PrescribeService prescribeService;

    @GetMapping("/list")
    public String getPrescribeListByOrderId(String registerOrderId, HttpServletRequest request) {
        List<Prescribe> prescribeListByOrderId = prescribeService.getPrescribeListByOrderId(registerOrderId);
        request.setAttribute("pageInfo", prescribeListByOrderId);
        return "kylist";
    }

    @GetMapping("deleteByPrescribeId")
    public String deleteByPrescribeId(String id, String registerOrderId) {
        boolean flag = prescribeService.deleteByPrescribeId(id);
        return "redirect:/prescribe/list?registerOrderId=" + registerOrderId;
    }

    @PostMapping("/save")
    public String savePrescribe(Prescribe prescribe) {
        prescribeService.save(prescribe);
        return "redirect:/prescribe/list?registerOrderId=" + prescribe.getRegisterOrderId();
    }

    @GetMapping("toAdd")
    public String toAdd(String registerOrderId, String doctorDutyId, HttpServletRequest request) {
        request.getSession().setAttribute("registerOrderId", registerOrderId);
        request.getSession().setAttribute("doctorDutyId", doctorDutyId);
        return "yzkyadd";
    }
}
