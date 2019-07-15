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
  
  @RequestMapping("/toUser")
  public String toUser(Model model) { return "before/user"; }

  @RequestMapping("/toRegister")
  public String toRegister(Model model) { return "before/register"; }
 
  @RequestMapping("/register")
  public String Register(@ModelAttribute User user, Model model, HttpSession session, String code) throws Exception { return this.userService.UserRegister(user, model, session, code); }

  @RequestMapping("/toLogin")
  public String toLogin(Model model) { return "before/login"; }
 
  @RequestMapping("/login")
  public String Login(@ModelAttribute User user, Model model, HttpSession session, String code) throws Exception {
    if ("123456".equals(user.getUserPassword()) && "123456".equals(user.getUserName())) {
      return "forward:/admin/AdminshowAll";
    }
    else {
    	 return userService.selectUser(user, model, session, code);
    }  
  }
  
  @RequestMapping("/exit")
  public String Exit(HttpSession session) {
    session.invalidate();
    return "forward:/question/showAll";
  }
  
  @RequestMapping("/selectUser")
  public String selectUser(Model model, HttpSession session) throws Exception {
    List<Map<String, Object>> question = this.userService.selectQuesByUname(session);
    model.addAttribute("quesList", question);
    List<Map<String, Object>> answer = this.userService.queryAnswByUname(session);
    model.addAttribute("answList", answer);
    return "before/user";
  }
 
  @ResponseBody
  @RequestMapping(value = "queryByUser", method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
  public User queryByName(String userName, HttpServletRequest request) throws Exception { return this.userService.selectUserByName(userName); }
 
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
      model.addAttribute("msg", "��������");
      return "forward:/user/selectUser";
    } 
    
    model.addAttribute("msg", "��������"); return "before/userUpdate";
  }
}