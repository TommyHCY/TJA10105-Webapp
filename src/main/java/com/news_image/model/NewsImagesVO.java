package com.news_image.model;

import com.news.model.NewsVO;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.Arrays;

@Entity
@Table(name = "news_image")
public class NewsImagesVO {
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "NEWS_NO")
    private NewsVO newsNo;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IMG_NO", nullable = false)
    private Integer imgNo;

    @Column(name = "IMG_DATA")
    private byte[] imgData;

    @Size(max = 100)
    @NotNull
    @Column(name = "IMG_TYPE", nullable = false, length = 100)
    private String imgType;

    public String getImgType() {
        return imgType;
    }

    public void setImgType(String imgType) {
        this.imgType = imgType;
    }

    public byte[] getImgData() {
        return imgData;
    }

    public void setImgData(byte[] imgData) {
        this.imgData = imgData;
    }

    public Integer getImgNo() {
        return imgNo;
    }

    public void setImgNo(Integer imgNo) {
        this.imgNo = imgNo;
    }

    public NewsVO getNewsNo() {
        return newsNo;
    }

    public void setNewsNo(NewsVO newsNo) {
        this.newsNo = newsNo;
    }

    @Override
    public String toString() {
        return "NewsImagesVO{" +
                "newsNo=" + newsNo +
                ", imgNo=" + imgNo +
                ", imgData=" + Arrays.toString(imgData) +
                ", imgType='" + imgType + '\'' +
                '}';
    }
}
