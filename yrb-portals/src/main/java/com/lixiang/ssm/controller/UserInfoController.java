package com.lixiang.ssm.controller;

import org.jboss.logging.Logger;
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
	
	protected Logger log = Logger.getLogger(UserInfoController.class);
	
	@RequestMapping("/userInfoToUpdate")
	public String userInfoToUpdate(UserInfo userInfo,Model model){
		//1.获取登录者信息，在判断金额，
		//2.判断银行卡
		//3.调用service，a. 调用第三方支付接口，如果支付成功，账号里面再加钱
		userInfoService.updateUserInfos(userInfo);
		log.error("---------------------"+userInfo);
		System.out.println("------------------" + userInfo);
		log.debug("------------------------------------》》》》》");
		model.addAttribute("userInfo","加钱");
		return "top-up";
	}
	
	@RequestMapping("/userInfoUpdate")
	public String userInfoUpdate(UserInfo userInfo,Model model){
		boolean result=userInfoService.updateUserInfos(userInfo);
		model.addAttribute("result",result);
		return "redirect:/views/top-up.jsp";
	}
	
	
	
}
