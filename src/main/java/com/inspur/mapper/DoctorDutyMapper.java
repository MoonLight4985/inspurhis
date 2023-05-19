package com.inspur.mapper;

import com.inspur.entity.DoctorDuty;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface DoctorDutyMapper {
    List<DoctorDuty> findDoctorDutyByCondition(DoctorDuty doctorDuty);

    @Delete("delete from doctor_duty where id=#{id}")
    boolean deleteByDoctorDutyId(String id);

    @Select("select * from doctor_duty where id=#{id}")
    DoctorDuty findUsersById(String id);


    @Insert("insert into doctor_duty (id, doctor_id, work_time) values (#{id}, #{doctorId}, #{workTime})")
    int save(DoctorDuty doctorDuty);

    @Update("update doctor_duty set doctor_id = #{doctorId}, work_time=#{workTime} where id = #{id}}")
    int update(DoctorDuty doctorDuty);
}
