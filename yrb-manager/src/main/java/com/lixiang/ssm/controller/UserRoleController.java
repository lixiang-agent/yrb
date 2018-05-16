package com.lixiang.ssm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lixiang.ssm.entity.Resources;
import com.lixiang.ssm.entity.Role;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.service.RoleService;

@Controller
public class UserRoleController {

	@Autowired
	private RoleService roleService;
	
	protected Logger log = Logger.getLogger(LoginController.class);
	/**
	 * 跳转到修改角色的页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/editUserRole")
	public String toUpdateRole(Integer id,Model model){
		List<Role> roles = roleService.getRolesForUserId(id);
		model.addAttribute("roles", roles);
		return "user-role-edit";
	}
	
	
	@RequestMapping("/updateSaveRole")
	public String updateSaveRole(HttpServletRequest request,Integer userId,int[] role, Model model){
		boolean result = roleService.updateUserRole(userId, role);
		request.getSession().setAttribute("oper_result", result);
		return "redirect:/user/list";
	}
	
	/**
	 * 跳转到修改资源的页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/editRoleRes")
	public String toUpdateRes(Integer id,Model model){
		System.out.println("当前角色的id"+id);
		List<Resources> res = roleService.getResForRoleId(id);
		model.addAttribute("resources", res);
		return "role-res-edit";
	}
	
	@RequestMapping("/updateSaveRes")
	public String updateSaveRes(HttpServletRequest request,Integer roleId,int[] res, Model model){
		boolean result = roleService.updateRoleRes(roleId, res);
		request.getSession().setAttribute("oper_result", result);
		return "redirect:/getRolesList";
	}
	
	@RequestMapping("/toUpdateRoleInfo")
	public String toUpdateRoleInfo(Integer id,Model model){
		Role roles = roleService.selectByPrimaryKey(id);
		model.addAttribute("roles", roles);
		return "update-role";
	}
	
	@RequestMapping("/updateSaveRoleInfo")
	public String updateSaveRoleInfo(HttpServletRequest request,Role roles, Model model){
		Subject currentUser = SecurityUtils.getSubject();
		User result = (User) currentUser.getPrincipal();
		roles.setModifiorId(result.getId());
		roles.setModifyDate(new Date());
		log.debug("result="+result);
		boolean role = roleService.updateByPrimaryKey(roles);
		log.debug("resource="+role);
		model.addAttribute("role", role);
		model.addAttribute("result", result);
		request.getSession().setAttribute("oper_result", role);
		return "redirect:/getRolesList";
	}
	
}
