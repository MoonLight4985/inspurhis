package com.inspur.mapper;

import com.inspur.entity.QueryExtends;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface QueryExtendsMapper {
    @Select(" SELECT NAME,role FROM users  WHERE NAME=#{name} AND PASSWORD =#{password} " +
            " UNION " +
            " SELECT NAME,role FROM member WHERE NAME=#{name} AND PASSWORD =#{password} " +
            " UNION " +
            " SELECT NAME,role FROM doctor WHERE  NAME=#{name} AND PASSWORD =#{password} ")
   QueryExtends login(@Param(value = "name") String name,@Param(value = "password") String password);
}
