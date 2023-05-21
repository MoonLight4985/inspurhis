package com.inspur.mapper;

import com.inspur.entity.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MemberMapper {

    @Insert("insert into member (id, name, password, role, realname, credit, sex, age, tel, balance, anaphylaxis, create_time) values (#{id}, #{name}, #{password}, #{role}, #{realname}, #{credit}, #{sex}, #{age}, #{tel}, #{balance}, #{anaphylaxis}, #{createTime})")
    int save(Member members);

    @Update("update member set name = #{name}, credit = #{credit}, tel = #{tel}, balance = #{balance} where id = #{id}")
    int update(Member members);

    List<Member> findMemberByCondition(Member member);

    @Delete("delete from member where id = #{id}")
    boolean deleteByMemberId(String id);

    @Select("select * from member where id = #{id}")
    Member findMemberById(String id);
}
