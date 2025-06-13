package com.member.model;

public class MemberService {

    private MemberDAO_Interface dao;
    public MemberService() {
        dao = new MemberJDBCDAO();
    }
    public void insertMember(MemberVO memberVO) {

        MemberVO memberVO1 = new MemberVO();


    }
}
