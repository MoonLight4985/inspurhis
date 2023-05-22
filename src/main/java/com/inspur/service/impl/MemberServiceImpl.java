package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.Member;
import com.inspur.mapper.MemberMapper;
import com.inspur.service.MemberService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper membersMapper;

    @Override
    public boolean saveOrUpdateMember(Member member) {
        String membersId = member.getId();
        if (membersId == null || membersId.equals("")) {
            return save(member);
        } else {
            return update(member);
        }
    }

    boolean save(Member members) {
        String id = new DateTime().toString("yyyyMMddHHmmss");
        members.setId(id);
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        members.setCreateTime(simpleDateFormat.format(new Date()));
        return membersMapper.save(members) > 0;
    }

    boolean update(Member members) {
        return membersMapper.update(members) > 0;
    }
    @Override
    public PageInfo<Member> getMemberByCondition(Member member, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Member> membersList = membersMapper.findMemberByCondition(member);
        PageInfo<Member> pageInfo = new PageInfo<>(membersList);
        return pageInfo;
    }

    @Override
    public boolean deleteByMemberId(String id) {
        boolean b = membersMapper.deleteByMemberId(id);
        return b;
    }

    @Override
    public Member findMemberById(String id) {
        Member members = membersMapper.findMemberById(id);
        return members;
    }

    @Override
    public List<Member> getAllMember() {
        return membersMapper.findMemberByCondition(new Member());
    }
}
