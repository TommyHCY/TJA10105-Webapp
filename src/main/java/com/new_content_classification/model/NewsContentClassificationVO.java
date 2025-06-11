package com.new_content_classification.model;

import com.news.model.NewsVO;
import com.news_category.model.NewsCategoryVO;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "new_content_classification")
public class NewsContentClassificationVO {
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "NCAT_NO")
    private NewsCategoryVO ncatNo;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "NCC_NO", nullable = false)
    private Integer newsContentClassificationNo;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "NEWS_NO", nullable = false)
    private NewsVO newsNo;

    public NewsVO getNewsNo() {
        return newsNo;
    }

    public void setNewsNo(NewsVO newsNo) {
        this.newsNo = newsNo;
    }

    public Integer getNewsContentClassificationNo() {
        return newsContentClassificationNo;
    }

    public void setNewsContentClassificationNo(Integer newsContentClassificationNo) {
        this.newsContentClassificationNo = newsContentClassificationNo;
    }

    public NewsCategoryVO getNcatNo() {
        return ncatNo;
    }

    public void setNcatNo(NewsCategoryVO ncatNo) {
        this.ncatNo = ncatNo;
    }

    @Override
    public String toString() {
        return "NewsContentClassificationVO{" +
                "ncatNo=" + ncatNo +
                ", newsContentClassificationNo=" + newsContentClassificationNo +
                ", newsNo=" + newsNo +
                '}';
    }
}
