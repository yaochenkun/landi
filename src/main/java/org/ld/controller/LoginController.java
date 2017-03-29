package org.ld.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.ld.model.User;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;
import org.ld.app.CurEnv;
import org.ld.app.MyTest;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	private static Logger logger = Logger.getLogger("logRec");

	// 登录
	@RequestMapping("/login")
	public ModelAndView login(HttpSession session, String name, String passwd) throws Exception {
		// 调用service进行用户身份验证
		CurEnv cur_env = new CurEnv();
		User user = userService.getUserByUserName(name);
		System.out.println(user);
		
		//返回ModelAndView
		ModelAndView modelAndView =  new ModelAndView();
		 
		//指定视图
		modelAndView.addObject("error", "");
		modelAndView.setViewName("/login");
	    
		if (name == null)
			modelAndView.addObject("error", "");
		else if (user == null)
			modelAndView.addObject("error", "用户名不存在！");
		else if (!(user.getUSERNAME().equals(name)))
			modelAndView.addObject("error", "用户名不存在！");
		else if(!(user.getPASSWD().equals(cur_env.myMD5(passwd))))
			modelAndView.addObject("error", "密码错误！");
		else if(user.getSTATE().equals(cur_env.getSettingsInt().get("forbid_state")))
			modelAndView.addObject("error", "用户  " + name + " 被禁用！");
		else // 身份验证成功
		{
			System.out.println("login controller");
			// 在session中保存用户身份信息
			cur_env.setCur_user(user);
			user.setLTIME(new Date());
			userService.updateUserInfo(user);
			session.setAttribute("CUR_ENV", cur_env);
			// 重定向到首页(.action)

			logger.info("User Login: " + name);

			if (user.getROLE() == 0)
				modelAndView.setViewName("redirect:/homeAdmin.action");
			else
				modelAndView.setViewName("redirect:/homeUser.action");
		}
		// 返回登录 页面(.jsp)
		
		return modelAndView;
	}

	// 用户首页
	@RequestMapping("/homeUser")
	public String home_user(HttpSession session) throws Exception {
		System.out.println("homeUser controller");
		// 显示系统页面(.jsp)
		// return "/home";
		// 临时显示房间管理页面
		return "/user/home/homeUser";
	}

	// 管理员首页
	@RequestMapping("/homeAdmin")
	public String home_admin(HttpSession session) throws Exception {
		System.out.println("home_admin controller");
		// 显示系统页面(.jsp)
		// return "/home";
		// 临时显示房间管理页面
		return "/admin/homeAdmin";
	}

	// 退出
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {

		// 清除session
		session.invalidate();

		// 返回登录 页面(.jsp)
		return "/login";
	}
}
