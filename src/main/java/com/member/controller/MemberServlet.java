package com.member.controller;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

public class MemberServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("getOne_For_Display".equals(action)) {

            List<String> errMsgs = new LinkedList<String>();

            req.setAttribute("errMsgs", errMsgs);

            String str = req.getParameter("memberNo");
            if (str == null || (str.trim()).length() == 0) {
                errMsgs.add("輸入會員編號");
            }

            if (!errMsgs.isEmpty()) {
                RequestDispatcher failureView = req.getRequestDispatcher("/member/select_page.jsp");
                failureView.forward(req, res);
                return;
            }

            Integer memberNo = null;
            try {
                memberNo = Integer.valueOf(str);
            } catch (Exception e) {
                errMsgs.add("會員編號格式不正確");
            }

            if (!errMsgs.isEmpty()) {
                RequestDispatcher failureView = req.getRequestDispatcher("/member/select_page.jsp");
                failureView.forward(req, res);
                return;
            }

            MemberService memSvr = new MemberService();
            MemberVO memberVO = memSvr.getOneMem(memberNo);
            if (memberVO == null) {
                errMsgs.add("沒有資料");
            }

            if (!errMsgs.isEmpty()) {
                RequestDispatcher failureView = req.getRequestDispatcher("/member/select_page.jsp");
                failureView.forward(req, res);
                return;
            }

            req.setAttribute("memberVO", memberVO);
            String url = "/member/listOneMem.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);

        }

        if ("getOne_For_Update".equals(action)) {
            List<String> errMsgs = new LinkedList<String>();
            req.setAttribute("errMsgs", errMsgs);

            Integer memberNo = Integer.valueOf(req.getParameter("memberNo"));

            MemberService ememSvr = new MemberService();
            MemberVO memberVO = ememSvr.getOneMem(memberNo);

            req.setAttribute("memberVO", memberVO);
            String url = "/member/update_mem_input.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("update".equals(action)) {
            List<String> errMsgs = new LinkedList<String>();
            req.setAttribute("errMsgs", errMsgs);

            Integer memNo = Integer.valueOf(req.getParameter("memberNo"));
            String memName = req.getParameter("name");
            String memNameReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,10}$";

            if (memName == null || memName.trim().length() == 0) {
                errMsgs.add("員工姓名: 請勿空白");
            } else if (!memName.trim().matches(memNameReg)) { //以下練習正則(規)表示式(regular-expression)
                errMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
            }

            String memNickName = req.getParameter("nickname").trim();
            if (memNickName == null || memNickName.trim().length() == 0) {
                errMsgs.add("暱稱不要空白");
            }

            String memAccount = req.getParameter("account").trim();
            if (memAccount == null || memAccount.trim().length() == 0) {
                errMsgs.add("帳號不要空白");
            }

            String memPassword = req.getParameter("password").trim();
            if (memPassword == null || memPassword.trim().length() == 0) {
                errMsgs.add("密碼不要空白");
            }

            String memEmail = req.getParameter("email").trim();
            if (memEmail == null || memEmail.trim().length() == 0) {
                errMsgs.add("email不要空白");
            }

            String memAddress = req.getParameter("address").trim();
            if (memAddress == null || memAddress.trim().length() == 0) {
                errMsgs.add("地址不要空白");
            }

            String memPhone = req.getParameter("phone").trim();
            if (memPhone == null || memPhone.trim().length() == 0) {
                errMsgs.add("電話不要空白");
            }

            Date memBirthday = null;
            try {
                memBirthday = Date.valueOf(req.getParameter("birthday"));
            } catch (Exception e) {
                memBirthday = new Date(System.currentTimeMillis());
                errMsgs.add("輸入日期");
            }

            String memStatus = req.getParameter("status").trim();
            if (memStatus == null || memStatus.trim().length() == 0) {
                errMsgs.add("狀態不可空白");
            }

            String memToken = req.getParameter("token").trim();
            if (memToken == null || memToken.trim().length() == 0) {
                errMsgs.add("Token不可空白");
            }

            String memEmailAuth = req.getParameter("emailAuth").trim();
            if (memEmailAuth == null || memEmailAuth.trim().length() == 0) {
                errMsgs.add("EmailAuth不可空白");
            }

            Boolean memPost = Boolean.valueOf(req.getParameter("post").trim());

            Boolean memComment = Boolean.valueOf(req.getParameter("comment").trim());

            Boolean memUsedProd = Boolean.valueOf(req.getParameter("usedProd").trim());

            Boolean memAuth = Boolean.valueOf(req.getParameter("auth"));

            Integer point = Integer.valueOf(req.getParameter("point").trim());

            MemberVO memberVO = new MemberVO();
            memberVO.setMemNo(memNo);
            memberVO.setMemName(memName);
            memberVO.setMemNickName(memNickName);
            memberVO.setMemAccount(memAccount);
            memberVO.setMemPassword(memPassword);
            memberVO.setMemEmail(memEmail);
            memberVO.setMemAdrs(memAddress);
            memberVO.setMemPhone(memPhone);
            memberVO.setMemBirthday(memBirthday);
            memberVO.setMemStatus(memStatus);
            memberVO.setMemToken(memToken);
            memberVO.setMemEmailAuth(memEmailAuth);
            memberVO.setCanPost(memPost);
            memberVO.setCanComment(memComment);
            memberVO.setCanUsedPro(memUsedProd);
            memberVO.setAuthenticated(memAuth);
            memberVO.setPoint(point);

            if (!errMsgs.isEmpty()) {
                req.setAttribute("memberVO", memberVO);
                RequestDispatcher failureView = req.getRequestDispatcher("/member/update_mem_input.jsp");
                failureView.forward(req, res);
                return;
            }

            MemberService memberService = new MemberService();
            memberVO = memberService.updateMember(memNo, memName, memNickName, memAccount, memPassword, memEmail, memAddress, memPhone, memBirthday, memStatus, memToken, memEmailAuth, memPost, memComment, memUsedProd, memAuth, point);

            req.setAttribute("memberVO", memberVO);
            String url = "/member/listOneMem.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("insert".equals(action)) {
            List<String> errMsgs = new LinkedList<String>();

            req.setAttribute("errMsgs", errMsgs);
            String memName = req.getParameter("name");
            String memNameReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,10}$";

            if (memName == null || memName.trim().length() == 0) {
                errMsgs.add("員工姓名: 請勿空白");
            } else if (!memName.trim().matches(memNameReg)) { //以下練習正則(規)表示式(regular-expression)
                errMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
            }

            String memNickName = req.getParameter("nickname").trim();
            if (memNickName == null || memNickName.trim().length() == 0) {
                errMsgs.add("暱稱不要空白");
            }

            String memAccount = req.getParameter("account").trim();
            if (memAccount == null || memAccount.trim().length() == 0) {
                errMsgs.add("帳號不要空白");
            }

            String memPassword = req.getParameter("password").trim();
            if (memPassword == null || memPassword.trim().length() == 0) {
                errMsgs.add("密碼不要空白");
            }

            String memEmail = req.getParameter("email").trim();
            if (memEmail == null || memEmail.trim().length() == 0) {
                errMsgs.add("email不要空白");
            }

            String memAddress = req.getParameter("address").trim();
            if (memAddress == null || memAddress.trim().length() == 0) {
                errMsgs.add("地址不要空白");
            }

            String memPhone = req.getParameter("phone").trim();
            if (memPhone == null || memPhone.trim().length() == 0) {
                errMsgs.add("電話不要空白");
            }

            Date memBirthday = null;
            try {
                memBirthday = Date.valueOf(req.getParameter("birthday"));
            } catch (Exception e) {
                memBirthday = new Date(System.currentTimeMillis());
                errMsgs.add("輸入日期");
            }

            MemberVO memberVO = new MemberVO();

            memberVO.setMemName(memName);
            memberVO.setMemNickName(memNickName);
            memberVO.setMemAccount(memAccount);
            memberVO.setMemPassword(memPassword);
            memberVO.setMemEmail(memEmail);
            memberVO.setMemAdrs(memAddress);
            memberVO.setMemPhone(memPhone);
            memberVO.setMemBirthday(memBirthday);

            if (!errMsgs.isEmpty()) {
                req.setAttribute("memberVO", memberVO);
                RequestDispatcher failureView = req.getRequestDispatcher("/member/update_mem_input.jsp");
                failureView.forward(req, res);
                return;
            }

            MemberService memberService = new MemberService();
            memberVO = memberService.addMember(memName,memNickName,memAccount,memPassword,memEmail,memAddress,memPhone,memBirthday);

            String url = "/member/listAllMem.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("delete".equals(action)) {

            List<String> errMsgs = new LinkedList<>();

            req.setAttribute("errMsgs", errMsgs);

            Integer memNo = Integer.valueOf(req.getParameter("memNo"));

            MemberService memberService = new MemberService();
            memberService.deleteMem(memNo);

            String url = "/member/listAllMem.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

    }


}
