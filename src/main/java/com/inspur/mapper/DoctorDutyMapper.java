package com.inspur.mapper;

import com.inspur.entity.DoctorDuty;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DoctorDutyMapper {
    List<DoctorDuty> findDoctorDutyByCondition(DoctorDuty doctorDuty);

    @Delete("delete from doctor_Duty where id=#{id}")
    boolean deleteByDoctorDutyId(String id);

    @Select("select * from doctor_Duty where id=#{id}")
    DoctorDuty findUsersById(String id);


    int save(DoctorDuty doctorDuty);

    int update(DoctorDuty doctorDuty);
}
