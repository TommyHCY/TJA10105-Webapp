package com.member.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberJDBCDAO implements MemberDAO_Interface {
    //    private static final String INSERT_STMT =
//            "INSERT INTO MEMBER (MEM_NAME, MEM_NICK_NAME, MEM_ACCOUNT, MEM_PASSWORD, MEM_EMAIL, MEM_ADRS, MEM_PHONE, MEM_BIRTHDAY, MEM_STATUS, MEM_TOKEN, MEM_EMAIL_AUTH,CAN_POST, CAN_COMMENT, CAN_USED_PRO,AUTHENTICATED, POINT) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String INSERT_STMT =
            "INSERT INTO MEMBER (MEM_NAME, MEM_NICK_NAME, MEM_ACCOUNT, MEM_PASSWORD, MEM_EMAIL,MEM_ADRS, MEM_PHONE, MEM_BIRTHDAY) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL_STMT =
            "SELECT MEM_NO, MEM_NAME, MEM_NICK_NAME,MEM_ACCOUNT, MEM_PASSWORD, MEM_EMAIL, MEM_ADRS, MEM_PHONE, MEM_BIRTHDAY, MEM_STATUS, MEM_TOKEN, MEM_EMAIL_AUTH,CAN_POST, CAN_COMMENT, CAN_USED_PRO,AUTHENTICATED, POINT FROM member order by MEM_NO";
    private static final String GET_ONE_STMT =
            "SELECT MEM_NO, MEM_NAME, MEM_NICK_NAME,MEM_ACCOUNT, MEM_PASSWORD, MEM_EMAIL, MEM_ADRS, MEM_PHONE, MEM_BIRTHDAY, MEM_STATUS, MEM_TOKEN, MEM_EMAIL_AUTH,CAN_POST, CAN_COMMENT, CAN_USED_PRO,AUTHENTICATED, POINT FROM member where MEM_NO = ?";
    private static final String DELETE =
            "DELETE FROM member where MEM_NO = ?";
    private static final String UPDATE =
            "UPDATE member set MEM_NAME=?, MEM_NICK_NAME=?,MEM_ACCOUNT=?, MEM_PASSWORD=?, MEM_EMAIL=?, MEM_ADRS=?, MEM_PHONE=?, MEM_BIRTHDAY=?, MEM_STATUS=?,MEM_TOKEN=?,MEM_EMAIL_AUTH=?,CAN_POST=?, CAN_COMMENT=?, CAN_USED_PRO=?,AUTHENTICATED=?, POINT=? where MEM_NO = ?";
    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/pixel_tribe?serverTimezone=Asia/Taipei";
    String userid = "root";
    String passwd = "123456";

    public static void main(String[] args) {
        MemberJDBCDAO dao = new MemberJDBCDAO();

//         新增
//        MemberVO memberVO = new MemberVO();
//        memberVO.setMemName("傑尼龜");
//        memberVO.setMemNickName("傑尼傑尼");
//        memberVO.setMemAccount("JannyGua");
//        memberVO.setMemPassword("123456789abc");
//        memberVO.setMemEmail("TJA101GUA@gmail.com");
//        memberVO.setMemAdrs("真新鎮附近500英里的湖");
//        memberVO.setMemPhone("0988888888");
//        memberVO.setMemBirthday(Date.valueOf("2020-01-01"));
//
//        dao.insertMember(memberVO);

//        修改
//        MemberVO memberVO = new MemberVO();
//        memberVO.setMemName("小火龍");
//        memberVO.setMemNickName("龍龍");
//        memberVO.setMemAccount("firedragon");
//        memberVO.setMemPassword("0000000");
//        memberVO.setMemEmail("dragon@TJA101.com.tw");
//        memberVO.setMemAdrs("白銀火山下");
//        memberVO.setMemPhone("01012345678");
//        memberVO.setMemBirthday(Date.valueOf("1990-04-20"));
//        memberVO.setMemStatus('1');
//        memberVO.setMemToken("123456XXXSSS");
//        memberVO.setMemEmailAuth("OK");
//        memberVO.setCanPost(false);
//        memberVO.setCanComment(false);
//        memberVO.setCanUsedPro(true);
//        memberVO.setAuthenticated(false);
//        memberVO.setPoint(100);
//        memberVO.setMemNo(38);
//
//        dao.updateMember(memberVO);

//        刪除
//        dao.deleteMember(39);

//        查詢
//        MemberVO member = dao.findByPrimaryKey(20);
//        System.out.println(member);

//        查全部
//        List<MemberVO> list = dao.getAllMember();
//        for (MemberVO memberVO : list) {
//            System.out.println(memberVO);
//        }

    }

    @Override
    public void insertMember(MemberVO memberVO) {

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setString(1, memberVO.getMemName());
            pstmt.setString(2, memberVO.getMemNickName());
            pstmt.setString(3, memberVO.getMemAccount());
            pstmt.setString(4, memberVO.getMemPassword());
            pstmt.setString(5, memberVO.getMemEmail());
            pstmt.setString(6, memberVO.getMemAdrs());
            pstmt.setString(7, memberVO.getMemPhone());
            pstmt.setDate(8, memberVO.getMemBirthday());

            pstmt.executeUpdate();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver." + e.getMessage());
        } catch (SQLException e) {
            throw new RuntimeException("A database error occured. " + e.getMessage());
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }

    }

    @Override
    public void updateMember(MemberVO memberVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, memberVO.getMemName());
            pstmt.setString(2, memberVO.getMemNickName());
            pstmt.setString(3, memberVO.getMemAccount());
            pstmt.setString(4, memberVO.getMemPassword());
            pstmt.setString(5, memberVO.getMemEmail());
            pstmt.setString(6, memberVO.getMemAdrs());
            pstmt.setString(7, memberVO.getMemPhone());
            pstmt.setDate(8, memberVO.getMemBirthday());
            pstmt.setString(9, memberVO.getMemStatus());
            pstmt.setString(10, memberVO.getMemToken());
            pstmt.setString(11, memberVO.getMemEmailAuth());
            pstmt.setBoolean(12, memberVO.getCanPost());
            pstmt.setBoolean(13, memberVO.getCanComment());
            pstmt.setBoolean(14, memberVO.getCanUsedPro());
            pstmt.setBoolean(15, memberVO.getAuthenticated());
            if (memberVO.getPoint() != null) {
                pstmt.setInt(16, memberVO.getPoint());
            } else {
                pstmt.setNull(16, java.sql.Types.INTEGER);
            }
            pstmt.setInt(17, memberVO.getMemNo());


            pstmt.executeUpdate();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver." + e.getMessage());
        } catch (SQLException e) {
            throw new RuntimeException("A database error occured. " + e.getMessage());
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public void deleteMember(Integer memNo) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, memNo);

            pstmt.executeUpdate();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver." + e.getMessage());
        } catch (SQLException e) {
            throw new RuntimeException("A database error occured. " + e.getMessage());
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public MemberVO findByPrimaryKey(Integer memberNo) {

        MemberVO memberVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, memberNo);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                memberVO = new MemberVO();
                memberVO.setMemNo(rs.getInt("MEM_NO"));
                memberVO.setMemName(rs.getString("MEM_NAME"));
                memberVO.setMemNickName(rs.getString("MEM_NICK_NAME"));
                memberVO.setMemAccount(rs.getString("MEM_ACCOUNT"));
                memberVO.setMemPassword(rs.getString("MEM_PASSWORD"));
                memberVO.setMemEmail(rs.getString("MEM_EMAIL"));
                memberVO.setMemAdrs(rs.getString("MEM_ADRS"));
                memberVO.setMemPhone(rs.getString("MEM_PHONE"));
                memberVO.setMemBirthday(rs.getDate("MEM_BIRTHDAY"));
                memberVO.setMemStatus(rs.getString("MEM_STATUS"));
                memberVO.setMemToken(rs.getString("MEM_TOKEN"));
                memberVO.setMemEmailAuth(rs.getString("MEM_EMAIL_AUTH"));
                memberVO.setCanPost(rs.getBoolean("CAN_POST"));
                memberVO.setCanComment(rs.getBoolean("CAN_COMMENT"));
                memberVO.setCanUsedPro(rs.getBoolean("CAN_USED_PRO"));
                memberVO.setAuthenticated(rs.getBoolean("AUTHENTICATED"));
                memberVO.setPoint(rs.getInt("POINT"));
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());

        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());

        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return memberVO;
    }

    @Override
    public List<MemberVO> getAllMember() {
        List<MemberVO> memberVOList = new ArrayList<MemberVO>();
        MemberVO memberVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                memberVO = new MemberVO();
                memberVO.setMemNo(rs.getInt("MEM_NO"));
                memberVO.setMemName(rs.getString("MEM_NAME"));
                memberVO.setMemNickName(rs.getString("MEM_NICK_NAME"));
                memberVO.setMemAccount(rs.getString("MEM_ACCOUNT"));
                memberVO.setMemPassword(rs.getString("MEM_PASSWORD"));
                memberVO.setMemEmail(rs.getString("MEM_EMAIL"));
                memberVO.setMemAdrs(rs.getString("MEM_ADRS"));
                memberVO.setMemPhone(rs.getString("MEM_PHONE"));
                memberVO.setMemBirthday(rs.getDate("MEM_BIRTHDAY"));
                memberVO.setMemStatus(rs.getString("MEM_STATUS"));
                memberVO.setMemToken(rs.getString("MEM_TOKEN"));
                memberVO.setMemEmailAuth(rs.getString("MEM_EMAIL_AUTH"));
                memberVO.setCanPost(rs.getBoolean("CAN_POST"));
                memberVO.setCanComment(rs.getBoolean("CAN_COMMENT"));
                memberVO.setCanUsedPro(rs.getBoolean("CAN_USED_PRO"));
                memberVO.setAuthenticated(rs.getBoolean("AUTHENTICATED"));
                memberVO.setPoint(rs.getInt("POINT"));
                memberVOList.add(memberVO);
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());

        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());

        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return memberVOList;
    }

}
