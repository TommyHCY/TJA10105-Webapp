package com.news_category.model;

import com.new_content_classification.model.NewsContentClassificationVO;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name="news_category")
public class NewsCategoryVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "NCAT_NO", nullable = false)
    private Integer newsCategoryNo;

    @Size(max = 50)
    @NotNull
    @Column(name = "NCAT_NAME", nullable = false, length = 50)
    private String ncatName;

    @OneToMany(mappedBy = "ncatNo")
    private Set<NewsContentClassificationVO> newContentClassifications = new LinkedHashSet<>();

    public Set<NewsContentClassificationVO> getNewContentClassifications() {
        return newContentClassifications;
    }

    public void setNewContentClassifications(Set<NewsContentClassificationVO> newContentClassifications) {
        this.newContentClassifications = newContentClassifications;
    }

    public String getNcatName() {
        return ncatName;
    }

    public void setNcatName(String ncatName) {
        this.ncatName = ncatName;
    }

    public Integer getNewsCategoryNo() {
        return newsCategoryNo;
    }

    public void setNewsCategoryNo(Integer newsCategoryNo) {
        this.newsCategoryNo = newsCategoryNo;
    }

    @Override
    public String toString() {
        return "NewsCategoryVO{" +
                "newsCategoryNo=" + newsCategoryNo +
                ", ncatName='" + ncatName + '\'' +
                ", newContentClassifications=" + newContentClassifications +
                '}';
    }
}
