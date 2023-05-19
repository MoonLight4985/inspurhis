package com.inspur.entity;

import lombok.Data;

@Data
public class RegisterOrder {
    private String id;

    private String departId;

    private String doctorId;

    private String memberId;

    private Double price;

    private String roTime;

    private String status;

    private String optionTime;
}
