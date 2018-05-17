package com.lixiang.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lixiang.ssm.entity.UserInfo;
import com.lixiang.ssm.service.UserInfoService;

@Controller
@RequestMapping("/userInFo")
public class UserInfoController {
	
	@Autowired
	private UserInfoService userInfoService;
	
	@RequestMapping("/userInfoUpdate")
	public String userInfoUpdate(UserInfo userInfo,Model model){
		boolean result=userInfoService.updateUserInfo(userInfo);
		model.addAttribute("result",result);
		return "redirect:/views/top-up.jsp";
	}
	

}
