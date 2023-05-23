package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Member;

import java.util.List;

public interface MemberService {
    boolean saveOrUpdateMember(Member member);

    PageInfo<Member> getMemberByCondition(Member member, Integer pageNum, Integer pageSize);

    boolean deleteByMemberId(String id);

    Member findMemberById(String id);

    List<Member> getAllMember();

    void updatePassword(String id, String password);
}
