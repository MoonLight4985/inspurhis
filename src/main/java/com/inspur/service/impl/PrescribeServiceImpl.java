package com.inspur.service.impl;

import com.inspur.entity.Prescribe;
import com.inspur.mapper.PrescribeMapper;
import com.inspur.service.PrescribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrescribeServiceImpl implements PrescribeService {
    @Autowired
    private PrescribeMapper prescribeMapper;
    @Override
    public List<Prescribe> getPrescribeListByOrderId(String registerOrderId) {
        List<Prescribe> prescribeList = prescribeMapper.getPrescribeListByOrderId(registerOrderId);
        return prescribeList;
    }

    @Override
    public boolean deleteByPrescribeId(String id) {
        boolean b = prescribeMapper.deleteByPrescribeId(id);
        return b;
    }
}
