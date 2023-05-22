package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Medicine;
import com.inspur.entity.Prescribe;
import com.inspur.service.MedicineService;
import com.inspur.service.PrescribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("prescribe")
public class PrescribeController {
    @Autowired
    private PrescribeService prescribeService;
    @Autowired
    private MedicineService medicineService;

    @GetMapping("/list")
    public String getPrescribeListByOrderId(String registerOrderId, HttpServletRequest request) {
        List<Prescribe> prescribeListByOrderId = prescribeService.getPrescribeListByOrderId(registerOrderId);
        request.setAttribute("pageInfo", prescribeListByOrderId);
        List<Medicine> medicineList = medicineService.getAllMedicine();
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
        prescribeService.save(prescribe);
        return "redirect:/prescribe/list?registerOrderId=" + prescribe.getRegisterOrderId();
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
        request.setAttribute("pageInfo", pageInfo);
        return "ypfflist";
    }

    @GetMapping("sendMedicineById")
    public String sendMedicineById(String id) {
        prescribeService.sendMedicineById(id);
        return "redirect:/prescribe/sendList";
    }

}
