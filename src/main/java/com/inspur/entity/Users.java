package com.inspur.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Users {
    private String id;

    private String username;

    private String password;

    private Integer role;

    private String realname;

    private String tel;

    private Integer age;

    private String sex;

    private String address;

    private Date createTime;

    private Date updateTime;
}
