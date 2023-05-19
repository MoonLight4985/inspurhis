package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.DoctorDuty;

public interface DoctorDutyService {
    PageInfo<DoctorDuty> getDoctorDutyByCondition(DoctorDuty doctorDuty, Integer pageNum, Integer pageSize);

    boolean saveOrUpdateDoctorDuty(DoctorDuty doctorDuty);

    boolean deleteByDoctorDutyId(String id);

    DoctorDuty findDoctorDutyById(String id);
}
