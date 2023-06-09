package com.inspur.mapper;

import com.inspur.entity.Prescribe;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Mapper
public interface PrescribeMapper {
    @Select("select * from prescribe where register_order_id = #{registerOrderId}")
    List<Prescribe> getPrescribeListByOrderId(String registerOrderId);

    @Delete("delete from prescribe where id = #{id}")
    boolean deleteByPrescribeId(String id);

    @Insert("insert into prescribe (id, doctor_advice_id, register_order_id, medicine_id, number, description, status, member_id, doctor_id, create_time) values (#{id}, #{doctorAdviceId}, #{registerOrderId}, #{medicineId}, #{number}, #{description}, #{status}, #{memberId}, #{doctorId}, #{createTime})")
    int save(Prescribe prescribe);

    List<Prescribe> getPrescribeListByCondition(Prescribe prescribe);

    @Update("update prescribe set status=1 where id = #{id}")
    void sendMedicineById(String id);

    @Select("select * from prescribe where id = #{id}")
    Prescribe getPrescribeById(String id);
}
