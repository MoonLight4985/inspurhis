package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.Depart;
import com.inspur.entity.Depart;
import com.inspur.entity.Users;
import com.inspur.mapper.DepartMapper;
import com.inspur.service.DepartService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class DepartServiceImpl implements DepartService {
    @Autowired
    private DepartMapper departMapper;

    @Override
    public boolean saveOrUpdateDepart(Depart depart) {
        String departId = depart.getId();
        if (findDepartById(departId) == null) {
            return save(depart);
        } else {
            return update(depart);
        }
    }

    boolean save(Depart depart) {
//        String id = new DateTime().toString("yyyyMMddHHmmss");
//        depart.setId(id);
        depart.setUserId("34234");
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        depart.setCreateTime(simpleDateFormat.format(new Date()));
        return departMapper.save(depart) > 0;
    }

    boolean update(Depart depart) {
        return departMapper.update(depart) > 0;
    }
    @Override
    public PageInfo<Depart> getDepartByCondition(Depart depart, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Depart> departList = departMapper.findDepartByCondition(depart);
        PageInfo<Depart> pageInfo = new PageInfo<>(departList);
        return pageInfo;
    }

    @Override
    public boolean deleteByDepartId(String id) {
        boolean b = departMapper.deleteByDepartId(id);
        return b;
    }

    @Override
    public Depart findDepartById(String id) {
        System.out.println(id);
        Depart depart = departMapper.findDepartById(id);
        return depart;
    }

}
