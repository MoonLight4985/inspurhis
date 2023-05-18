package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Medicine;
import com.inspur.entity.Users;

public interface MedicineService {
    PageInfo<Medicine> getMedicineByCondition(Medicine medicine, Integer pageNum, Integer pageSize);

    boolean saveOrUpdateMedicine(Medicine medicine);
}
