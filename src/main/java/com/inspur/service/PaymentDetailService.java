package com.inspur.service;


import com.github.pagehelper.PageInfo;
import com.inspur.entity.PaymentDetail;

import java.util.List;

/**
* @author MoonLight
* @description 针对表【payment_detail】的数据库操作Service
* @createDate 2023-05-21 15:54:03
*/
public interface PaymentDetailService {

    PageInfo<PaymentDetail> getPaymentDetailListByCondition(PaymentDetail paymentDetail, Integer pageNum, Integer pageSize);
}
