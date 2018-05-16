package com.lixiang.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.service.UserService;

@Controller
public class UserInfoController {
	@Autowired
	private UserService userService;

	@RequestMapping("/modifyUser")
	public String delUser(Integer id) {
		userService.deleteUserInfoByPrimaryKey(id);
		return "redirect:/user/list";
	}

	@RequestMapping("/operateUser")
	public String delUserTo(Model model) {
		String strings = "你确定要删除此用户的相关信息吗？？？ 请仔细确认后，再操作！！！";
		model.addAttribute("strings", strings);
		return "user-modify";
	}
}
