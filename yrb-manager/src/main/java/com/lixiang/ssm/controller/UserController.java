package com.lixiang.ssm.controller;



import java.util.List;

import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.Role;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.service.RoleService;
import com.lixiang.ssm.service.UserService;

@RequestMapping("/user")
@Controller
@SessionAttributes(names={"msg"})
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	protected Logger log = Logger.getLogger(LoginController.class);
	
	@RequestMapping("/list")
	public String list(User user,Model model){
		log.debug("---------------->"+(user.getSex()));
		//封装了总数，封装了分页信息，封装了查询出来的数据
		PageInfo<User> page = userService.pageList(user);
		//角色下拉选项框
		List<Role> roles = roleService.getAllRoles();
		
		model.addAttribute("page", page);
		model.addAttribute("roles", roles);
		return "user-list";
	}
	@RequestMapping("/toUpdateUser")
	public String toUpdateUser(Integer id,Model model){
		User user = userService.getUserById(id);
		model.addAttribute("user",user);
		return "user-update";
	}
	
	

	


	@RequestMapping("/updateUser")
	public String updateUser(User user,String password1,String password2,Model model){

			if(password1.equals(password2)){
				user.setPassword(password2);
				boolean result = userService.updateUser(user);
				model.addAttribute("oper_result",result);				
			}
			return "redirect:list";

		}
	@RequestMapping("/unlockUser")
	public String unlockUser(Integer id,Model model){
		if(id!=null){
			boolean result = userService.unlockUser(id);
			model.addAttribute("oper_result",result);
		}
		return "redirect:list";
	}
}

