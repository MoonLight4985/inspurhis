package com.inspur.entity;

import java.io.Serializable;
import lombok.Data;

/**
 *
 * @TableName payment_detail
 */
@Data
public class PaymentDetail {
    /**
     *
     */
    private String id;

    /**
     *
     */
    private String memberId;

    /**
     *
     */
    private Integer rechargeAmount;

    /**
     *
     */
    private Integer balance;

    /**
     *
     */
    private String rechargeMethod;

    /**
     *
     */
    private String userId;

    /**
     *
     */
    private String createTime;

}
