package com.service.admin;
import com.po.Answer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface AnswerService {
	public String addAnswer(Answer paramAnswer, HttpServletRequest paramHttpServletRequest, HttpSession paramHttpSession) throws Exception;
  
	public Integer countAnsw(Integer paramInteger, HttpSession paramHttpSession) throws Exception;
}
