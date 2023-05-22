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

import java.text.SimpleDateFormat;
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
        Medicine select = findMedicineById(medicine.getId());
        if (select == null || select.equals("")) {
            return save(medicine);
        } else {
            return update(medicine);
        }
    }

    @Override
    public boolean deleteByMedicineId(String id) {
        boolean b = medicineMapper.deleteByMedicineId(id);
        return b;
    }

    @Override
    public Medicine findMedicineById(String id) {
        Medicine medicine = medicineMapper.findUsersById(id);
        return medicine;
    }

    @Override
    public List<Medicine> getAllMedicine() {
        return medicineMapper.findMedicineByCondition(new Medicine());
    }

    @Override
    public void sendMedicine(String medicineId, int num) {
        medicineMapper.sendMedicine(medicineId, num);
    }

    boolean save(Medicine medicine) {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        medicine.setIntroduceDate(simpleDateFormat.format(new Date()));
        return medicineMapper.save(medicine) > 0;
    }

    boolean update(Medicine medicine) {
        return medicineMapper.update(medicine) > 0;
    }
}
