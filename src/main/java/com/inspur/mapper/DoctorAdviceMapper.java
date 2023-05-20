package com.inspur.mapper;

import com.inspur.entity.Doctor;
import com.inspur.entity.DoctorAdvice;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface DoctorAdviceMapper {
    List<DoctorAdvice> findDoctorAdviceByCondition(DoctorAdvice doctorAdvices);

    @Delete("delete from doctor_advice where id = #{id}")
    boolean deleteByDoctorAdviceId(String id);

    @Select("select * from doctor_advice where id = #{id}")
    DoctorAdvice findDoctorAdviceById(String id);

    @Insert("insert into doctor_advice (id, register_order_id, member_id, doctor_id, prescription, create_time, status) values (#{id}, #{registerOrderId}, #{memberId}, #{doctorId}, #{prescription}, #{createTime}, #{status}")
    int save(DoctorAdvice doctorAdvices);

    @Update("")
    int update(DoctorAdvice doctorAdvices);
}
