package com.lixiang.ssm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;

import com.lixiang.ssm.entity.LoanProject;
import com.lixiang.ssm.entity.OperateRecord;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.service.LoanProjectService;
import com.lixiang.ssm.service.OperateRecordService;

@RequestMapping("/loan")
@Controller
public class LoanProjectController {

	@Autowired
	private LoanProjectService loanProjectService;
	
	@Autowired
	private OperateRecordService operateRecordService;

	protected Logger log = Logger.getLogger(LoanProjectController.class);

	
	/**
	 * 查询所有的项目(带有分页)
	 * @param loanProject
	 * @param model
	 * @return
	 */
	@RequestMapping("/listLoanProject")
	public String list(LoanProject loanProject, Model model) {
		// log.debug("---------------->"+(user.getSex()));
		// 封装了总数，封装了分页信息，封装了查询出来的数据
		System.out.println("123");
		PageInfo<LoanProject> page = loanProjectService.pageList(loanProject);

		model.addAttribute("page", page);

		return "loan-project";
	}

	/**
	 * 项目添加，返回到添加页面
	 * @return
	 */
	@RequestMapping("toaddloan")
	public String toAddLoan() {
		return "loan-add";
	}

	/**
	 * 项目添加到数据库
	 * @param request
	 * @param loanProject
	 * @param model
	 * @return
	 */
	@RequestMapping("addloan")
	public String addLoan(HttpServletRequest request, LoanProject loanProject, Model model) {
		loanProject.setCreatorDate(new Date());
		int result = loanProjectService.addLoan(loanProject);
		request.getSession().setAttribute("oper_result", result);
		return "redirect:/loan/listLoanProject";

	}

	/**
	 * 查看项目的 详情信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/togetloaninfo")
	public String toGetLoanInfo(int id, Model model) {
		
		LoanProject loanProject = loanProjectService.getLoan(id);

		
		/*Date date = loanProject.getCreatorDate();
		 SimpleDateFormat ft = new SimpleDateFormat ("yyyy:MM:dd HH:mm:ss");
		 String creatordate = ft.format(date);*/
		
		
		//loanProject.setCreatorDate();
		 System.out.println("***************************");
			System.out.println(loanProject);
			
			System.out.println("***************************");

		model.addAttribute("loaninfo", loanProject);
		return "loan-info";

	}
	
	/**
	 * 项目编辑，返回编辑页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("editloan")
	public String editloan(int id, Model model) {
		
		LoanProject loanProject = loanProjectService.getLoan(id);
		model.addAttribute("loaninfo", loanProject);
		return "loan-edit";

	}
	
	@RequestMapping("updateloan")
	public String updateloan(HttpServletRequest request, LoanProject loanProject, Model model){
		
		System.out.println("************");
		System.out.println(loanProject.getProjectStatus());
		System.out.println(loanProject.getRepaymentMethod());
		System.out.println(loanProject);
		loanProject.setModifyDate(new Date());
		int result =  loanProjectService.updateLoan(loanProject);
		
		request.getSession().setAttribute("oper_result", result);
		return "redirect:/loan/listLoanProject";
	}
	
	/**
	 * 删除项目
	 * @param request
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("deleteLoan")
	public String deleteLoan(HttpServletRequest request,int id,Model model){
		int result =  loanProjectService.delLoan(id);
		request.getSession().setAttribute("oper_result", result);
		
		return "redirect:/loan/listLoanProject";
		
	}
	
	/**
	 * 查看待评审的项目
	 * @param loanProject
	 * @param model
	 * @return
	 */
	@RequestMapping("listloancheck")
	public String listloancheck(LoanProject loanProject, Model model){
		/*loanProjectService.pageList(loanProject);*/
		PageInfo<LoanProject> page =  loanProjectService.pageListloan(loanProject);
		System.out.println("************");
		System.out.println(loanProject.getProjectStatus());
		
		model.addAttribute("page", page);
		return "loancheck";
		
		
	}
	
	/**
	 * 查看未提交的项目
	 * @param loanProject
	 * @param model
	 * @return
	 */
	@RequestMapping("/loansubmit")
	public String loansubmit(LoanProject loanProject, Model model) {
		// log.debug("---------------->"+(user.getSex()));
		// 封装了总数，封装了分页信息，封装了查询出来的数据
		
		PageInfo<LoanProject> page = loanProjectService.pageList(loanProject);

		model.addAttribute("page", page);

		return "loansubmit";
	}
	
	
	/**
	 * 提交未提交任务
	 * @param request
	 * @param loanProject
	 * @return
	 */
	@RequestMapping("/submitloan")
	public String submitloan(HttpServletRequest request,LoanProject loanProject){
		Subject currentUser = SecurityUtils.getSubject();
		
		User user = (User)currentUser.getPrincipal();
		
		boolean result = loanProjectService.updateLoanSubmit(loanProject);
		
		//获取提交审核项目的所有信息
		LoanProject  loanProject1 = loanProjectService.getLoan(loanProject.getId());
		OperateRecord operateRecord = new OperateRecord();
		operateRecord.setOperType(1);
		operateRecord.setProjectId(user.getId());
		System.out.println("************************************");
		System.out.println(operateRecord.getProjectId());
		System.out.println("************************************");
		operateRecord.setOperatorName(user.getUsername());
		operateRecord.setOperatorDate(new Date());
		operateRecord.setProjectId(loanProject1.getId());
		operateRecord.setProjectType(1);
		
		operateRecordService.insertSelective(operateRecord);
		
		System.out.println("-------------------------------------");
		System.out.println(loanProject.getId());
		
		return "redirect:/loan/loansubmit?projectStatus=10";
		
	}
	
	/**
	 * 提交审核通过的项目
	 * @param request
	 * @param loanProject
	 * @param model
	 * @return
	 */
	@RequestMapping("subloanproject")
	public String subloanproject(HttpServletRequest request,LoanProject loanProject,Model model){
		boolean result = loanProjectService.subloanproject(loanProject);
		Subject currentUser = SecurityUtils.getSubject();
		
		User user = (User)currentUser.getPrincipal();
		
		LoanProject  loanProject1 = loanProjectService.getLoan(loanProject.getId());
		OperateRecord operateRecord = new OperateRecord();
		operateRecord.setOperType(2);
		operateRecord.setProjectId(user.getId());
		System.out.println("************************************");
		System.out.println(operateRecord.getProjectId());
		System.out.println("************************************");
		operateRecord.setOperatorName(user.getUsername());
		operateRecord.setOperatorDate(new Date());
		operateRecord.setProjectId(loanProject1.getId());
		operateRecord.setProjectType(1);
		
		operateRecordService.insertSelective(operateRecord);
		
		return "redirect:/loan/listloancheck?projectStatus=20"; 
		
	}
	
	/**
	 * 验证审核不通过的项目
	 * @param request
	 * @param loanProject
	 * @param model
	 * @return
	 */
	@RequestMapping("backloanproject")
	public String backloanproject(HttpServletRequest request,LoanProject loanProject,Model model){
		boolean result = loanProjectService.backloanproject(loanProject);
		
		Subject currentUser = SecurityUtils.getSubject();
		
		User user = (User)currentUser.getPrincipal();
		
		LoanProject  loanProject1 = loanProjectService.getLoan(loanProject.getId());
		OperateRecord operateRecord = new OperateRecord();
		operateRecord.setOperType(4);
		operateRecord.setProjectId(user.getId());
		System.out.println("************************************");
		System.out.println(operateRecord.getProjectId());
		System.out.println("************************************");
		operateRecord.setOperatorName(user.getUsername());
		operateRecord.setOperatorDate(new Date());
		operateRecord.setProjectId(loanProject1.getId());
		operateRecord.setProjectType(1);
		
		operateRecordService.insertSelective(operateRecord);
		
		
		return "redirect:/loan/listloancheck?projectStatus=20"; 
		
	}
	
		
	@RequestMapping("/checkrecord")
	public String checkrecord(LoanProject loanProject, Model model) {
		// log.debug("---------------->"+(user.getSex()));
		// 封装了总数，封装了分页信息，封装了查询出来的数据
		System.out.println("123");
		PageInfo<LoanProject> page = loanProjectService.pageList(loanProject);

		model.addAttribute("page", page);

		return "checkrecord";
	}
	


}
