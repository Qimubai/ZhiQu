package com.util;

import com.po.Question;
import com.po.User;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;

public class MyUtil
{
  public static String getStringID() {
    //id = null;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    return sdf.format(date);
  }
  
  public static Integer getUserId(HttpSession session) {
    User user = (User)session.getAttribute("user");
    return user.getUserId();
  }
  
  public static Integer getQuesId(HttpSession session) {
    Question question = (Question)session.getAttribute("question");
    return question.getQuestionId();
  }
}
