package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Medicine;
import com.inspur.entity.Users;

import java.util.List;

public interface MedicineService {
    PageInfo<Medicine> getMedicineByCondition(Medicine medicine, Integer pageNum, Integer pageSize);

    boolean saveOrUpdateMedicine(Medicine medicine);

    boolean deleteByMedicineId(String id);

    Medicine findMedicineById(String id);

    List<Medicine> getAllMedicine();

    void sendMedicine(String medicineId, int num);
}
