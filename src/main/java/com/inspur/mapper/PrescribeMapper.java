package com.inspur.mapper;

import com.inspur.entity.Prescribe;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface PrescribeMapper {
    @Select("select * from prescribe where register_order_id = #{registerOrderId}")
    List<Prescribe> getPrescribeListByOrderId(String registerOrderId);

    @Delete("delete from prescribe where id = #{id}")
    boolean deleteByPrescribeId(String id);
}
