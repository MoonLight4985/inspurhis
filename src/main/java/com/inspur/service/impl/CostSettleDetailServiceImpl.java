package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.CostSettleDetail;
import com.inspur.entity.CostSettleDetail;
import com.inspur.mapper.CostSettleDetailMapper;
import com.inspur.service.CostSettleDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author MoonLight
* @description 针对表【cost_settle_detail】的数据库操作Service实现
* @createDate 2023-05-21 16:35:27
*/
@Service
public class CostSettleDetailServiceImpl implements CostSettleDetailService{
    @Autowired
    private CostSettleDetailMapper costSettleDetailMapper;
    @Override
    public PageInfo<CostSettleDetail> getCostSettleDetailByCondition(CostSettleDetail costSettleDetail, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<CostSettleDetail> costSettleDetailList = costSettleDetailMapper.findCostSettleDetailByCondition(costSettleDetail);
        PageInfo<CostSettleDetail> pageInfo = new PageInfo<>(costSettleDetailList);
        return pageInfo;
    }
}




