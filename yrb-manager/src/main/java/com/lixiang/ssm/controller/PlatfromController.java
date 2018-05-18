package com.lixiang.ssm.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.entity.UserInfo;
import com.lixiang.ssm.service.UserInfoService;

@Controller
public class PlatfromController {
	
	@Autowired
	private UserInfoService userInfoService;
    protected Logger log = Logger.getLogger(LoginController.class);
	/**
	 * 分页和查询全部
	 * @param userInfo
	 * @param model
	 * @return
	 */
	@RequestMapping("/getPlatfromList")
	public String getRolesList(UserInfo userInfo,Model model){
		PageInfo<UserInfo> userInfos =userInfoService.pageList(userInfo);
		model.addAttribute("userInfos",userInfos);
		return "userinfo-list";
	}
	
	@RequestMapping("/toUpdateUserInfo")
	public String toUpdateRoleInfo(Integer id,Model model){
		UserInfo userinfos = userInfoService.selectByPrimaryKey(id);
		System.out.println("测试数据="+userinfos);
		model.addAttribute("userinfos", userinfos);
		return "userinfo-update";
	}
	
	@RequestMapping("/updateSaveUserInfo")
	public String updateSaveRoleInfo(HttpServletRequest request,UserInfo userInfo, Model model){
		Subject currentUser = SecurityUtils.getSubject();
		User result = (User) currentUser.getPrincipal();
		userInfo.setModifyDate(new Date());
		log.debug("result="+result);
		boolean userInfos = userInfoService.updateByPrimaryKeySelective(userInfo);
		log.debug("resource="+userInfos);
		model.addAttribute("userInfos", userInfos);
		model.addAttribute("result", result);
		request.getSession().setAttribute("oper_result", userInfos);
		return "redirect:/getPlatfromList";
	}
	
}
