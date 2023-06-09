package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.CostSettleDetail;
import com.inspur.entity.CostSettleDetail;
import com.inspur.mapper.CostSettleDetailMapper;
import com.inspur.service.CostSettleDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
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

    @Override
    public void finishBySettleId(String costSettleDetailId) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String nowDate = simpleDateFormat.format(new Date());
        costSettleDetailMapper.finishBySettleId(costSettleDetailId, nowDate);
    }

    @Override
    public void addCostSettleDetail(CostSettleDetail costSettleDetail) {
        costSettleDetailMapper.save(costSettleDetail);
    }

    @Override
    public CostSettleDetail getCostSettleById(String costSettleDetailId) {
        return costSettleDetailMapper.getCostSettleById(costSettleDetailId);
    }
}




