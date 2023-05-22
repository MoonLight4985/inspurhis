package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Depart;

import java.util.List;

public interface DepartService {
    boolean saveOrUpdateDepart(Depart depart);

    PageInfo<Depart> getDepartByCondition(Depart depart, Integer pageNum, Integer pageSize);

    boolean deleteByDepartId(String id);

    Depart findDepartById(String id);

    List<Depart> getAllDepart();
}
