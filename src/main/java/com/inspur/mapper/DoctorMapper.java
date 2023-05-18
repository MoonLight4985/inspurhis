package com.inspur.mapper;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Doctor;
import com.inspur.service.DoctorService;
import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
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
