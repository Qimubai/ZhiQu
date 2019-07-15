package com.controller.admin;
import com.controller.admin.AdminController;
import com.mapper.UserMapper;
import com.po.Page;
import com.po.Question;
import com.service.admin.QuestionService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
@RequestMapping("/admin")
public class AdminController
{
  @Autowired
  private QuestionService questionService;
  @Autowired
  private UserMapper userMapper;
  
  //管理员页面分页显示所有
  @RequestMapping("/AdminshowAll")
  public String AdminshowAll(Page page, HttpServletRequest request) {
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
    
    return "admin/admin";
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


  //根据问题ID删除问题
  @RequestMapping("/AdminDelete")
  public String AdminDelete(@RequestParam("questionId") Integer questionId, Model model) {
    int flag = this.questionService.deleteById(questionId);
    if (flag > 0) {
      model.addAttribute("msg", "删除成功！");
      return "forward:/admin/AdminshowAll";
    } 
    return "";
  }


  //根据用户名删除用户
  @RequestMapping("/deleteUserByName")
  public String deleteUserByName(@RequestParam String userName, Model model) throws Exception {
    int n = this.userMapper.deleteUserByName(userName).intValue();
    if (n > 0) {
      model.addAttribute("msg", "删除成功！");
      return "forward:/admin/AdminshowAll";
    } 
    
    return "";
  }
}
