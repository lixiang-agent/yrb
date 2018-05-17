package com.lixiang.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.SystemMessage;
import com.lixiang.ssm.entity.Ugroup;
import com.lixiang.ssm.service.SystemMessageService;

@RequestMapping("/sysmsg")
@Controller
public class SystemMessageController {

	
	@Autowired
	private SystemMessageService systemMessageService;
	
	/**
	 * 分页并查询
	 * @param systemMessage
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String istStystemMessage(SystemMessage systemMessage,Model model){
		//封装了总数，封装了分页信息，封装了查询出来的数据
		PageInfo<SystemMessage> page = systemMessageService.pageList(systemMessage);
		model.addAttribute("page", page);
		return "system-messages";
	}
}
