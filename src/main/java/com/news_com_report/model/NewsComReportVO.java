package com.news_com_report.model;

import com.member.model.MemberVO;
import com.news_comment.model.NewsCommentVO;
import com.report_type.model.ReportTypeVO;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import org.hibernate.annotations.ColumnDefault;

import java.sql.Date;

@Entity
@Table(name = "news_com_report")
public class NewsComReportVO {
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "REPORTER")
    private MemberVO reporter;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "NCOM_NO")
    private NewsCommentVO ncomNo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "REPORT_TYPE")
    private ReportTypeVO reportType;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "NEWS_COM_REPORT_NO", nullable = false)
    private Integer newsCommentReportNo;

    @NotNull
    @Column(name = "NEWS_COM_REPORT_STATUS", nullable = false)
    private Integer newsComReportStatus;

    @NotNull
    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "CREATE_TIME", nullable = false)
    private Date createTime;

    @Column(name = "FINISH_TIME")
    private Date finishTime;

    public Date getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getNewsComReportStatus() {
        return newsComReportStatus;
    }

    public void setNewsComReportStatus(Integer newsComReportStatus) {
        this.newsComReportStatus = newsComReportStatus;
    }

    public Integer getNewsCommentReportNo() {
        return newsCommentReportNo;
    }

    public void setNewsCommentReportNo(Integer newsCommentReportNo) {
        this.newsCommentReportNo = newsCommentReportNo;
    }

    public ReportTypeVO getReportType() {
        return reportType;
    }

    public void setReportType(ReportTypeVO reportType) {
        this.reportType = reportType;
    }

    public NewsCommentVO getNcomNo() {
        return ncomNo;
    }

    public void setNcomNo(NewsCommentVO ncomNo) {
        this.ncomNo = ncomNo;
    }

    public MemberVO getReporter() {
        return reporter;
    }

    public void setReporter(MemberVO reporter) {
        this.reporter = reporter;
    }

    @Override
    public String toString() {
        return "NewsComReportVO{" +
                "reporter=" + reporter +
                ", ncomNo=" + ncomNo +
                ", reportType=" + reportType +
                ", newsCommentReportNo=" + newsCommentReportNo +
                ", newsComReportStatus=" + newsComReportStatus +
                ", createTime=" + createTime +
                ", finishTime=" + finishTime +
                '}';
    }
}
