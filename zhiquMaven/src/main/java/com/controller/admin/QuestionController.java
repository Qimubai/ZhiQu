package com.controller.admin;
import com.controller.admin.QuestionController;
import com.mapper.QuestionMapper;
import com.po.Answer;
import com.po.Page;
import com.po.Question;
import com.service.admin.AnswerService;
import com.service.admin.QuestionService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/question")
public class QuestionController
{
  @Autowired
  private QuestionService questionService;
  @Autowired
  private QuestionMapper questionMapper;
  @Autowired
  private AnswerService answerService;
  //根据问题标题查询问题
  @RequestMapping("/queryQues")
  public String queryQues(Model model, Page page, HttpSession session, Integer questionId) throws Exception {
    List<Question> list = this.questionService.getQuesBycondtion(page);
    model.addAttribute("Invlist", list);  
    return "before/home";
  }
   
  //初始化问题提交页面
  @RequestMapping("/toQuestion")
  public String toQuestion(Model model) { 
	  return "before/toQuestion"; }

  //添加问题
  @RequestMapping("addQuestion")
  public String addQuestion(@ModelAttribute Question question, Model model, HttpSession session) throws Exception
  { return this.questionService.addQuestion(question, model, session); }
  
  //展示问题（提交问题后的问题详情页面）
  @RequestMapping("/showQuestion")
  public String showQuestion(@ModelAttribute Question question, Model model, HttpSession session) throws Exception {
    List<Question> list = this.questionService.selectQues(question, model, session);
    model.addAttribute("list", list);
    return "admin/quesDetails";
  }
 
  //首页分页展示所有问题
  @RequestMapping("/showAll")
  public String searchQuesList(Page page, HttpServletRequest request) throws Exception {
    Page p = page;
    int pageSize = 10;
    p.setPageSize(pageSize);
    int curPage = p.getCurrentPage();
    
    if (curPage == 0) {
      curPage = 1;
      p.setCurrentPage(curPage);
    } 
    int startRow = page.getStartRow();
    
    if (p.getCurrentPage() != 0) {
      startRow = getStartRowBycurrentPage(curPage, pageSize);
    }
    
    p.setStartRow(startRow);
    
    String queryCondition = null;
    if (page.getQueryCondition() != null) {
      queryCondition = page.getQueryCondition();
    }
    List<Question> Invlist = getInvListByCondition(page);
    
    Integer totalCounts = this.questionService.searchTotalCount(page);
    
    int totalPages = (totalCounts.intValue() % pageSize == 0) ? (totalCounts.intValue() / pageSize) : (totalCounts.intValue() / pageSize + 1);
    
    p.setTotalPage(totalPages);
    
    page.setTotalRows(totalCounts.intValue());
    
    request.setAttribute("Invlist", Invlist);
    
    request.setAttribute("page", page);
    
    return "before/home";
  }
  
  private List<Question> getInvListByCondition(Page page) {
	  List<Question> InvList =null;
    
    if (page.getQueryCondition() == null)
    { InvList = questionService.searchQuesList(page);
    
    return InvList;
    }
    InvList = questionService.getQuesBycondtion(page);
    return InvList;
  }

  public int getStartRowBycurrentPage(int currentPage, int pageSize) {
	   int startRow=0;
       
       if (currentPage==1) {
           
           return startRow=0;
       }      
       startRow=(currentPage-1)*pageSize;
       
       return startRow;       
  }
 
  //展示问题加答案
  @RequestMapping("/showAnswer")
  public String show(Question question, HttpServletRequest request, Model model, Answer answer) {
    List<Map<String, Object>> list = this.questionService.queryQandA(question, request, answer);
    model.addAttribute("list", list);
    return "admin/answer";
  }
  //删除问题
  @RequestMapping("/deleteQues")
  public String deleteQues(@RequestParam("questionId") Integer questionId, Model model) {
    int flag = this.questionService.deleteById(questionId);
    if (flag > 0) {
      model.addAttribute("msg", "删除成功！");
      return "before/toQuestion";
    } 
    return "";
  }

  
  @RequestMapping("/deleteQues2")
  public String deleteQues2(@RequestParam("questionId") Integer questionId, Model model) {
    int flag = this.questionService.deleteById(questionId);
    if (flag > 0) {
      model.addAttribute("msg", "删除成功！");
      return "forward:/user/selectUser";
    } 
    return "";
  }


  //修改问题
  @RequestMapping("/updateQues")
  public String updateQues(Question question, Model model) throws Exception {
    Integer n = this.questionService.updateQuesById(question);
    if (n.intValue() > 0) {
      
      model.addAttribute("question", question);
      return "forward:/question/showQuestion";
    }    
    model.addAttribute("msg", "修改失败！");
    return "admin/quesDetails";
  }
}