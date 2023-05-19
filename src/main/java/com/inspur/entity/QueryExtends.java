package com.inspur.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author：齐文勇
 * @Package：com.inspur.bean
 * @Project：his
 * @name：QueryExtends
 * @Date：2023/5/19 9:29
 * @Filename：QueryExtends
 * 专门用来查询扩展
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class QueryExtends {
    private String name;
    private String password;
    private String role;
    /*private Doctors doctors;
    private Users users;
    private Members members;*/
}
