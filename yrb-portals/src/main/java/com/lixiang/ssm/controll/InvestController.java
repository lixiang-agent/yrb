package com.lixiang.ssm.controll;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.InvRecord;
import com.lixiang.ssm.service.InvestService;

@Controller
@RequestMapping("/invest")
public class InvestController {
	@Autowired
	private InvestService investService;
	
	/**
	 * 资金记录分页查询
	 * @param model
	 * @param invRecords
	 * @return
	 */
	@RequestMapping("/investPageList")
	public String pageList(Integer projectStatus, Model model){
		if(projectStatus==null){
			projectStatus=60;
		}
		//1.查询投资信息
		InvRecord invRecord = new InvRecord();
		invRecord.setUserId(1);
		//2.累积本机和收益
		InvRecord accInvAndProfit = investService.acc(invRecord);
		model.addAttribute("accInvAndProfit", accInvAndProfit);
		
		//3.待收本金和收益
		InvRecord dueInInvAndProfi = investService.dueIn(invRecord);
		model.addAttribute("dueInInvAndProfi", dueInInvAndProfi);
		
		invRecord.setProjectStatus(projectStatus);
		PageInfo<InvRecord> investPages = investService.pageList(invRecord);
		model.addAttribute("investPages", investPages);
		
		return "user-conter_investor-record";
	}
	
}
