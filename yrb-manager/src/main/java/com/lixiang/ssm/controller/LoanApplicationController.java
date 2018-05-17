package com.lixiang.ssm.controller;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.LoanApplication;
import com.lixiang.ssm.service.LoanApplicationService;

/**
 * 借款信息处理
 * @author Administrator
 *
 */
@RequestMapping("loanApplication")
@Controller
public class LoanApplicationController
{
	//日志
	protected Logger log = Logger.getLogger(LoginController.class);
	
	//申请的业务处理
	@Autowired
	private LoanApplicationService service;
	
	/**
	 * 查询申请列表
	 * @param user 管理员
	 * @param model 模
	 * @return
	 */
	@RequestMapping("list")
	public String listLoanApplication(Model model)
	{
		log.debug("查询申请列表");
		//封装了查询出来的数据
		PageInfo<LoanApplication> page = service.listLoanApplication();
		model.addAttribute("page", page);
		return "application-list";
	}
	
	
}
