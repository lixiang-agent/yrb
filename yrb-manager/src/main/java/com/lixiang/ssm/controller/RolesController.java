package com.lixiang.ssm.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.Role;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.service.RoleService;


@Controller
public class RolesController {
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/getRolesList")
	public String getRolesList(Role role,Model model){
		PageInfo<Role> roles =roleService.pageList(role);
		model.addAttribute("roles",roles);
		return "roleslist";
		
	}
	@RequestMapping("/toaddRole")
	public String toInsertResources(){
		return "role-add";
	}
	
	@RequestMapping("/addRoles")
	public String InsertRoles(HttpServletRequest request,Role role,Model model){
		
		Subject currentUser = SecurityUtils.getSubject();
		
		User user = (User)currentUser.getPrincipal();
		role.setCreatorDate(new Date());
		role.setCreatorId(user.getId());
		boolean result = roleService.addRolesList(role);
		request.getSession().setAttribute("oper_result", result);
		return "redirect:/getRolesList";
	}
	
	@RequestMapping("/deleteRole")
	public String deleteRoleByRoleId(HttpServletRequest request,Integer id,Model model){
		boolean result = roleService.deleteRoleByRoleId(id);
		request.getSession().setAttribute("oper_result", result);
		return "redirect:/getRolesList";
	}
	

}
