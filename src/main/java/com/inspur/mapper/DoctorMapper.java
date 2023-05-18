package com.inspur.mapper;

import com.inspur.entity.Doctor;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface DoctorMapper {

    List<Doctor> findDoctorByCondition(Doctor doctor);

    @Delete("delete from doctor where id = #{id}")
    boolean deleteByDoctorId(String id);

    @Select("select * from doctor where id = #{id}")
    Doctor findDoctorById(String id);

    @Insert("insert into doctor (id, name, password, role, realname, depart_id, positional, sex, age, tel, create_time) values (#{id}, #{name}, #{password}, #{role}, #{realname}, #{departId}, #{positional}, #{sex}, #{age}, #{tel}, #{createTime})")
    int save(Doctor doctors);

    int update(Doctor doctors);
}
