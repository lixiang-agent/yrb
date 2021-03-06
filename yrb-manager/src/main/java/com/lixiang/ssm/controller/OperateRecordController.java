package com.lixiang.ssm.controller;

import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lixiang.ssm.entity.LoanProject;
import com.lixiang.ssm.entity.OperateRecord;
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
			System.out.println("***************id**********************");
				System.out.println(id);
			 LoanProject loanProject = loanProjectService.getLoan(id);
			 
			 System.out.println("*****************loanProject********************");
			 System.out.println(loanProject);
			 
			 List<OperateRecord> operateRecord= operateRecordService.getoperator(loanProject.getProjectNo());
			 model.addAttribute("operateRecord", operateRecord);
			 model.addAttribute("loanProject", loanProject);
			 System.out.println("*************************************");
			 
			 System.out.println(operateRecord);
			 System.out.println("*************************************");
		return "loanprojectcheck";
		
	}

}
