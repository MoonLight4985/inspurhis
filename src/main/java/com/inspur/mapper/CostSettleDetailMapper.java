package com.inspur.mapper;

import com.inspur.entity.CostSettleDetail;
import org.apache.ibatis.annotations.Mapper;

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
}




