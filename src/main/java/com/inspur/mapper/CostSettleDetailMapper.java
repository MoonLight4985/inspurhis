package com.inspur.mapper;

import com.inspur.entity.CostSettleDetail;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
* @author MoonLight
* @description 针对表【cost_settle_detail】的数据库操作Mapper
* @createDate 2023-05-21 16:35:27
* @Entity com.inspur.entity.CostSettleDetail
*/
@Mapper
public interface CostSettleDetailMapper{

    List<CostSettleDetail> findCostSettleDetailByCondition(CostSettleDetail costSettleDetail);

    @Update("update cost_settle_detail set status = 1, create_time = #{nowDate} where id = #{costSettleDetailId}")
    void finishBySettleId(@Param(value = "costSettleDetailId") String costSettleDetailId, @Param(value = "nowDate") String nowDate);

    @Insert("insert into cost_settle_detail (id, member_id, settle_amount, user_id, create_time, status, register_order_id) values (#{id}, #{memberId}, #{settleAmount}, #{userId}, #{createTime}, #{status}, #{registerOrderId})")
    void save(CostSettleDetail costSettleDetail);

    @Select("select * from cost_settle_detail where id = #{costSettleDetailId}")
    CostSettleDetail getCostSettleById(String costSettleDetailId);
}




