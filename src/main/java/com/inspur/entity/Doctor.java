package com.inspur.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Doctor {
    private String id;

    private String name;

    private String password;

    private String role;

    private String realname;

    private String departId;

    private String positional;

    private String sex;

    private Integer age;

    private String tel;

    private Date createTime;
}
