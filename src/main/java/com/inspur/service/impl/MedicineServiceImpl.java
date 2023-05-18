package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.Medicine;
import com.inspur.entity.Users;
import com.inspur.mapper.MedicineMapper;
import com.inspur.service.MedicineService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class MedicineServiceImpl implements MedicineService {
    @Autowired
    private MedicineMapper medicineMapper;

    @Override
    public PageInfo<Medicine> getMedicineByCondition(Medicine medicine, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Medicine> medicineList = medicineMapper.findMedicineByCondition(medicine);
        PageInfo<Medicine> medicinePageInfo = new PageInfo<>(medicineList);
        return medicinePageInfo;
    }

    @Override
    public boolean saveOrUpdateMedicine(Medicine medicine) {
        return save(medicine);
    }

    boolean save(Medicine medicine) {
        medicine.setIntroduceDate(new Date());
        return medicineMapper.save(medicine) > 0;
    }

    boolean update(Medicine medicine) {
        return medicineMapper.update(medicine) > 0;
    }
}
