package com.lixiang.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lixiang.ssm.entity.InvProject;
import com.lixiang.ssm.service.InvProjectService;
/**
 * 项目列表查询控制
 * @author Administrator
 *
 */
@Controller
@RequestMapping(path="/invProject/")
public class InvProjectController {
	
	@Autowired
	private InvProjectService invProjectService;
	
	@RequestMapping(path="list")
	public String ListByInvProject(InvProject invProject,Model model){
		
		List<InvProject> listInvProject = invProjectService.ListByInvProject(invProject);
		
		model.addAttribute("listInvProject", listInvProject);
		
		return "invProjectList";
		
	}
	
}
