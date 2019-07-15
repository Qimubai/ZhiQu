package com.po;

import com.po.User;
public class User
{
  private Integer userId;
  private String userName;
  private String userPassword;
  private Integer userAge;
  private String userSex;
  private Long questionId;
  private Long answerId;
  
  public Integer getUserId() { return this.userId; }


  
  public void setUserId(Integer userId) { this.userId = userId; }


  
  public String getUserName() { return this.userName; }


  
  public void setUserName(String userName) { this.userName = (userName == null) ? null : userName.trim(); }


  
  public String getUserPassword() { return this.userPassword; }


  
  public void setUserPassword(String userPassword) { this.userPassword = (userPassword == null) ? null : userPassword.trim(); }


  
  public Integer getUserAge() { return this.userAge; }


  
  public void setUserAge(Integer userAge) { this.userAge = userAge; }


  
  public String getUserSex() { return this.userSex; }


  
  public void setUserSex(String userSex) { this.userSex = (userSex == null) ? null : userSex.trim(); }


  
  public Long getQuestionId() { return this.questionId; }


  
  public void setQuestionId(Long questionId) { this.questionId = questionId; }


  
  public Long getAnswerId() { return this.answerId; }


  
  public void setAnswerId(Long answerId) { this.answerId = answerId; }
}