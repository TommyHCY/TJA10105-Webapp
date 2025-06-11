package com.news_like.model;

import com.member.model.MemberVO;
import com.news_comment.model.NewsCommentVO;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;

@Entity
@Table(name = "news_like")
public class NewsLikeVO {
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MEM_NO")
    private MemberVO memNo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "NCOM_NO")
    private NewsCommentVO ncomNo;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "NLIKE_NO", nullable = false)
    private Integer newsLikeNo;

    @NotNull
    @Column(name = "NLIKE_STATUS", nullable = false)
    private Character nlikeStatus;

    @NotNull
    @Column(name = "NLIKE_UPDATE", nullable = false)
    private Instant nlikeUpdate;

    @NotNull
    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "NLIKE_CRDATE", nullable = false)
    private Instant nlikeCrdate;

    public Instant getNlikeCrdate() {
        return nlikeCrdate;
    }

    public void setNlikeCrdate(Instant nlikeCrdate) {
        this.nlikeCrdate = nlikeCrdate;
    }

    public Instant getNlikeUpdate() {
        return nlikeUpdate;
    }

    public void setNlikeUpdate(Instant nlikeUpdate) {
        this.nlikeUpdate = nlikeUpdate;
    }

    public Character getNlikeStatus() {
        return nlikeStatus;
    }

    public void setNlikeStatus(Character nlikeStatus) {
        this.nlikeStatus = nlikeStatus;
    }

    public Integer getNewsLikeNo() {
        return newsLikeNo;
    }

    public void setNewsLikeNo(Integer newsLikeNo) {
        this.newsLikeNo = newsLikeNo;
    }

    public NewsCommentVO getNcomNo() {
        return ncomNo;
    }

    public void setNcomNo(NewsCommentVO ncomNo) {
        this.ncomNo = ncomNo;
    }

    public MemberVO getMemNo() {
        return memNo;
    }

    public void setMemNo(MemberVO memNo) {
        this.memNo = memNo;
    }

    @Override
    public String toString() {
        return "NewsLikeVO{" +
                "memNo=" + memNo +
                ", ncomNo=" + ncomNo +
                ", newsLikeNo=" + newsLikeNo +
                ", nlikeStatus=" + nlikeStatus +
                ", nlikeUpdate=" + nlikeUpdate +
                ", nlikeCrdate=" + nlikeCrdate +
                '}';
    }
}
