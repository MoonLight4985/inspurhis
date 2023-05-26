package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.Doctor;
import com.inspur.mapper.DoctorMapper;
import com.inspur.service.DoctorService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private DoctorMapper doctorsMapper;

    @Override
    public boolean saveOrUpdateDoctor(Doctor doctors) {
        String doctorsId = doctors.getId();
        if (doctorsId == null || doctorsId.equals("")) {
            return save(doctors);
        } else {
            return update(doctors);
        }
    }

    boolean save(Doctor doctors) {
        String id = new DateTime().toString("yyyyMMddHHmmss");
        doctors.setId(id);
        doctors.setRole("2");
        doctors.setCreateTime(new Date());
        return doctorsMapper.save(doctors) > 0;
    }

    boolean update(Doctor doctors) {
        return doctorsMapper.update(doctors) > 0;
    }
    @Override
    public PageInfo<Doctor> getDoctorByCondition(Doctor doctor, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Doctor> doctorsList = doctorsMapper.findDoctorByCondition(doctor);
        PageInfo<Doctor> pageInfo = new PageInfo<>(doctorsList);
        return pageInfo;
    }

    @Override
    public boolean deleteByDoctorId(String id) {
        boolean b = doctorsMapper.deleteByDoctorId(id);
        return b;
    }

    @Override
    public Doctor findDoctorById(String id) {
        Doctor doctors = doctorsMapper.findDoctorById(id);
        return doctors;
    }

    @Override
    public List<Doctor> getAllDoctor() {
        return doctorsMapper.findDoctorByCondition(new Doctor());
    }

    @Override
    public void updatePassword(String id, String password) {
        doctorsMapper.updatePassword(id, password);
    }

    @Override
    public List<Doctor> getDoctorByDepartId(String departId) {
        Doctor doctor = new Doctor();
        doctor.setDepartId(departId);
        return doctorsMapper.findDoctorByCondition(doctor);
    }
}
