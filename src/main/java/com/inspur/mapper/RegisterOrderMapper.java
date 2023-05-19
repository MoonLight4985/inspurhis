package com.inspur.mapper;

import com.inspur.entity.RegisterOrder;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RegisterOrderMapper {

    List<RegisterOrder> findOrderByCondition(RegisterOrder registerOrder);

    @Delete("delete from register_order where id = #{id}")
    boolean deleteByOrderId(String id);

    @Select("select * from register_order where id = #{id}")
    RegisterOrder findOrderById(String id);

    @Insert("insert into register_order (id, member_id, depart_id, doctor_id, price, ro_time, status, option_time) values (#{id}, #{memberId}, #{departId}, #{doctorId}, #{price}, #{roTime}, #{status}, #{optionTime})")
    int save(RegisterOrder orders);

    int update(RegisterOrder orders);
}
