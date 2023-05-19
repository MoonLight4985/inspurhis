package com.inspur.mapper;

import com.inspur.entity.Member;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MemberMapper {

    int save(Member members);

    int update(Member members);

    List<Member> findMemberByCondition(Member member);

    @Delete("delete from member where id = #{id}")
    boolean deleteByMemberId(String id);

    @Select("select * from member where id = #{id}")
    Member findMemberById(String id);
}
