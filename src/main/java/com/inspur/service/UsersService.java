package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Users;

public interface UsersService {
    boolean saveOrUpdateUser(Users users);

    PageInfo<Users> getUsersByCondition(Users user, Integer pageNum, Integer pageSize);

    boolean deleteByUserId(String id);

    Users findUserById(String id);
}
