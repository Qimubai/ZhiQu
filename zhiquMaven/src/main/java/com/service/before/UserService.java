package com.service.before;
import com.po.User;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;

public interface UserService {
 public String UserRegister(User paramUser, Model paramModel, HttpSession paramHttpSession, String paramString) throws Exception;
  //µÇÂ¼
 public String selectUser(User user, Model model, HttpSession HttpSession, String code) throws Exception;
  
 public List<Map<String, Object>> selectQuesByUname(HttpSession paramHttpSession) throws Exception;
  
 public List<Map<String, Object>> queryAnswByUname(HttpSession paramHttpSession) throws Exception;
  
 public User selectUserByName(String paramString) throws Exception;
  
 public  User selectUserById(Integer paramInteger);
  
 public Integer updateUserById(User paramUser);
}
