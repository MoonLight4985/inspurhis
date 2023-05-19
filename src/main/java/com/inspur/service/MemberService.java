package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.Member;

public interface MemberService {
    boolean saveOrUpdateMember(Member member);

    PageInfo<Member> getMemberByCondition(Member member, Integer pageNum, Integer pageSize);

    boolean deleteByMemberId(String id);

    Member findMemberById(String id);
}
