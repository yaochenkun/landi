package org.ld.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.ld.model.User;

/* 用户登录拦截器  */
public class LoginIntercepter implements HandlerInterceptor {

	// 进入Controller(Handler)方法前执行
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler)
			throws Exception {
		// 获取请求的URL
		String url = request.getRequestURI();
		// 如果获取的是公开地址（登录），则放行
		if (url.endsWith("login.action")) {
			return true;
		}

		// 判断session，用户是否登录
		HttpSession session = request.getSession();
		User curUser = (User) session.getAttribute("curUser");
		if (curUser == null) {
			// 没有登录
			System.out.println("没有登录");
			response.sendRedirect(request.getContextPath() + "/views/login.jsp");
//			request.getRequestDispatcher("/views/login.jsp").forward(request, response);

			return false;
		} else {
			// 用户不是管理员且要访问管理员页面
			if (url.toLowerCase().indexOf("admin") >= 0 && curUser.getROLE() > 0) {
				System.out.println("用户不是管理员且要访问管理员页面");
				response.sendRedirect(request.getContextPath() + "/views/login.jsp");
				return false;
			} else {
				//是合法已登录过的用户
				
				//从cur_eve.getUser()中获取resetPass字段查看是否重置了密码
				//if(重置过)
				//	放行return true
				//else(未重置)
				//  重定向到homeUser.action， 要求用户修改密码（前端界面通过cur_user.getUser().resetPass判定用户是否重置过密码）
				
				return true;
			}
		}
	}

	// 进入Handler方法之后，返回modelAndView之前执行
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		// System.out.println("LoginInterceptor...postHandle");

	}

	// 执行Handler完成执行此方法
	// 应用场景：统一异常处理，统一日志处理
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		// System.out.println("LoginInterceptor...afterCompletion");
	}

}
