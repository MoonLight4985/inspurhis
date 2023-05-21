package com.inspur.mapper;

import com.inspur.entity.QueryExtends;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface QueryExtendsMapper {
    @Select(" SELECT id, username,role FROM users  WHERE username=#{name} AND PASSWORD =#{password} " +
            " UNION " +
            " SELECT id, name,role FROM member WHERE name=#{name} AND PASSWORD =#{password} " +
            " UNION " +
            " SELECT id, name,role FROM doctor WHERE  name=#{name} AND PASSWORD =#{password} ")
   QueryExtends login(@Param(value = "name") String name,@Param(value = "password") String password);
}
