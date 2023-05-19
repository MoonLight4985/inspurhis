package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.DoctorDuty;
import com.inspur.mapper.DoctorDutyMapper;
import com.inspur.service.DoctorDutyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class DoctorDutyServiceImpl implements DoctorDutyService {
    @Autowired
    private DoctorDutyMapper doctorDutyMapper;

    @Override
    public PageInfo<DoctorDuty> getDoctorDutyByCondition(DoctorDuty doctorDuty, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<DoctorDuty> doctorDutyList = doctorDutyMapper.findDoctorDutyByCondition(doctorDuty);
        PageInfo<DoctorDuty> doctorDutyPageInfo = new PageInfo<>(doctorDutyList);
        return doctorDutyPageInfo;
    }

    @Override
    public boolean saveOrUpdateDoctorDuty(DoctorDuty doctorDuty) {
        DoctorDuty select = findDoctorDutyById(doctorDuty.getId());
        if (select == null || select.equals("")) {
            return save(doctorDuty);
        } else {
            return update(doctorDuty);
        }
    }

    @Override
    public boolean deleteByDoctorDutyId(String id) {
        boolean b = doctorDutyMapper.deleteByDoctorDutyId(id);
        return b;
    }

    @Override
    public DoctorDuty findDoctorDutyById(String id) {
        DoctorDuty doctorDuty = doctorDutyMapper.findUsersById(id);
        return doctorDuty;
    }

    boolean save(DoctorDuty doctorDuty) {
        return doctorDutyMapper.save(doctorDuty) > 0;
    }

    boolean update(DoctorDuty doctorDuty) {
        return doctorDutyMapper.update(doctorDuty) > 0;
    }
}
