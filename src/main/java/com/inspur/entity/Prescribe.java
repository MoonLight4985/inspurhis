package com.inspur.entity;

import lombok.Data;

@Data
public class Prescribe {

    private String id;

    private String doctorDutyId;

    private String registerOrderId;

    private String medicineId;

    private Integer number;

    private String description;

    private String status;

}
