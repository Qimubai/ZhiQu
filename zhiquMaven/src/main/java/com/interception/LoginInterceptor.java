package com.interception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor  implements HandlerInterceptor
{
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
  {
    String url = request.getRequestURI();
    
    if (url.indexOf("login") >= 0 || url.indexOf("toLogin") >= 0 || url.indexOf("register") >= 0)
    {
      return true;
    }
    if (url.indexOf("toHome") >= 0 || url.indexOf("toRegister") >= 0 || url.indexOf("validateCode") >= 0) 
    {
      return true;
    }
    if (url.indexOf("showAll") >= 0 || url.indexOf("showQues") >= 0 || url.indexOf("toQuestion") >= 0) 
    {
      return true;
    }
    if (url.indexOf("exit") >= 0 || url.indexOf("queryQues") >= 0 || url.indexOf("AdminDelete") >= 0 || url.indexOf("deleteUserByName") >= 0) 
    {
      return true;
    }

    
    HttpSession session = request.getSession();
    Object obj = session.getAttribute("user");
    if (obj != null)
    {  return true;}
    else 
    { request.setAttribute("meg", "没有登录请先登录!");
    request.getRequestDispatcher("/WEB-INF/jsp/before/login.jsp").forward(request, response);
    return false;}
  }
}
