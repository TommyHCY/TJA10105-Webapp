package com.report_type.model;

import com.news_com_report.model.NewsComReportVO;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "report_type")
public class ReportTypeVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "RPI_NO", nullable = false)
    private Integer reportNo;

    @Size(max = 255)
    @NotNull
    @Column(name = "RPI_TYPE", nullable = false)
    private String rpiType;

    @OneToMany(mappedBy = "reportType")
    private Set<NewsComReportVO> newsComReports = new LinkedHashSet<>();

    public Set<NewsComReportVO> getNewsComReports() {
        return newsComReports;
    }

    public void setNewsComReports(Set<NewsComReportVO> newsComReports) {
        this.newsComReports = newsComReports;
    }

    public String getRpiType() {
        return rpiType;
    }

    public void setRpiType(String rpiType) {
        this.rpiType = rpiType;
    }

    public Integer getReportNo() {
        return reportNo;
    }

    public void setReportNo(Integer reportNo) {
        this.reportNo = reportNo;
    }

    @Override
    public String toString() {
        return "ReportTypeVO{" +
                "reportNo=" + reportNo +
                ", rpiType='" + rpiType + '\'' +
                ", newsComReports=" + newsComReports +
                '}';
    }
}
