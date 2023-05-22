package com.inspur.controller;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Medicine;
import com.inspur.entity.Medicine;
import com.inspur.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/medicine")// 窄化管理
public class MedicineController {
    @Autowired
    private MedicineService medicineService;

    @GetMapping("list")
    public String getMedicineByCondition(Medicine medicine,
                                      HttpServletRequest request,
                                      @RequestParam(defaultValue = "1") Integer pageNum,
                                      @RequestParam(defaultValue = "5") Integer pageSize) {
        PageInfo<Medicine> pageInfo = medicineService.getMedicineByCondition(medicine, pageNum, pageSize);
        request.setAttribute("pageInfo", pageInfo);
        return "yplist";
    }

    @PostMapping("save")
    public String save(Medicine medicine, HttpServletRequest request) {
        Medicine updateMedicine = (Medicine) request.getAttribute("medicine");
        if (updateMedicine != null) {
            medicine.setId(updateMedicine.getId());
        }
        boolean flag = medicineService.saveOrUpdateMedicine(medicine);

        return "redirect:/medicine/list";
    }

    @GetMapping("deleteByMedicineId")
    public String deleteByMedicineId(String id) {
        boolean flag = medicineService.deleteByMedicineId(id);
        return "redirect:/medicine/list";
    }

    @GetMapping("findMedicineById")
    public String findUserById(String id, HttpServletRequest request) {
        Medicine medicine = medicineService.findMedicineById(id);
        request.setAttribute("medicine", medicine);
        return "ypadd";
    }

    @GetMapping("increase")
    public String increase(String id, HttpServletRequest request) {
        Medicine medicine = medicineService.findMedicineById(id);
        request.getSession().setAttribute("czMedicine", medicine);
        return "ypcz";
    }

    @PostMapping("saveIncrease")
    public String saveIncrease(Integer num, String id, HttpServletRequest request) {
        Medicine medicine = (Medicine) request.getSession().getAttribute("czMedicine");
        medicine.setNumber(medicine.getNumber() + num);
        boolean b = medicineService.saveOrUpdateMedicine(medicine);
        return "redirect:/medicine/list";
    }
}
