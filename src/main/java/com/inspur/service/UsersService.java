package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Users;

import java.util.List;

public interface UsersService {
    boolean saveOrUpdateUser(Users users);

    PageInfo<Users> getUsersByCondition(Users user, Integer pageNum, Integer pageSize);

    boolean deleteByUserId(String id);

    Users findUserById(String id);

    List<Users> getAllUsers();
}
