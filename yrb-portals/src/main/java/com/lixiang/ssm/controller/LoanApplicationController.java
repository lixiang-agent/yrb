package com.lixiang.ssm.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lixiang.ssm.entity.LoanApplication;
import com.lixiang.ssm.entity.UserInfo;
import com.lixiang.ssm.service.LoanApplicationService;

@Controller
@RequestMapping("/loanApplicationController")
public class LoanApplicationController {

	@Autowired
	private LoanApplicationService loanApplicationService;
	
	/**
	 * 可以进行返回Map即JSON
	 * @param loanApplication
	 * @param bindingResult
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loanApplication")
	public Map<String,String> loanApplication(HttpSession session,@Valid LoanApplication loanApplication,BindingResult bindingResult,String code ){
		
		Map<String, String> map=new HashMap<String, String>();
		
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		
		String codes = (String) session.getAttribute("code");
		
		String flag="0";
		
		String msg="申请信息已提交，请耐心等待！";
		
		List<FieldError> errors = bindingResult.getFieldErrors();
		for(FieldError error:errors){
			System.out.println("QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ"+error);
		}
		
		if(userInfo == null){
			flag="1";
			msg="请先登录！";	
		}
		else if(bindingResult.getErrorCount()>0){
			flag="2";
			msg="输入信息有误，请先重写输入！";
		}
		else if(codes !=null && !codes.equalsIgnoreCase(code)){
			flag="3";
			msg="验证码错误！";
		}
		else{
			loanApplication.setUserId(userInfo.getId());
			loanApplication.setAppliyDate(new Date());
			loanApplicationService.addLoanApplication(loanApplication);
		}	
		map.put("flag", flag);
		map.put("msg", msg);
		return map;
	}
	
	
}
