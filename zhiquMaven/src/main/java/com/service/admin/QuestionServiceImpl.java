package com.service.admin;

import com.mapper.QuestionMapper;
import com.po.Answer;
import com.po.Page;
import com.po.Question;
import com.service.admin.QuestionService;
import com.service.admin.QuestionServiceImpl;
import com.util.MyUtil;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class QuestionServiceImpl
  implements QuestionService
{
  @Autowired
  private QuestionMapper questionMapper;
  //添加问题
  public String addQuestion(Question question, Model model, HttpSession session) throws Exception {
    question.setUserId(MyUtil.getUserId(session));
    String date = MyUtil.getStringID();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    question.setCreateTime(sdf.parse(date));
    int n = questionMapper.addQuestion(question);
    if (n > 0) {
      session.setAttribute("question", question);
      return "forward:/question/showQuestion";
    } 
    
    model.addAttribute("mes", "添加失败");
    return "before/toQuestion";
  }

//根据问题id查找问题
  public List<Question> selectQues(Question question, Model model, HttpSession session) throws Exception {
    Integer id = MyUtil.getQuesId(session);
    return questionMapper.selectQues(id);
  }



  
  public List<Question> searchQuesList(Page page) {
	  return questionMapper.searchQuesList(page);
	  }



  
  public Integer searchTotalCount(Page page)
  { return this.questionMapper.searchTotalCount(page); 
  }

  //搜索问题
  public List<Question> getQuesBycondtion(Page page) 
  { return this.questionMapper.getQuesBycondtion(page); 
  }
//查找问题及问题下的答案
  public List<Map<String, Object>> queryQandA(Question question, HttpServletRequest request, Answer answer) {
    Answer answer2 = (Answer)request.getAttribute("answer");
    int questionId = answer2.getQuestionId().intValue();
    return questionMapper.queryQandA(Integer.valueOf(questionId));
  }


  public int deleteById(Integer questionId) 
  { return questionMapper.deleteById(questionId); }


  public Integer updateQuesById(Question question) throws Exception
  { return Integer.valueOf(this.questionMapper.updateQuesById(question));
  }
}
