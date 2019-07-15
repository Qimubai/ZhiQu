package com.service.before;
import com.mapper.UserMapper;
import com.po.User;
import com.service.before.UserService;
import com.service.before.UserServiceImpl;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class UserServiceImpl
  implements UserService
{
  @Autowired
  private UserMapper UserMapper;
  
  public String UserRegister(User user, Model model, HttpSession session, String code) throws Exception {
    if (!code.equalsIgnoreCase(session.getAttribute("code").toString())) {
      
      model.addAttribute("codeError", "验证码错误！");
      return "before/register";
    } 
    
    int n = UserMapper.UserRegister(user);
    if (n > 0) {
      model.addAttribute("meg", "注册成功！");
      return "before/login";
    } 
    model.addAttribute("meg", "注册失败");
    return "before/register";
  }

  public String selectUser(User user, Model model, HttpSession session, String code) throws Exception {
    if (!code.equalsIgnoreCase(session.getAttribute("code").toString())) {
      
      model.addAttribute("codeError", "验证码错误！");
      return "before/login";
    } 
    User ruser = null;
    User user1 = UserMapper.selectUser(user);
    //System.out.println(UserMapper.selectUser(user));
   // System.out.println(UserMapper.selectUser(user));
   /* if (list.size() > 0) {
      ruser = (User)list.get(0);
    }*/
    if (user1!= null) {
      session.setAttribute("user", user1);
      return "forward:/question/showAll";
    } 
    model.addAttribute("meg", "用户名或密码错误！");
    return "before/login";
  }

  public User selectUserByName(String userName) throws Exception { return this.UserMapper.selectUserByName(userName); }

  public List<Map<String, Object>> selectQuesByUname(HttpSession session) throws Exception {
    User user = (User)session.getAttribute("user");
    Integer userId = user.getUserId();
    return UserMapper.selectQuesByUname(userId);
  }
  
  public List<Map<String, Object>> queryAnswByUname(HttpSession session) throws Exception {
    User user = (User)session.getAttribute("user");
    Integer userId = user.getUserId();
    return UserMapper.queryAnswByUname(userId);
  }
  
  public User selectUserById(Integer userId)
  { return UserMapper.selectUserById(userId); }

  public Integer updateUserById(User user)
  { return UserMapper.updateUserById(user); }
}