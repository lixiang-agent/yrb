package com.lixiang.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.InvProject;
import com.lixiang.ssm.entity.Resources;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.service.InvManageService;

@RequestMapping("/investManage")
@Controller
public class InvestManageController {

	@Autowired
	private InvManageService invManageService;
	protected Logger log = Logger.getLogger(LoginController.class);

	@RequestMapping("/subProject")
	public String submitProject(Integer id, Model model, HttpSession session) {

		boolean oper_result = invManageService.updateProjectStatus(id);
		session.setAttribute("oper_result", oper_result);
		return "redirect:/investManage/pageList";
	}

	@RequestMapping("/pageList")
	public String list(InvProject invProject, Model model) {
		// 封装了总数，封装了分页信息，封装了查询出来的数据
		PageInfo<InvProject> inv = invManageService.pageList(invProject);
		model.addAttribute("inv", inv);
		return "invproject-list";
	}
	
	
	@RequestMapping("/toDel")
	public String toDelInvProject(Integer id,Model model){
		InvProject invProject = invManageService.selectByPrimaryKey(id);
		model.addAttribute("invProject", invProject);
		return "invproject-del";
	}
	

	@RequestMapping("/delInvProject")
	public String delInvProject(@RequestParam Integer id,Model model,HttpSession session){
		int result = invManageService.deleteByPrimaryKey(id);
		System.out.println(result);
		model.addAttribute("result", result);
		session.setAttribute("oper_result", result>0);
		return "redirect:/investManage/pageList";
	}
	
	@RequestMapping("/toInsert")
	public String toInsertInvProject() {
		return "invproject-add";
	}

	@RequestMapping("/insert")
	public String insertResources(InvProject invProject, Model model, HttpSession session) {
		Subject currentUser = SecurityUtils.getSubject();
		User result = (User) currentUser.getPrincipal();
		SimpleDateFormat time = new SimpleDateFormat("yyyyMMddHH");
		String time1 = time.format(new Date());
		invProject.setInvNo(new Integer(time1));
		invProject.setCreatorId(result.getId());
		invProject.setCreatorName(result.getUsername());
		invProject.setProjectStatus(10);
		invProject.setResource(2);
		int invPro = invManageService.insertSelective(invProject);
		model.addAttribute("invPro", invPro);
		session.setAttribute("oper_result", invPro > 0);
		model.addAttribute("result", result);
		return "redirect:/investManage/pageList";
	}
	
	@RequestMapping("/toUpdate")
	public String toUpdateInvPro(Integer id,Model model){
		
		InvProject invProject = invManageService.selectByPrimaryKey(id);
		model.addAttribute("invProject", invProject);
		return "invproject-update";
	}
	
	@RequestMapping("/update")
	public String UpdateResources(InvProject invProject,Model model,HttpSession session){
		Subject currentUser = SecurityUtils.getSubject();
		User result = (User) currentUser.getPrincipal();
		invProject.setModifiorId(result.getId());
		invProject.setModifiorName(result.getUsername());
		invProject.setModifyDate(new Date());
		int invPro = invManageService.updateByPrimaryKeySelective(invProject);
		model.addAttribute("invProject", invPro);
		session.setAttribute("oper_result", invPro>0);
		model.addAttribute("result", result);
		return "redirect:/investManage/pageList";
	}
}
