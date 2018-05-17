package com.lixiang.ssm.controll;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.InvRecord;
import com.lixiang.ssm.entity.PaybackPlan;
import com.lixiang.ssm.entity.TraRecord;
import com.lixiang.ssm.entity.UserInfo;
import com.lixiang.ssm.service.AccpandectService;

@Controller
@RequestMapping("/accController")
public class AccpandectController {
	@Autowired
	private AccpandectService accpandectService;

	/**
	 * 根据ID来查询
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/accUser")
	public String accUser(Model model, Integer id) {
		
		Integer userId =1;
		// 获取登录着ID
		//1.查询用户信息
		UserInfo userInfo = accpandectService.selectByPrimaryKey(userId);
		model.addAttribute("userInfo", userInfo);

		//2.查询回款计划
		PaybackPlan paybackPlans = new PaybackPlan();
		paybackPlans.setUid(userId);
		PageInfo<PaybackPlan> page = accpandectService.pageList(paybackPlans);
		model.addAttribute("page", page);
		
		//3.查询资金记录
		TraRecord traRecord = new TraRecord();
		traRecord.setUserId(userId);
		PageInfo<TraRecord> fundPage = accpandectService.pageList(traRecord);
		model.addAttribute("fundPage", fundPage);
		
		//4.查询投资记录
		InvRecord invRecord = new InvRecord();
		invRecord.setUserId(userId);
		PageInfo<InvRecord> investPage = accpandectService.pageList(invRecord);
		model.addAttribute("investPage", investPage);
		return "user-conter";
	}
}
