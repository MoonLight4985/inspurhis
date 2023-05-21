package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.DoctorAdvice;
import com.inspur.mapper.DoctorAdviceMapper;
import com.inspur.service.DoctorAdviceService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class DoctorAdviceServiceImpl implements DoctorAdviceService {
    @Autowired
    private DoctorAdviceMapper doctorAdvicesMapper;

    @Override
    public boolean saveOrUpdateDoctorAdvice(DoctorAdvice doctorAdvice) {
        String doctorAdvicesId = doctorAdvice.getId();
        if (doctorAdvicesId == null || doctorAdvicesId.equals("")) {
            return save(doctorAdvice);
        } else {
            return update(doctorAdvice);
        }
    }

    boolean save(DoctorAdvice doctorAdvices) {
        String id = new DateTime().toString("yyyyMMddHHmmss");
        doctorAdvices.setId(id);
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        doctorAdvices.setCreateTime(simpleDateFormat.format(new Date()));
        return doctorAdvicesMapper.save(doctorAdvices) > 0;
    }

    boolean update(DoctorAdvice doctorAdvices) {
        return doctorAdvicesMapper.update(doctorAdvices) > 0;
    }
    @Override
    public PageInfo<DoctorAdvice> getDoctorAdviceByCondition(DoctorAdvice doctorAdvice, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<DoctorAdvice> doctorAdvicesList = doctorAdvicesMapper.findDoctorAdviceByCondition(doctorAdvice);
        PageInfo<DoctorAdvice> pageInfo = new PageInfo<>(doctorAdvicesList);
        return pageInfo;
    }

    @Override
    public boolean deleteByDoctorAdviceId(String id) {
        boolean b = doctorAdvicesMapper.deleteByDoctorAdviceId(id);
        return b;
    }

    @Override
    public DoctorAdvice findDoctorAdviceById(String id) {
        DoctorAdvice doctorAdvices = doctorAdvicesMapper.findDoctorAdviceById(id);
        return doctorAdvices;
    }
}
