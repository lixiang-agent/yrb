package com.lixiang.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.Redpacket;
import com.lixiang.ssm.entity.SystemMessage;
import com.lixiang.ssm.service.RedpacketService;

@Controller
@RequestMapping("/redpacket")
public class RedpacketController {
		
	@Autowired
	private RedpacketService redpacketService;
	
	/**
	 * 分页并查询
	 * @param redpacket
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String listRedpacket(Redpacket redpacket,Model model){
		//封装了总数，封装了分页信息，封装了查询出来的数据
		PageInfo<Redpacket> page = redpacketService.pageList(redpacket);
		model.addAttribute("page", page);
		return "red-packet";
	}
}
