package com.lixiang.ssm.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	 * @param request
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
		//2.调用service，a. 调用第三方支付接口，如果支付成功，账号里面再加钱
		log.debug("---------------"+userInfo);
		userInfoService.updateTopUp(userInfo);
		model.addAttribute("result","result");
		model.addAttribute("userInfo","加钱");
		return "top-up";
	}
}
