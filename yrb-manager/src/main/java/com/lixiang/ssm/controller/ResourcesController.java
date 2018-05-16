package com.lixiang.ssm.controller;

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
import com.lixiang.ssm.entity.Resources;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.service.ResourcesService;

@RequestMapping("/resources")
@Controller
public class ResourcesController {
	
	@Autowired
	private ResourcesService resourcesService;
	protected Logger log = Logger.getLogger(LoginController.class);
	/**
	 * 分页和查询全部
	 * @param resources
	 * @param model
	 * @return
	 */
	@RequestMapping("/pageList")
	public String list(Resources resources,Model model){
		//封装了总数，封装了分页信息，封装了查询出来的数据
		PageInfo<Resources> page = resourcesService.pageList(resources);
		model.addAttribute("page", page);
		return "resource-list";
		
	}
	
	@RequestMapping("/toDel")
	public String toDelResource(Integer id,Model model){
		Resources resources = resourcesService.selectByPrimaryKey(id);
		model.addAttribute("resources", resources);
		return "resources-del";
	}
	/**
	 * 删除
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/delResources")
	public String delectResources(@RequestParam Integer id,Model model,HttpSession session){
		int result = resourcesService.deleteByPrimaryKey(id);
		model.addAttribute("result", result);
		session.setAttribute("oper_result", result>0);
		return "redirect:/resources/pageList";
	}
	/**
	 * 去更新
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toUpdate")
	public String toUpdateResources(Integer id,Model model){
		Resources resources = resourcesService.selectByPrimaryKey(id);
		model.addAttribute("resources", resources);
		return "resources-update";
	}
	
	/**
	 * 更新
	 * @param resources
	 * @param model
	 * @return
	 */
	@RequestMapping("/update")
	public String UpdateResources(@Valid BindingResult bindingResult,Resources resources,Model model,HttpSession session){
		Subject currentUser = SecurityUtils.getSubject();
		User result = (User) currentUser.getPrincipal();
		resources.setModifiorId(result.getId());
		resources.setModifyDate(new Date());
		int resource = resourcesService.updateByPrimaryKey(resources);
		model.addAttribute("resource", resource);
		session.setAttribute("oper_result", resource>0);
		model.addAttribute("result", result);
		return "redirect:/resources/pageList";
	}
	
	@RequestMapping("/toInsert")
	public String toInsertResources(){
		return "resources-add";
	}
	
	@RequestMapping("/insert")
	public String InsertResources(@Valid BindingResult bindingResult,Resources resources,Model model,HttpSession session){
		Subject currentUser = SecurityUtils.getSubject();
		User result = (User) currentUser.getPrincipal();
		resources.setCreatorId(result.getId());
		resources.setCreateDate(new Date());
		int resource = resourcesService.insert(resources);
		model.addAttribute("resource", resource);
		session.setAttribute("oper_result", resource>0);
		model.addAttribute("result", result);
		return "redirect:/resources/pageList";
	}
}
