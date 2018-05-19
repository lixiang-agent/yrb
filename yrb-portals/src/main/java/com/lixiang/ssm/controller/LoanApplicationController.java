package com.lixiang.ssm.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
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
	public Map<String,String> loanApplication(HttpSession session,LoanApplication loanApplication,String code ){
		
		Map<String, String> map=new HashMap<String, String>();
		
		Subject currentUser = SecurityUtils.getSubject();
		UserInfo userInfo = (UserInfo) currentUser.getPrincipal();
		
		String codes = (String) session.getAttribute("code");
		
		String flag="0";
		
		String msg="申请信息已提交，请耐心等待！";
			
		if(userInfo == null){
			flag="1";
			msg="请先登录！";	
		}
		else if(userInfo.getRealName() == null && !userInfo.getRealName().equals(loanApplication.getRealName())){
			flag="2";
			msg="请输入真实姓名！";
		}
		else if(userInfo.getPhoneNum() == null && !userInfo.getPhoneNum().equals(loanApplication.getContactNumber())){
			flag="3";
			msg="请输入真实手机号码！";
		}
		else if(codes !=null && !codes.equalsIgnoreCase(code)){
			flag="4";
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
