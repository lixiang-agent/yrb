package com.lixiang.ssm.controller;

import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.jboss.logging.Logger;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.entity.UserInfo;
import com.lixiang.ssm.service.UserInfoService;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController {

	@Autowired
	private UserInfoService userInfoService;
	
	protected Logger log = Logger.getLogger(UserInfoController.class);
	

	/**
	 * 修改用户,充值 
	 * 
	 * @param userInfo
	 * @param model
	 * @return
	 */
	@RequestMapping("/userInfoUpdateTopUp")
	public String userInfoToUpdate(UserInfo userInfo,Model model){
		//1.获取登录者信息
		Subject currentUser = SecurityUtils.getSubject();
		UserInfo result = (UserInfo) currentUser.getPrincipal();	
		userInfo.setId(1);
		userInfo.setPassword("4444555");
		userInfo.setAccount("sdfsef");
		userInfo.setPhoneNum(11223344511L);
		//2.调用service，调用第三方支付接口，如果支付成功，账号里面再加钱
		log.debug("---------------"+userInfo);
		userInfoService.updateTopUp(userInfo);
		model.addAttribute("result","result");
		model.addAttribute("userInfo","加钱");
		return "top-up";
	}

	
	 /** user注册
	 * @param user
	 * @param bindingResult
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/register")
	public Map<String,String> register(HttpSession session,@Valid UserInfo userInfo,BindingResult bindingResult,String code){
		
		Map<String, String> registerMap = new HashMap<String, String>();
		
		String codes = (String) session.getAttribute("code");
		
		List<FieldError> errors = bindingResult.getFieldErrors();
		for(FieldError error:errors){
			System.out.println(error);
		}
		
		String flag="0";		
		String msg = "注册成功！";
				
		if(codes !=null && !codes.equalsIgnoreCase(code)){
			flag="1";
			msg = "验证码错误";	
		}
		else if(bindingResult.getErrorCount()>0){
			flag="2";
			msg = "输入信息有误，请重新输入！";			
		}else {
			userInfoService.register(userInfo);
		}
		registerMap.put("flag", flag);
		registerMap.put("msg", msg);
		return registerMap;
		
	}
	
	/**
	 * 用户登录
	 * @param userInfo
	 * @param bindingResult
	 * @param model
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Map<String,String> login(@RequestParam String account, @RequestParam String password,HttpSession session,String code) {
		
		Map<String, String> loginMap = new HashMap<String, String>();
		
		Subject currentUser = SecurityUtils.getSubject();
		
		String flag="0";		
		String msg = "登录成功！";
		//获取验证码
		String codes = (String) session.getAttribute("code");
		//判断验证码
		if(codes !=null && !codes.equalsIgnoreCase(code)){
			flag="5";
			msg = "验证码错误";	
		}
		//判断是否登录
		else if(!currentUser.isAuthenticated()){
			// 把用户名和密码封装在一个UsernamePasswordToken 对象中
			UsernamePasswordToken token = new UsernamePasswordToken(account, password);
			// 记住我
			token.setRememberMe(true);
			try {
				// 登录，调用是subject.login();
				currentUser.login(token);
			} catch (UnknownAccountException uae) {
				flag="1";
				msg = "账号不存在";	
			} catch (IncorrectCredentialsException ice) {
				flag="2";
				msg = "密码错误";	
			} catch (LockedAccountException lae) {
				flag="3";
				msg="账号被锁定";
			}
			catch (AuthenticationException ae) {
				flag="4";
				msg="没有权限";
			}					
		}		
		loginMap.put("flag", flag);
		loginMap.put("msg", msg);
		return loginMap;
	}
	
	//登录成功后跳转到主界面
	@RequestMapping("/index")
	public String main(){
		return "redirect:/index.jsp";
	}
	
		
	//验证真实姓名
	@ResponseBody
	@RequestMapping("/isRealName")
	public int isRealName(HttpServletRequest request,String realName) {	
		
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		
		if(user == null){
			return 2;
		}
		if(user.getRealName() == null){
			return 0;
		}		
		if(!user.getRealName().equals(realName)){
			return 1;
		}		
		return 3;
	}
	
	//验证手机号码
	@ResponseBody
	@RequestMapping("/isPhoneNum")
	public int isPhoneNum(HttpServletRequest request,String phoneNum) {	
		
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user.getPhoneNum() == null){
			return 0;
		}
				
		if(!user.getPhoneNum().equals(Long.valueOf(phoneNum))){
			return 1;
		}		
		return 2;
	}
	
	//验证用户名
	@ResponseBody
	@RequestMapping("/isAccount")
	public int isAccount(String account) {		
		int flag=0;
		if(userInfoService.login(account) != null){
			flag=1;
		}
		return flag;
	}
	
	//退出登录
	@RequestMapping("/logout")
	public String logout(){
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return "redirect:/login.jsp";
	}

	
	
	/**
	 * 修改用户,提现
	 * 
	 * @param userInfo
	 * @param model
	 * @return
	 */
	@RequestMapping("/userInfoToWithdraw")
	public String userInfoToWithdraw(UserInfo userInfo,Model model){
		//1.获取登录者信息
		Subject currentUser = SecurityUtils.getSubject();
		UserInfo result = (UserInfo) currentUser.getPrincipal();	
		userInfo.setId(1);
		userInfo.setTotalBalance(new BigDecimal(1000));
		userInfoService.updateUserInfos(userInfo);
		model.addAttribute("result","result");
		model.addAttribute("userInfo",userInfo);
		return "withdraw";
	}
	
	
	/**
	 * 修改用户,提现
	 * 
	 * @param userInfo
	 * @param model
	 * @return
	 */
	@RequestMapping("/userInfoWithdraw")
	public String userInfoWithdraw(UserInfo userInfo,Model model){
		//1.获取登录者信息
		Subject currentUser = SecurityUtils.getSubject();
		UserInfo result = (UserInfo) currentUser.getPrincipal();	
		userInfo.setId(1);
		//2.调用service，调用第三方支付接口，如果提现成功，账号里面再减钱，但是余额要>0
		userInfoService.updateWithdraw(userInfo);
		model.addAttribute("result","result");
		model.addAttribute("userInfos",userInfo);
		return "withdraw";
		
	}
}
