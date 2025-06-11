package com.news_comment.model;

import com.member.model.MemberVO;
import com.news.model.NewsVO;
import com.news_com_report.model.NewsComReportVO;
import com.news_like.model.NewsLikeVO;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.ColumnDefault;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "news_comments")
public class NewsCommentVO {
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MEM_NO")
    private MemberVO memNo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "NEWS_NO")
    private NewsVO newsNo;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "NCOM_NO", nullable = false)
    private Integer newsCommentNo;

    @Size(max = 255)
    @NotNull
    @Column(name = "NCOM_CON", nullable = false)
    private String ncomCon;

    @NotNull
    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "NCOM_CRE", nullable = false)
    private Date ncomCre;

    @NotNull
    @ColumnDefault("'0'")
    @Column(name = "NCOM_STATUS", nullable = false)
    private Character ncomStatus;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "NCOM_LIKE_LC", nullable = false)
    private Integer ncomLikeLc;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "NCOM_LIKE_DLC", nullable = false)
    private Integer ncomLikeDlc;

    @OneToMany(mappedBy = "ncomNo")
    private Set<NewsComReportVO> newsComReports = new LinkedHashSet<>();

    @OneToMany(mappedBy = "ncomNo")
    private Set<NewsLikeVO> newsLikes = new LinkedHashSet<>();

    public Set<NewsLikeVO> getNewsLikes() {
        return newsLikes;
    }

    public void setNewsLikes(Set<NewsLikeVO> newsLikes) {
        this.newsLikes = newsLikes;
    }

    public Set<NewsComReportVO> getNewsComReports() {
        return newsComReports;
    }

    public void setNewsComReports(Set<NewsComReportVO> newsComReports) {
        this.newsComReports = newsComReports;
    }

    public Integer getNcomLikeDlc() {
        return ncomLikeDlc;
    }

    public void setNcomLikeDlc(Integer ncomLikeDlc) {
        this.ncomLikeDlc = ncomLikeDlc;
    }

    public Integer getNcomLikeLc() {
        return ncomLikeLc;
    }

    public void setNcomLikeLc(Integer ncomLikeLc) {
        this.ncomLikeLc = ncomLikeLc;
    }

    public Character getNcomStatus() {
        return ncomStatus;
    }

    public void setNcomStatus(Character ncomStatus) {
        this.ncomStatus = ncomStatus;
    }

    public Date getNcomCre() {
        return ncomCre;
    }

    public void setNcomCre(Date ncomCre) {
        this.ncomCre = ncomCre;
    }

    public String getNcomCon() {
        return ncomCon;
    }

    public void setNcomCon(String ncomCon) {
        this.ncomCon = ncomCon;
    }

    public Integer getNewsCommentNo() {
        return newsCommentNo;
    }

    public void setNewsCommentNo(Integer newsCommentNo) {
        this.newsCommentNo = newsCommentNo;
    }

    public NewsVO getNewsNo() {
        return newsNo;
    }

    public void setNewsNo(NewsVO newsNo) {
        this.newsNo = newsNo;
    }

    public MemberVO getMemNo() {
        return memNo;
    }

    public void setMemNo(MemberVO memNo) {
        this.memNo = memNo;
    }

    @Override
    public String toString() {
        return "NewsCommentVO{" +
                "memNo=" + memNo +
                ", newsNo=" + newsNo +
                ", newsCommentNo=" + newsCommentNo +
                ", ncomCon='" + ncomCon + '\'' +
                ", ncomCre=" + ncomCre +
                ", ncomStatus=" + ncomStatus +
                ", ncomLikeLc=" + ncomLikeLc +
                ", ncomLikeDlc=" + ncomLikeDlc +
                ", newsComReports=" + newsComReports +
                ", newsLikes=" + newsLikes +
                '}';
    }
}
