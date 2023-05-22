package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.Depart;
import com.inspur.entity.PaymentDetail;
import com.inspur.mapper.PaymentDetailMapper;
import com.inspur.service.PaymentDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author MoonLight
* @description 针对表【payment_detail】的数据库操作Service实现
* @createDate 2023-05-21 15:54:03
*/
@Service
public class PaymentDetailServiceImpl implements PaymentDetailService{
    @Autowired
    private PaymentDetailMapper paymentDetailMapper;
    @Override
    public PageInfo<PaymentDetail> getPaymentDetailListByCondition(PaymentDetail paymentDetail, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<PaymentDetail> paymentDetailList = paymentDetailMapper.getPaymentDetailListByCondition(paymentDetail);
        PageInfo<PaymentDetail> pageInfo = new PageInfo<>(paymentDetailList);
        return pageInfo;

    }

    @Override
    public void save(PaymentDetail paymentDetail) {
        paymentDetailMapper.save(paymentDetail);
    }
}




