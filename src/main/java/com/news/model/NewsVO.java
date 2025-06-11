package com.news.model;

import com.member.model.MemberVO;
import com.new_content_classification.model.NewsContentClassificationVO;
import com.news_comment.model.NewsCommentVO;
import com.news_image.model.NewsImagesVO;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.ColumnDefault;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "news")
public class NewsVO {
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MEM_NO")
    private MemberVO memNo;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "NEWS_NO", nullable = false)
    private Integer newsNo;

    @Size(max = 255)
    @NotNull
    @Column(name = "NEWS_TIT", nullable = false)
    private String newsTit;

    @Size(max = 9000)
    @NotNull
    @Column(name = "NEWS_CON", nullable = false, length = 9000)
    private String newsCon;

    @Column(name = "NEWS_UPDATE")
    private Date newsUpdate;

    @NotNull
    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "NEWS_CRDATE", nullable = false)
    private Date newsCrdate;

    @OneToMany(mappedBy = "newsNo")
    private Set<NewsContentClassificationVO> newContentClassifications = new LinkedHashSet<>();

    @OneToMany(mappedBy = "newsNo")
    private Set<NewsCommentVO> newsComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "newsNo")
    private Set<NewsImagesVO> newsImages = new LinkedHashSet<>();

    public Set<NewsImagesVO> getNewsImages() {
        return newsImages;
    }

    public void setNewsImages(Set<NewsImagesVO> newsImages) {
        this.newsImages = newsImages;
    }

    public Set<NewsCommentVO> getNewsComments() {
        return newsComments;
    }

    public void setNewsComments(Set<NewsCommentVO> newsComments) {
        this.newsComments = newsComments;
    }

    public Set<NewsContentClassificationVO> getNewContentClassifications() {
        return newContentClassifications;
    }

    public void setNewContentClassifications(Set<NewsContentClassificationVO> newContentClassifications) {
        this.newContentClassifications = newContentClassifications;
    }

    public Date getNewsCrdate() {
        return newsCrdate;
    }

    public void setNewsCrdate(Date newsCrdate) {
        this.newsCrdate = newsCrdate;
    }

    public Date getNewsUpdate() {
        return newsUpdate;
    }

    public void setNewsUpdate(Date newsUpdate) {
        this.newsUpdate = newsUpdate;
    }

    public String getNewsCon() {
        return newsCon;
    }

    public void setNewsCon(String newsCon) {
        this.newsCon = newsCon;
    }

    public String getNewsTit() {
        return newsTit;
    }

    public void setNewsTit(String newsTit) {
        this.newsTit = newsTit;
    }

    public Integer getNewsNo() {
        return newsNo;
    }

    public void setNewsNo(Integer newsNo) {
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
        return "NewsVO{" +
                "memNo=" + memNo +
                ", newsNo=" + newsNo +
                ", newsTit='" + newsTit + '\'' +
                ", newsCon='" + newsCon + '\'' +
                ", newsUpdate=" + newsUpdate +
                ", newsCrdate=" + newsCrdate +
                ", newContentClassifications=" + newContentClassifications +
                ", newsComments=" + newsComments +
                ", newsImages=" + newsImages +
                '}';
    }
}
