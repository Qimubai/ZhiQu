package com.service.admin;
import com.po.Answer;
import com.po.Page;
import com.po.Question;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;

public interface QuestionService {
	public String addQuestion(Question paramQuestion, Model paramModel, HttpSession paramHttpSession) throws Exception;
  
	public List<Question> selectQues(Question paramQuestion, Model paramModel, HttpSession paramHttpSession) throws Exception;
  
	public List<Question> searchQuesList(Page paramPage);
  //À—À˜Œ Ã‚
	public List<Question> getQuesBycondtion(Page paramPage);
  
	public  Integer searchTotalCount(Page paramPage);
  
	public List<Map<String, Object>> queryQandA(Question paramQuestion, HttpServletRequest paramHttpServletRequest, Answer paramAnswer);
  
	public int deleteById(Integer paramInteger);
  
	public Integer updateQuesById(Question paramQuestion) throws Exception;
}
