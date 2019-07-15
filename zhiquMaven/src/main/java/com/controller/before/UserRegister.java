package com.controller.before;
import com.controller.before.UserRegister;
import com.po.User;
import com.service.before.UserService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserRegister
{
  @Autowired
  private UserService userService;
  
  //初始化我的知趣页面
  @RequestMapping("/toUser")
  public String toUser(Model model) 
  { 
	  return "before/user"; 
	  }
  
  //初始化注册页面
  @RequestMapping("/toRegister")
  public String toRegister(Model model)
  { 
	  return "before/register"; 
	  }
 
  //注册用户
  @RequestMapping("/register")
  public String Register(@ModelAttribute User user, Model model, HttpSession session, String code) throws Exception 
  { 
	  return this.userService.UserRegister(user, model, session, code);
	  
  }
  
//初始化登录页面
  @RequestMapping("/toLogin")
  public String toLogin(Model model)
  { 
	  return "before/login";  
  }
  
 //登录
  @RequestMapping("/login")
  public String Login(@ModelAttribute User user, Model model, HttpSession session, String code) throws Exception 
  {
    if ("123456".equals(user.getUserPassword()) && "123456".equals(user.getUserName())) {
      return "forward:/admin/AdminshowAll";
    }
    else {
    	 return userService.selectUser(user, model, session, code);
    }  
  }
   
  //退出
  @RequestMapping("/exit")
  public String Exit(HttpSession session) {
    session.invalidate();
    return "forward:/question/showAll";
  }
  
  //查询用户信息
  @RequestMapping("/selectUser")
  public String selectUser(Model model, HttpSession session) throws Exception {
    List<Map<String, Object>> question = this.userService.selectQuesByUname(session);
    model.addAttribute("quesList", question);
    List<Map<String, Object>> answer = this.userService.queryAnswByUname(session);
    model.addAttribute("answList", answer);
    return "before/user";
  }
 
  //根据用户名查询用户
  @ResponseBody
  @RequestMapping(value = "queryByUser", method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
  public User queryByName(String userName, HttpServletRequest request) throws Exception
  { 
	  return this.userService.selectUserByName(userName); 
	  }
 
  @RequestMapping("/updateUser")
  public String updateUser(@RequestParam("userId") Integer userId, Model model) {
    User user = this.userService.selectUserById(userId);
    model.addAttribute("user", user);
    return "before/updateUser";
  }

  @RequestMapping("/updateUser1")
  public String updateUser1(User user, Model model) {
    Integer n = this.userService.updateUserById(user);
    if (n.intValue() > 0) {
      model.addAttribute("user", user);
      model.addAttribute("msg", "修改成功");
      return "forward:/user/selectUser";
    } 
    
    model.addAttribute("msg", "修改失败！"); 
    return "before/userUpdate";
  }
}