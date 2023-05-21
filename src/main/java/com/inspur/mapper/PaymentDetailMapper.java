package com.inspur.mapper;

import com.inspur.entity.PaymentDetail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
* @author MoonLight
* @description 针对表【payment_detail】的数据库操作Mapper
* @createDate 2023-05-21 15:54:03
* @Entity com.inspur.entity.PaymentDetail
*/
@Mapper
public interface PaymentDetailMapper {

    List<PaymentDetail> getPaymentDetailListByCondition(PaymentDetail paymentDetail);
}




