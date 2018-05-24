package com.lixiang.ssm.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lixiang.ssm.entity.UserInfo;
import com.lixiang.ssm.service.SettingService;

@Controller
@RequestMapping("/account")
public class SettingController {
	@Autowired
	private SettingService settingService;

	protected Logger log = Logger.getLogger(SettingController.class);

	@RequestMapping("/show")
	public String show(Model model) {
		// 模拟登陆用户
		int userId = 1;
		UserInfo userInfo = settingService.getUserInfoById(userId);
		model.addAttribute("userInfo", userInfo);
		return "account";
	}  

	@RequestMapping("/udpatePhone")
	public String udpatePhone(UserInfo userInfo, Model model, HttpSession session) {

		// 校验电话号码
		Long phone = userInfo.getPhoneNum();
		boolean result = false;
		Pattern pattern = Pattern.compile("^1[35789]\\d{9}$");
		Matcher matcher = pattern.matcher(phone.toString());
		if (matcher.find()) {
			// 模拟登陆用户
			int userId = 1;
			userInfo.setId(1);
			int row = settingService.updateUserInfo(userInfo);
			result = row > 0;
		}
		session.setAttribute("oper_result", result);
		return "redirect:/account/show";
	}

	@RequestMapping("/idcardAuth")
	public String idcardAuth(UserInfo userInfo,String newCard, Model model, HttpSession session) {
		// 校验姓名和身份证号码
		String idCard = newCard;
		boolean result = false;
		Pattern pattern = Pattern.compile(
				"^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$");
		Matcher matcher = pattern.matcher(newCard);
		if (matcher.find()) {
			// 模拟登陆用户
			int userId = 1;
			userInfo.setId(1);
			userInfo.setIdcard(newCard);
			int row = settingService.updateUserInfo(userInfo);
			result = row > 0;
		}
		session.setAttribute("oper_result", result);
		return "redirect:/account/show";
	}

	@RequestMapping("/emailAddress")
	public String emailAddress(UserInfo userInfo, String newEmail, Model model, HttpSession session) {
		// 校验email地址
		String email = newEmail;
		boolean result = false;

		userInfo.setEmail(newEmail);
		if (email != null) {

			Pattern pattern = Pattern.compile("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$");
			Matcher matcher = pattern.matcher(email);
			if (matcher.find()) {

				// 模拟登陆用户1
				int userId = 1;
				userInfo.setId(1);
				int row = settingService.updateUserInfo(userInfo);
				result = row > 0;
			}
		}

		session.setAttribute("oper_result", result);
		return "redirect:/account/show";
	}

	@RequestMapping("/passwordAuth")
	public String passwordAuth(UserInfo userInfo, String newPassword, Model model, HttpSession session) {
		// 校验密码

		String password = newPassword;
		boolean result = false;

		Pattern pattern = Pattern.compile("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,21}$");
		Matcher matcher = pattern.matcher(newPassword);

		if (matcher.find()) {
			// 模拟登陆用户
			int userId = 1;
			userInfo.setId(1);

			int row = settingService.updateUserInfo(userInfo);
			result = row > 0;
		}

		session.setAttribute("oper_result", result);
		return "redirect:/account/show";
	}
}
