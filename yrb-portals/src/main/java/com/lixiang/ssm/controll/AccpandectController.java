package com.lixiang.ssm.controll;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.PaybackPlan;
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
		PaybackPlan paybackPlan = accpandectService.selectByPrimaryKey(userId);
		model.addAttribute("paybackPlan", paybackPlan);

		//2.查询回款计划
		PaybackPlan paybackPlans = new PaybackPlan();
		paybackPlans.setUid(userId);
		PageInfo<PaybackPlan> page = accpandectService.pageList(paybackPlans);
		model.addAttribute("page", page);
		
		return "user-conter";
	}

	@RequestMapping("/pageList")
	public String list(PaybackPlan paybackPlans, Model model) {
		// 封装了总数，封装了分页信息，封装了查询出来的数据
		paybackPlans.setUid(1);
		PageInfo<PaybackPlan> page = accpandectService.pageList(paybackPlans);
		model.addAttribute("page", page);
		return "accUser";
	}

}
