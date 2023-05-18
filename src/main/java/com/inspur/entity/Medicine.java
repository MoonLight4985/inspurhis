package com.inspur.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Medicine {
    private String id;

    private String name;

    private Double price;// 售价

    private Double purchasePrice;//进价

    private Integer number;//库存数量

    private String introduceDate;//引入日期

    private String productDate;//生产日期

    private String qualityPeriod;//保质期

    private String supplyUnit;//供货单位

    private String productUnit;//生产厂商
}
