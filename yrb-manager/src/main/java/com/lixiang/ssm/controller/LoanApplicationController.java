package com.lixiang.ssm.controller;

import java.util.Date;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.LoanApplication;
import com.lixiang.ssm.entity.User;
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
	//获取当前用户
	Subject currentUser = SecurityUtils.getSubject();
	User user = (User)currentUser.getPrincipal();
	
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
		model.addAttribute("user", user);
		return "application-list";
	}
	
	/**
	 * 查询真实姓名的未处理申请
	 * 查询联系电话的未处理申请
	 * @param user 管理员
	 * @param model 模
	 * @return
	 */
	@RequestMapping("listLoanApplication")
	public String listLoanApplication(Model model,String realName , String contactNumber)
	{
		log.debug("查询真实姓名的申请");
		log.debug("查询联系电话的申请");
		//封装了查询出来的数据
		PageInfo<LoanApplication> page = service.listLoanApplication(realName, contactNumber);
		model.addAttribute("page", page);
		model.addAttribute("user", user);
		return "application-list";
	}
	
	/**
	 * 修改申请信息
	 * @param model
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public String updateLoanApplication(@Valid LoanApplication application)
	{
		//设置修改时间，为了在拼接SQL语句，实际在数据库是数据库的时间
		application.setHandlerDate(new Date());
		if(service.updateByPrimaryKeySelective(application)==1)
			return "true";
		return "false";
	}
}
