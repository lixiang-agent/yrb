package com.lixiang.ssm.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.session.HttpServletSession;
import java.util.Arrays;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.Role;
import com.lixiang.ssm.entity.Ugroup;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.service.UserGroupService;



@Controller
@RequestMapping("/ugroup")
public class UserGroupController 
{
	Logger log =Logger.getLogger("");
	
	@Autowired
	private UserGroupService userGroupService;
	
	@RequestMapping("/list")
	public String list(Ugroup ugroup ,Model model){
		//封装了总数，封装了分页信息，封装了查询出来的数据
		PageInfo<Ugroup> page = userGroupService.pageList(ugroup);
		model.addAttribute("page", page);
		return "ugroup-list";
	}

	/**
	 * 去添加用户组
	 * @return
	 */
	@RequestMapping("/ugroupToAdd")
	public String ugroupAdd(Model model){	
		//可以获取当前用户id
		Subject currentUser = SecurityUtils.getSubject();
		User user = (User)currentUser.getPrincipal();
		model.addAttribute("user",user);
		
		return "ugroup-add";
	}
	
	/**
	 * 添加用户组
	 * @param ugroup
	 * @param model
	 * @return
	 */
	@RequestMapping("/ugroupAdd")
	public String add(Ugroup ugroup,Model model){
		boolean result=userGroupService.addUgroup(ugroup);
		model.addAttribute("result",result);
		return "redirect:/ugroup/list";
	}	
	
	/*
	 * 修改用户组普通信息
	 */
	@RequestMapping("/ugroupModify")
	public String ugroupModify(Ugroup ugroup,Model model)
	{
		userGroupService.ugroupModify(ugroup);
		return "redirect:/ugroup/list";
	}
	
	/**
	 * 显示用户组的用户
	 */
	@RequestMapping("/ugroupUsers")
	public String ugroupUsers(Ugroup ugroup,Model model)
	{
		PageInfo<User> page = userGroupService.ugroupUsers(ugroup);		
		model.addAttribute("page", page);
		model.addAttribute("ugroup",ugroup);
		return "ugroupusers";
	}
	
	/**
	 * 修改用户组的用户
	 */
	@RequestMapping("/ugroupUsersModify")
	public String ugroupUsersModify(int groupid ,int[] id)
	{
		userGroupService.ugroupUsersModify(groupid, id);
		return "redirect:/ugroup/ugroupUsers?id="+groupid;
	}
	

	/**
	 * 显示用户组的角色
	 */
	@RequestMapping("/ugroupRoles")
	public String ugroupRoles(Ugroup ugroup,Model model)
	{
		PageInfo<Role> page = userGroupService.ugroupRoles(ugroup);		
		model.addAttribute("page", page);
		model.addAttribute("ugroup",ugroup);
		return "ugrouproles";
	}
	
	/**
	 * 修改用户组的角色
	 */
	@RequestMapping("/ugroupRolesModify")
	public String ugroupRolesModify(int groupid ,int[] id)
	{
		userGroupService.ugroupRolesModify(groupid, id);
		return "redirect:/ugroup/ugroupRoles?id="+groupid;
	}
	
	/**
	 * 删除用户组
	 * id:用户组id
	 */
	@RequestMapping(path="deleteUgroup")
	public String deleteUgroup(String id){
		int uid=Integer.parseInt(id);
		//包装信息
		String msg="";
		if(userGroupService.deleteUgroup(uid)){
			msg="删除成功";
		}else{
			msg="删除失败";
		}
		return "redirect:list";
	}
}
