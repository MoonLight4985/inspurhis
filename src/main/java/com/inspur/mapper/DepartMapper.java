package com.inspur.mapper;

import com.inspur.entity.Depart;
import com.inspur.entity.Users;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DepartMapper {
    @Insert("insert into depart (id, name, user_id, create_time) values (#{id}, #{name}, #{userId}, #{createTime})")
    int save(Depart depart);

    List<Depart> findDepartByCondition(Depart depart);

    int update(Depart depart);

    @Delete("delete from depart where id=#{id}")
    boolean deleteByDepartId(String id);

    @Select("select * from depart where id=#{id}")
    Depart findDepartById(String id);
}
