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
	public String pageList(Model model,InvRecord invRecords){
		InvRecord invRecord = new InvRecord();
		invRecord.setUserId(1);
		PageInfo<InvRecord> investPages = investService.pageList(invRecord);
		model.addAttribute("investPages", investPages);
		return "user-conter_investor-record";
	}
}
