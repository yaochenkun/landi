package org.ld.controller;

import javax.servlet.http.HttpSession;

import org.ld.model.User;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	//登录
	@RequestMapping("/login")
	public String login(HttpSession session, String name, String passwd)
			throws Exception {
		// 调用service进行用户身份验证
        User user = userService.getUserByName(name);
        System.out.println(user); 
        //身份验证成功
        if(user!= null && user.getPasswd().equals(passwd)){
        	System.out.println("login controller");
        	// 在session中保存用户身份信息
    		session.setAttribute("name", name);
    		// 重定向到首页(.action)
    		return "redirect:/home.action";
        }
        //返回登录 页面(.jsp)
        else 
        	return "/login";
	}
	
	//首页
	@RequestMapping("/home")
	public String home(HttpSession session) throws Exception{
		System.out.println("home controller");
		//显示系统页面(.jsp)
		return "/home";
	}
	//退出
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {

		// 清除session
		session.invalidate();

		// 返回登录 页面(.jsp)
		return "/login";
	}
}
