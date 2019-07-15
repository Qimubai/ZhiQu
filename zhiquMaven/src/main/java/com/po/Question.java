package com.po;
import com.po.Answer;
import com.po.Question;
import java.util.Date;
import java.util.List;

public class Question
{
  private Integer questionId;
  private String summary;
  private String askerName;
  private Integer replied;
  private Integer userId;
  private Date createTime;
  private String createUserId;
  private Date updateTime;
  private String updateUserId;
  private Integer deleteIs;
  private Date deleteTime;
  private Integer answerStatus;
  private String questionContent;
  private List<Answer> answers;
  
  public List<Answer> getAnswers() { return this.answers; }


  
  public void setAnswers(List<Answer> answers) { this.answers = answers; }


  
  public Integer getQuestionId() { return this.questionId; }


  
  public void setQuestionId(Integer questionId) { this.questionId = questionId; }


  
  public String getSummary() { return this.summary; }


  
  public void setSummary(String summary) { this.summary = (summary == null) ? null : summary.trim(); }


  
  public String getAskerName() { return this.askerName; }


  
  public void setAskerName(String askerName) { this.askerName = (askerName == null) ? null : askerName.trim(); }


  
  public Integer getReplied() { return this.replied; }


  
  public void setReplied(Integer replied) { this.replied = replied; }




  
  public Integer getUserId() { return this.userId; }


  
  public void setUserId(Integer userId) { this.userId = userId; }



  
  public Date getCreateTime() { return this.createTime; }


  
  public void setCreateTime(Date createTime) { this.createTime = createTime; }


  
  public String getCreateUserId() { return this.createUserId; }


  
  public void setCreateUserId(String createUserId) { this.createUserId = (createUserId == null) ? null : createUserId.trim(); }


  
  public Date getUpdateTime() { return this.updateTime; }


  
  public void setUpdateTime(Date updateTime) { this.updateTime = updateTime; }


  
  public String getUpdateUserId() { return this.updateUserId; }


  
  public void setUpdateUserId(String updateUserId) { this.updateUserId = (updateUserId == null) ? null : updateUserId.trim(); }


  
  public Integer getDeleteIs() { return this.deleteIs; }


  
  public void setDeleteIs(Integer deleteIs) { this.deleteIs = deleteIs; }


  
  public Date getDeleteTime() { return this.deleteTime; }


  
  public void setDeleteTime(Date deleteTime) { this.deleteTime = deleteTime; }


  
  public Integer getAnswerStatus() { return this.answerStatus; }


  
  public void setAnswerStatus(Integer answerStatus) { this.answerStatus = answerStatus; }


  
  public String getQuestionContent() { return this.questionContent; }


  
  public void setQuestionContent(String questionContent) { this.questionContent = (questionContent == null) ? null : questionContent.trim(); }
}