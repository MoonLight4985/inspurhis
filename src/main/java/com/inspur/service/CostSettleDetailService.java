package com.inspur.service;


import com.github.pagehelper.PageInfo;
import com.inspur.entity.CostSettleDetail;

/**
* @author MoonLight
* @description 针对表【cost_settle_detail】的数据库操作Service
* @createDate 2023-05-21 16:35:27
*/
public interface CostSettleDetailService {

    PageInfo<CostSettleDetail> getCostSettleDetailByCondition(CostSettleDetail costSettleDetail, Integer pageNum, Integer pageSize);

    void finishBySettleId(String costSettleDetailId);
}
