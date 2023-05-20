package com.inspur.entity;

import lombok.Data;

@Data
public class DoctorAdvice {
    private String id;

    private String registerOrderId;

    private String memberId;

    private String doctorId;

    private String prescription;

    private String createTime;

    private String status;
}
