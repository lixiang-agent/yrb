package com.lixiang.ssm.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	//记录日志
	protected Logger log = Logger.getLogger(LoginController.class);
	
	@RequestMapping("/login")
	public String login(@RequestParam  String username, @RequestParam String password,HttpSession session) {
		log.debug("开始登录,username="+username+",password="+password);
		Subject currentUser = SecurityUtils.getSubject();
		
		/*User user = (User)currentUser.getPrincipal();*/
		//封装错误信息
		String msg=null;//默认是没有错误
		// 判断是否登录
		if (!currentUser.isAuthenticated()) {
			// 把用户名和密码封装在一个UsernamePasswordToken 对象中
			UsernamePasswordToken token = new UsernamePasswordToken(username, password);
			// 记住我
			token.setRememberMe(true);
			try {
				// 登录，调用是subject.login();
				currentUser.login(token);
			} catch (UnknownAccountException uae) {
				msg="账号不存在";
			} catch (IncorrectCredentialsException ice) {
				User user = userService.getUserByName(username);
				//10分钟内连续错误，错误累加，否则计数从新开始
				Calendar cal = Calendar.getInstance();
				cal.setTime(user.getLoginDate());
				cal.add(Calendar.MINUTE, 10);
				Date now = new Date();
				int errorCount = user.getErrorCount();
				if (now.before(cal.getTime())) {
					//次数+1,记录最后一次访问时间
					userService.addLoginErrorCount(username);
					errorCount++;
				}else{
					//错误次数清零
					userService.cleanLoginErrorCount(username);
					userService.addLoginErrorCount(username);
					errorCount=1;
				}
				msg="密码错误,错误"+errorCount+"次，连续错误3次账号锁定半小时.";
				//如果错误次数已经是第三次，那么提示账号被锁定
				if(user!=null && errorCount==3){
					msg="账号被锁定";
				}
			} catch (LockedAccountException lae) {
				msg="账号被锁定";
			}
			catch (AuthenticationException ae) {
				msg="认证错误";
			}
		}
		session.setAttribute("msg", msg);
		//登录成功
		if(msg==null){
			//错误次数清零
			userService.cleanLoginErrorCount(username);
			return "redirect:/main";
		}
		//登录失败
		else{
			return "redirect:/login.jsp";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(){
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return "redirect:/login.jsp";
	}
	
	@RequestMapping("/main")
	public String main(){
		return "main";
	}

}
