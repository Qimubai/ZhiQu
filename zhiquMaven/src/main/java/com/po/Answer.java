package com.po;

import com.po.Answer;
import java.util.Date;

public class Answer
{
  private Integer answerId;
  private String replyName;
  private Integer questionId;
  private Integer replyOrder;
  private Integer userId;
  private Date createTime;
  private Integer status;
  private String replyContent;
  
  public Integer getAnswerId() { return this.answerId; }

  
  public void setAnswerId(Integer answerId) { this.answerId = answerId; }

  
  public String getReplyName() { return this.replyName; }

  
  public void setReplyName(String replyName) { this.replyName = replyName; }

  
  public Integer getQuestionId() { return this.questionId; }

  
  public void setQuestionId(Integer questionId) { this.questionId = questionId; }

  
  public Integer getReplyOrder() { return this.replyOrder; }

  
  public void setReplyOrder(Integer replyOrder) { this.replyOrder = replyOrder; }

  
  public Integer getUserId() { return this.userId; }

  
  public void setUserId(Integer userId) { this.userId = userId; }

  
  public Date getCreateTime() { return this.createTime; }

  
  public void setCreateTime(Date createTime) { this.createTime = createTime; }

  
  public Integer getStatus() { return this.status; }

  
  public void setStatus(Integer status) { this.status = status; }

  
  public String getReplyContent() { return this.replyContent; }

  
  public void setReplyContent(String replyContent) { this.replyContent = replyContent; }
}