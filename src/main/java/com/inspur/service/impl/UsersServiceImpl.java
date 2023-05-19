package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.Users;
import com.inspur.mapper.UsersMapper;
import com.inspur.service.UsersService;
import org.apache.ibatis.annotations.Update;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.crypto.Data;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class UsersServiceImpl implements UsersService {
    @Autowired
    private UsersMapper usersMapper;

    @Override
    public boolean saveOrUpdateUser(Users users) {
        String usersId = users.getId();
        if (usersId == null || usersId.equals("")) {
            return save(users);
        } else {
            return update(users);
        }
    }

    boolean save(Users users) {
        String id = new DateTime().toString("yyyyMMddHHmmss");
        users.setId(id);
        users.setCreateTime(new Date());
        users.setUpdateTime(new Date());
        return usersMapper.save(users) > 0;
    }

    boolean update(Users users) {
        users.setUpdateTime(new Date());
        return usersMapper.update(users) > 0;
    }
    @Override
    public PageInfo<Users> getUsersByCondition(Users user, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Users> usersList = usersMapper.findUsersByCondition(user);
        PageInfo<Users> pageInfo = new PageInfo<>(usersList);
        return pageInfo;
    }

    @Override
    public boolean deleteByUserId(String id) {
        boolean b = usersMapper.deleteByUserId(id);
        return b;
    }

    @Override
    public Users findUserById(String id) {
        System.out.println(id);
        Users users = usersMapper.findUsersById(id);
        return users;
    }
}
