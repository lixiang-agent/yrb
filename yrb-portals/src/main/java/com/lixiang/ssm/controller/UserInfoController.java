package com.lixiang.ssm.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.lixiang.ssm.entity.UserInfo;
import com.lixiang.ssm.service.UserInfoService;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController {

	@Autowired
	private UserInfoService userInfoService;
	
	@RequestMapping("/userInfoUpdate")
	public String userInfoUpdate(UserInfo userInfo,Model model){
		boolean result=userInfoService.updateUserInfos(userInfo);
		model.addAttribute("result",result);
		return "redirect:/views/top-up.jsp";
	}
	
	/**
	 * user注册
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
		
		UserInfo user = userInfoService.login(account);
		
		String codes = (String) session.getAttribute("code");
		
		String flag="0";		
		String msg = "登录成功！";
	
		if(codes !=null && !codes.equalsIgnoreCase(code)){
			flag="3";
			msg = "验证码错误";	
		}
		else if(user == null){
			flag="1";
			msg = "账号不存在";			
		}
		else{
			ByteSource credentialsSalt = ByteSource.Util.bytes(account);
			Object value = new SimpleHash("MD5", password, credentialsSalt, 101);
			System.out.println(user.getPassword().equals(value.toString()));	
			if(!user.getPassword().equals(value.toString())){
				flag="2";	
				msg = "密码错误";				
			}
			else{
				session.setAttribute("user", user);				
			}
		}
		loginMap.put("flag", flag);
		loginMap.put("msg", msg);
		return loginMap;
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
	public String logout(HttpSession session){
		session.removeAttribute("user");
		return "redirect:/login.jsp";
	}
		

}
