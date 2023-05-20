package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.DoctorAdvice;

public interface DoctorAdviceService {
    boolean saveOrUpdateDoctorAdvice(DoctorAdvice doctorAdvice);

    PageInfo<DoctorAdvice> getDoctorAdviceByCondition(DoctorAdvice doctorAdvice, Integer pageNum, Integer pageSize);

    boolean deleteByDoctorAdviceId(String id);

    DoctorAdvice findDoctorAdviceById(String id);
}
