package com.inspur.mapper;

import com.inspur.entity.Users;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper // 表示映射接口，交给 Spring 管理
public interface UsersMapper {

    @Insert("insert into users (username, password) values (#{username}, #{password})")
    int save(Users users);
}
