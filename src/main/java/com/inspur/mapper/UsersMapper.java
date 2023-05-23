package com.inspur.mapper;

import com.inspur.entity.Users;
import jdk.internal.org.objectweb.asm.tree.analysis.Value;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper // 表示映射接口，交给 Spring 管理
public interface UsersMapper {

    @Insert("insert into users (id, username, password, role, realname, tel, age, address, create_time, update_time, introduce_date) values (#{id}, #{username}, #{password}, #{role}, #{realname}, #{tel}, #{age}, #{address}, #{createTime}, #{updateTime}, #{introduceDate})")
    int save(Users users);

    List<Users> findUsersByCondition(Users users);

    @Delete("delete from users where id = #{id}")
    boolean deleteByUserId(String id);

    @Update("update users set username=#{username}, password=#{password}, role=#{role}, realname=#{realname}, tel=#{tel}, age=#{age}, address=#{address}, create_time=#{createTime}, update_time=#{updateTime} where id = #{id}")
    int update(Users users);

    Users findUsersById(String id);

    @Update("update users set password=#{password} where id = #{id}")
    void updatePassword(@Param(value = "id")String id, @Param(value = "password") String password);
}
