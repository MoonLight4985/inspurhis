package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Doctor;

import java.util.List;

public interface DoctorService {
    boolean saveOrUpdateDoctor(Doctor doctor);

    PageInfo<Doctor> getDoctorByCondition(Doctor doctor, Integer pageNum, Integer pageSize);

    boolean deleteByDoctorId(String id);

    Doctor findDoctorById(String id);

    List<Doctor> getAllDoctor();

    void updatePassword(String id, String password);

    List<Doctor> getDoctorByDepartId(String departId);

}
