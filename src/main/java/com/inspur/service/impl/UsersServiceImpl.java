package com.inspur.service.impl;

import com.inspur.entity.Users;
import com.inspur.mapper.UsersMapper;
import com.inspur.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UsersServiceImpl implements UsersService {
    @Autowired
    private UsersMapper usersMapper;

    @Override
    public boolean addUser(Users users) {
        return usersMapper.save(users) > 0;
    }
}
