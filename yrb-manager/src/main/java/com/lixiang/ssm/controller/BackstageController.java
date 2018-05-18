package com.lixiang.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lixiang.ssm.entity.PlatFormAccount;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.service.BackstageService;

@Controller
public class BackstageController {
	@Autowired
	private BackstageService backstageService;

	@RequestMapping("/main")
	public String selectmoneyTraMoney(Integer moneyTraMoney, Model model) {

		Integer platFormAccount = (Integer) backstageService.selectmoneyTraMoney();

		model.addAttribute("platFormAccount", platFormAccount);
		Integer platFormAccount1 = (Integer) backstageService.selectmoneyTraDate();
		System.out.println(platFormAccount1);

		model.addAttribute("platFormAccount1", platFormAccount1);

		Integer user = (Integer) backstageService.selectCount();

		model.addAttribute("user", user);
		return "main";

	}

}
