package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.Doctor;
import com.inspur.entity.Prescribe;
import com.inspur.mapper.PrescribeMapper;
import com.inspur.service.MedicineService;
import com.inspur.service.PrescribeService;
import com.sun.scenario.effect.impl.prism.PrReflectionPeer;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrescribeServiceImpl implements PrescribeService {
    @Autowired
    private PrescribeMapper prescribeMapper;

    @Autowired
    private MedicineService medicineService;
    @Override
    public List<Prescribe> getPrescribeListByOrderId(String registerOrderId) {
        List<Prescribe> prescribeList = prescribeMapper.getPrescribeListByOrderId(registerOrderId);
        return prescribeList;
    }

    @Override
    public boolean deleteByPrescribeId(String id) {
        boolean b = prescribeMapper.deleteByPrescribeId(id);
        return b;
    }

    @Override
    public boolean save(Prescribe prescribe) {
        prescribe.setStatus("0");
        String id = new DateTime().toString("yyyyMMddHHmmss");
        prescribe.setId(id);
        return prescribeMapper.save(prescribe) > 0;
    }

    @Override
    public PageInfo<Prescribe> getPrescribeListByCondition(Prescribe prescribe, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Prescribe> prescribeList = prescribeMapper.getPrescribeListByCondition(prescribe);
        PageInfo<Prescribe> pageInfo = new PageInfo<>(prescribeList);
        return pageInfo;
    }

    @Override
    public void sendMedicineById(String id) {
        Prescribe prescribe = prescribeMapper.getPrescribeById(id);
        prescribeMapper.sendMedicineById(id);
        int num = prescribe.getNumber();
        String medicineId = prescribe.getMedicineId();
        medicineService.sendMedicine(medicineId, num);
    }
}
