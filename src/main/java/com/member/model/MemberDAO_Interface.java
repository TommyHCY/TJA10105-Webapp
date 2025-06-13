package com.member.model;

import java.util.List;

public interface MemberDAO_Interface {
    public void insertMember(MemberVO memberVO);
    public void updateMember(MemberVO memberVO);
    public void deleteMember(Integer memNo);
    public MemberVO findByPrimaryKey(Integer memberNo);
    public List<MemberVO> getAllMember();
}
