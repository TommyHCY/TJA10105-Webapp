package com.member.model;

import com.news.model.NewsVO;
import com.news_com_report.model.NewsComReportVO;
import com.news_comment.model.NewsCommentVO;
import com.news_like.model.NewsLikeVO;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.ColumnDefault;


import java.sql.Date;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "member")
public class MemberVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MEM_NO", nullable = false)
    private Integer memNo;

    @Size(max = 50)
    @NotNull
    @Column(name = "MEM_NAME", nullable = false, length = 50)
    private String memName;

    @Size(max = 50)
    @NotNull
    @Column(name = "MEM_NICK_NAME", nullable = false, length = 50)
    private String memNickName;

    @Size(max = 50)
    @NotNull
    @Column(name = "MEM_ACCOUNT", nullable = false, length = 50)
    private String memAccount;

    @Size(max = 50)
    @NotNull
    @Column(name = "MEM_PASSWORD", nullable = false, length = 50)
    private String memPassword;

    @Size(max = 100)
    @NotNull
    @Column(name = "MEM_EMAIL", nullable = false, length = 100)
    private String memEmail;

    @Column(name = "MEM_ICON_DATA")
    private byte[] memIconData;

    @Size(max = 100)
    @NotNull
    @Column(name = "MEM_ADRS", nullable = false, length = 100)
    private String memAdrs;

    @Size(max = 50)
    @NotNull
    @Column(name = "MEM_PHONE", nullable = false, length = 50)
    private String memPhone;

    @NotNull
    @Column(name = "MEM_BIRTHDAY", nullable = false)
    private Date memBirthday;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "MEM_CREATE")
    private Timestamp memCreate;

    @Column(name = "MEM_UPDATE")
    private Timestamp memUpdate;

    @NotNull
    @ColumnDefault("'0'")
    @Column(name = "MEM_STATUS", nullable = false)
    private Character memStatus;

    @Size(max = 50)
    @Column(name = "MEM_TOKEN", length = 50)
    private String memToken;

    @Size(max = 50)
    @Column(name = "MEM_EMAIL_AUTH", length = 50)
    private String memEmailAuth;

    @NotNull
    @ColumnDefault("1")
    @Column(name = "CAN_POST", nullable = false)
    private Boolean canPost = false;

    @NotNull
    @ColumnDefault("1")
    @Column(name = "CAN_COMMENT", nullable = false)
    private Boolean canComment = false;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "CAN_USED_PRO", nullable = false)
    private Boolean canUsedPro = false;

    @NotNull
    @ColumnDefault("1")
    @Column(name = "AUTHENTICATED", nullable = false)
    private Boolean authenticated = false;

    @ColumnDefault("0")
    @Column(name = "POINT")
    private Integer point;

    @OneToMany(mappedBy = "memNo")
    private Set<NewsVO> news = new LinkedHashSet<>();

    @OneToMany(mappedBy = "reporter")
    private Set<NewsComReportVO> newsComReports = new LinkedHashSet<>();

    @OneToMany(mappedBy = "memNo")
    private Set<NewsCommentVO> newsComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "memNo")
    private Set<NewsLikeVO> newsLikes = new LinkedHashSet<>();

    public Set<NewsLikeVO> getNewsLikes() {
        return newsLikes;
    }

    public void setNewsLikes(Set<NewsLikeVO> newsLikes) {
        this.newsLikes = newsLikes;
    }

    public Set<NewsCommentVO> getNewsComments() {
        return newsComments;
    }

    public void setNewsComments(Set<NewsCommentVO> newsComments) {
        this.newsComments = newsComments;
    }

    public Set<NewsComReportVO> getNewsComReports() {
        return newsComReports;
    }

    public void setNewsComReports(Set<NewsComReportVO> newsComReports) {
        this.newsComReports = newsComReports;
    }

    public Set<NewsVO> getNews() {
        return news;
    }

    public void setNews(Set<NewsVO> news) {
        this.news = news;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Boolean getAuthenticated() {
        return authenticated;
    }

    public void setAuthenticated(Boolean authenticated) {
        this.authenticated = authenticated;
    }

    public Boolean getCanUsedPro() {
        return canUsedPro;
    }

    public void setCanUsedPro(Boolean canUsedPro) {
        this.canUsedPro = canUsedPro;
    }

    public Boolean getCanComment() {
        return canComment;
    }

    public void setCanComment(Boolean canComment) {
        this.canComment = canComment;
    }

    public Boolean getCanPost() {
        return canPost;
    }

    public void setCanPost(Boolean canPost) {
        this.canPost = canPost;
    }

    public String getMemEmailAuth() {
        return memEmailAuth;
    }

    public void setMemEmailAuth(String memEmailAuth) {
        this.memEmailAuth = memEmailAuth;
    }

    public String getMemToken() {
        return memToken;
    }

    public void setMemToken(String memToken) {
        this.memToken = memToken;
    }

    public Character getMemStatus() {
        return memStatus;
    }

    public void setMemStatus(Character memStatus) {
        this.memStatus = memStatus;
    }

    public Timestamp getMemUpdate() {
        return memUpdate;
    }

    public void setMemUpdate(Timestamp memUpdate) {
        this.memUpdate = memUpdate;
    }

    public Timestamp getMemCreate() {
        return memCreate;
    }

    public void setMemCreate(Timestamp memCreate) {
        this.memCreate = memCreate;
    }

    public Date getMemBirthday() {
        return memBirthday;
    }

    public void setMemBirthday(Date memBirthday) {
        this.memBirthday = memBirthday;
    }

    public String getMemPhone() {
        return memPhone;
    }

    public void setMemPhone(String memPhone) {
        this.memPhone = memPhone;
    }

    public String getMemAdrs() {
        return memAdrs;
    }

    public void setMemAdrs(String memAdrs) {
        this.memAdrs = memAdrs;
    }

    public byte[] getMemIconData() {
        return memIconData;
    }

    public void setMemIconData(byte[] memIconData) {
        this.memIconData = memIconData;
    }

    public String getMemEmail() {
        return memEmail;
    }

    public void setMemEmail(String memEmail) {
        this.memEmail = memEmail;
    }

    public String getMemPassword() {
        return memPassword;
    }

    public void setMemPassword(String memPassword) {
        this.memPassword = memPassword;
    }

    public String getMemAccount() {
        return memAccount;
    }

    public void setMemAccount(String memAccount) {
        this.memAccount = memAccount;
    }

    public String getMemNickName() {
        return memNickName;
    }

    public void setMemNickName(String memNickName) {
        this.memNickName = memNickName;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public Integer getMemNo() {
        return memNo;
    }

    public void setMemNo(Integer memNo) {
        this.memNo = memNo;
    }

    @Override
    public String toString() {
        return "MemberVO{" +
                "memNo=" + memNo +
                ", memName='" + memName + '\'' +
                ", memNickName='" + memNickName + '\'' +
                ", memAccount='" + memAccount + '\'' +
                ", memPassword='" + memPassword + '\'' +
                ", memEmail='" + memEmail + '\'' +
//                ", memIconData=" + Arrays.toString(memIconData) +
                ", memAdrs='" + memAdrs + '\'' +
                ", memPhone='" + memPhone + '\'' +
                ", memBirthday=" + memBirthday +
                ", memCreate=" + memCreate +
                ", memUpdate=" + memUpdate +
                ", memStatus=" + memStatus +
                ", memToken='" + memToken + '\'' +
                ", memEmailAuth='" + memEmailAuth + '\'' +
                ", canPost=" + canPost +
                ", canComment=" + canComment +
                ", canUsedPro=" + canUsedPro +
                ", authenticated=" + authenticated +
                ", point=" + point +
                ", news=" + news +
                ", newsComReports=" + newsComReports +
                ", newsComments=" + newsComments +
                ", newsLikes=" + newsLikes +
                '}';
    }
}
