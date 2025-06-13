package com.member.model;

import java.sql.Date;
import java.util.List;

public class MemberService {

    private MemberDAO_Interface dao;

    public MemberService() {
        dao = new MemberJDBCDAO();
    }

    public MemberVO addMember(String name, String nickName, String account, String password, String email, String address, String phone, Date birthday) {

        MemberVO memberVO = new MemberVO();
        memberVO.setMemName(name);
        memberVO.setMemNickName(nickName);
        memberVO.setMemAccount(account);
        memberVO.setMemPassword(password);
        memberVO.setMemEmail(email);
        memberVO.setMemAdrs(address);
        memberVO.setMemPhone(phone);
        memberVO.setMemBirthday(birthday);

        dao.insertMember(memberVO);

        return memberVO;
    }

    public MemberVO updateMember(Integer memNo, String name, String nickName, String account, String password, String email, String address, String phone, Date birthday, String status, String token, String emailAuth, Boolean post, Boolean comment, Boolean usedProd, Boolean authenticated, Integer point) {

        MemberVO memberVO = new MemberVO();
        memberVO.setMemNo(memNo);
        memberVO.setMemName(name);
        memberVO.setMemNickName(nickName);
        memberVO.setMemAccount(account);
        memberVO.setMemPassword(password);
        memberVO.setMemEmail(email);
        memberVO.setMemAdrs(address);
        memberVO.setMemPhone(phone);
        memberVO.setMemBirthday(birthday);
        memberVO.setMemStatus(status);
        memberVO.setMemToken(token);
        memberVO.setMemEmailAuth(emailAuth);
        memberVO.setCanPost(post);
        memberVO.setCanComment(comment);
        memberVO.setCanUsedPro(usedProd);
        memberVO.setAuthenticated(authenticated);
        memberVO.setPoint(point);

        dao.updateMember(memberVO);

        return memberVO;
    }

    public void deleteMem(Integer memNo) {
        dao.deleteMember(memNo);
    }

    public MemberVO getOneMem(Integer memNo) {
        return dao.findByPrimaryKey(memNo);
    }

    public List<MemberVO> getAll() {
        return dao.getAllMember();
    }
}
