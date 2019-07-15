package com.service.admin;

import com.mapper.AnswerMapper;
import com.po.Answer;
import com.service.admin.AnswerService;
import com.service.admin.AnswerServiceImpl;
import com.util.MyUtil;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerServiceImpl
  implements AnswerService
{
  @Autowired
  private AnswerMapper answerMapper;
  
  public String addAnswer(Answer answer, HttpServletRequest request, HttpSession session) throws Exception {
    answer.setUserId(MyUtil.getUserId(session));
    String date = MyUtil.getStringID();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    answer.setCreateTime(sdf.parse(date));
    int n = this.answerMapper.addAnswer(answer);
    if (n != 0) {
      request.setAttribute("answer", answer);
      return "forward:/question/showAnswer";
    } 
    return null;
  }
  
  public Integer countAnsw(Integer questionId, HttpSession session) throws Exception {
    Integer questionId1 = MyUtil.getQuesId(session);
    return this.answerMapper.countAnsw(questionId1);
  }
}
