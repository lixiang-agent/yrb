package com.lixiang.ssm.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.UserInfo;
import com.lixiang.ssm.service.UserInfoService;

@Controller
public class PlatfromController {
	
	Logger log =Logger.getLogger("");
	
	@Autowired
	private UserInfoService userInfoService;
	
	@RequestMapping("/getPlatfromList")
	public String getRolesList(UserInfo userInfo,Model model){
		PageInfo<UserInfo> userInfos =userInfoService.pageList(userInfo);
		model.addAttribute("userInfos",userInfos);
		return "userinfo-list";
	}
	
	@RequestMapping("/toUpdateUserInfo")
	public String toUpdateRoleInfo(Integer id,Model model){
		UserInfo userinfo = userInfoService.selectByKey(id);
		model.addAttribute("userinfos", userinfo);
		return "userinfo-update";
	}
	
}
