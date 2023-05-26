package com.inspur.entity;

import java.io.Serializable;
import lombok.Data;

/**
 *
 * @TableName cost_settle_detail
 */
@Data
public class CostSettleDetail implements Serializable {
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
    private Integer settleAmount;

    /**
     *
     */
    private String userId;

    /**
     *
     */
    private String createTime;

    private String status;

    private String registerOrderId;

}
