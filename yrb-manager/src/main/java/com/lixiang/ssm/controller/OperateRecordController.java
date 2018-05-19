package com.lixiang.ssm.controller;

import java.util.Date;
import java.util.List;

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

@RequestMapping("/check")
@Controller
public class OperateRecordController {
	protected Logger log = Logger.getLogger(LoanProjectController.class);
	@Autowired
	private OperateRecordService operateRecordService;
	@Autowired
	private LoanProjectService loanProjectService;
	
	@RequestMapping("/loanprojectcheck")
		public String loanprojectcheck(int id, Model model){
		
			 LoanProject loanProject = loanProjectService.getLoan(id);
	
			 List<OperateRecord> operateRecord= operateRecordService.getoperator(loanProject.getProjectNo());
			 System.out.println("*******************************************");
			 System.out.println(operateRecord);
			 System.out.println("*******************************************");
			 model.addAttribute("operateRecord", operateRecord);
			 model.addAttribute("loan", loanProject);
		
		return "loanprojectcheck";
		
	}
	@RequestMapping("/agree")
	public String agree(LoanProject loanProject){
		//查询同意放款项目的所有信息
		LoanProject loanP = loanProjectService.getLoan(loanProject.getId());
		
		loanProjectService.agree(loanProject);
		
		Subject currentUser = SecurityUtils.getSubject();
		
		User user = (User)currentUser.getPrincipal();
		
		OperateRecord operateRecord = new OperateRecord();
		operateRecord.setOperatorId(user.getId());
		operateRecord.setOperatorName(user.getUsername());
		operateRecord.setOperatorDate(new Date());
		operateRecord.setOperType(2);
		operateRecord.setProjectId(loanProject.getId());
		operateRecord.setProjectType(1);
		operateRecordService.insertSelective(operateRecord);
		
		return "readyloan";
		
	}

	
	@RequestMapping("/repaymentlist")
	public String repaymentlist(int id, Model model){
	
		 LoanProject loanProject = loanProjectService.getLoan(id);

		 List<OperateRecord> operateRecord= operateRecordService.getoperator(loanProject.getProjectNo());
		 System.out.println("*******************************************");
		 System.out.println(operateRecord);
		
		 model.addAttribute("operateRecord", operateRecord);
		 model.addAttribute("loan", loanProject);
	
		 return "repaymentlist";
	
}
	
	
	
	
	

}
