package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Doctor;

public interface DoctorService {
    boolean saveOrUpdateDoctor(Doctor doctor);

    PageInfo<Doctor> getDoctorByCondition(Doctor doctor, Integer pageNum, Integer pageSize);

    boolean deleteByDoctorId(String id);

    Doctor findDoctorById(String id);
}
