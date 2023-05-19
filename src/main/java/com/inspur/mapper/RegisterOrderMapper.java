package com.inspur.mapper;

import com.inspur.entity.RegisterOrder;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RegisterOrderMapper {

    List<RegisterOrder> findOrderByCondition(RegisterOrder registerOrder);

    @Delete("delete from order where id = #{id}")
    boolean deleteByOrderId(String id);

    @Select("select * from order where id = #{id}")
    RegisterOrder findOrderById(String id);

    int save(RegisterOrder orders);

    int update(RegisterOrder orders);
}
