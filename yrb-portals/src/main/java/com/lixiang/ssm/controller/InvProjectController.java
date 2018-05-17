package com.lixiang.ssm.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lixiang.ssm.entity.InvProject;
import com.lixiang.ssm.service.InvProjectService;
/**
 * 前台项目列表查询控制
 * @author Administrator
 *
 */
@Controller
@RequestMapping(path="/invProject/")
public class InvProjectController {
	protected Log log=LogFactory.getLog(InvProjectController.class);
	
	@Autowired
	private InvProjectService invProjectService;
	/**
	 * 用来查询无条件的投资项目
	 * @param invProject  包装查询条件
	 * @param model
	 * @return 返回视图
	 */
	@RequestMapping(path="list")
	public String ListByAll(InvProject invProject,Model model){
		
		List<InvProject> listInvProject = invProjectService.ListByInvProject(invProject,null,null);
		
		model.addAttribute("listInvProject", listInvProject);
		
		return "invProjectList";
		
	}
	/**
	 * 用来投资项目条件查询
	 * @param invProject 包装查询条件
	 * @param order 包装排序条件
	 * @return 返回json类型数据
	 */
	@ResponseBody
	@RequestMapping(path="listByInvProject")
	public List<InvProject> ListByInvProject(InvProject invProject,String orderBy,Integer orderMethod){
		
		List<InvProject> listInvProject = invProjectService.ListByInvProject(invProject,orderBy,orderMethod);
		log.error(listInvProject);
		return listInvProject;
		
	}
	
}
