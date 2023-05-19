package com.inspur.service.impl;

import com.inspur.entity.QueryExtends;
import com.inspur.mapper.QueryExtendsMapper;
import com.inspur.service.QueryExtendsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author：齐文勇
 * @Package：com.inspur.service.impl
 * @Project：his
 * @name：QueryExtendsServiceImpl
 * @Date：2023/5/19 9:49
 * @Filename：QueryExtendsServiceImpl
 */
@Service
@Transactional
public class QueryExtendsServiceImpl implements QueryExtendsService {
    @Autowired
    private QueryExtendsMapper queryExtendsMapper;
    @Override
    public QueryExtends login(String name, String password) {
        return queryExtendsMapper.login(name,password);
    }
}
