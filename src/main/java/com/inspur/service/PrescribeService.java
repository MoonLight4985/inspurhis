package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Prescribe;
import org.springframework.stereotype.Service;

import java.util.List;

public interface PrescribeService {
    List<Prescribe> getPrescribeListByOrderId(String registerOrderId);

    boolean deleteByPrescribeId(String id);

    boolean save(Prescribe prescribe);

    PageInfo<Prescribe> getPrescribeListByCondition(Prescribe prescribe, Integer pageNum, Integer pageSize);
}
