package com.inspur.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Depart {
    private String id;

    private String name;

    private String userId;

    private Date createTime;
}
