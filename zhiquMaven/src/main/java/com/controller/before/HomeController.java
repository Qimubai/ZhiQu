package com.controller.before;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController
{ 
	//³õÊ¼»¯Ê×Ò³
  @RequestMapping("/toHome")
  public String toHome(Model model) { return "before/home"; }
}
