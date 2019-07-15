package com.controller.admin;
import com.controller.admin.AnswerController;
import com.mapper.QuestionMapper;
import com.po.Answer;
import com.service.admin.AnswerService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/answer")
public class AnswerController
{
  @Autowired
  private AnswerService answerService;
  @Autowired
  private QuestionMapper questionMapper;
  
  @RequestMapping("/showQues")
  public String showQues(@RequestParam("questionId") Integer questionId, Model model, HttpServletRequest request) throws Exception {
    List<Map<String, Object>> list = this.questionMapper.queryQandA(questionId);
    model.addAttribute("list", list);
    return "admin/answer";
  }

  @RequestMapping("/addAnswer")
  public String addAnswer(Answer answer, HttpServletRequest request, HttpSession session) throws Exception { return this.answerService.addAnswer(answer, request, session); }
}
