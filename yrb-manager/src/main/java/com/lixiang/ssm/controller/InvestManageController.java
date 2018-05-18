package com.lixiang.ssm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.InvProject;
import com.lixiang.ssm.entity.OperateRecord;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.service.InvManageService;

@RequestMapping("/investManage")
@Controller
public class InvestManageController {

	@Autowired
	private InvManageService invManageService;
	
	protected Logger log = Logger.getLogger(LoginController.class);

	
	//项目总览controller
	@RequestMapping("/subProject")
	public String submitProject(Integer id, Model model, HttpSession session) {
		Subject currentUser = SecurityUtils.getSubject();
		User result = (User) currentUser.getPrincipal();
		boolean oper_result = invManageService.updateProjectStatus(20,id);
		InvProject inv = invManageService.selectByPrimaryKey(id);
		OperateRecord operRecord = new OperateRecord(null,1,new Date(),inv.getProjectType(),id,result.getId(),result.getUsername(),"提交");
		invManageService.insertSelective(operRecord);
		session.setAttribute("oper_result", oper_result);
		return "redirect:/investManage/pageList";
	}

	@RequestMapping("/pageList")
	public String list(InvProject invProject, Model model) {
		// 封装了总数，封装了分页信息，封装了查询出来的数据
		PageInfo<InvProject> inv = invManageService.pageList(invProject);
		model.addAttribute("inv", inv);
		return "invproject-list";
	}
	
	@RequestMapping("/detailsList")
	public String detailsList(Integer id, Model model) {
		// 封装了总数，封装了分页信息，封装了查询出来的数据
		InvProject invProject = invManageService.selectByPrimaryKey(id);
		model.addAttribute("invProject", invProject);
		return "invproject-details";
	}
	
	@RequestMapping("/toDel")
	public String toDelInvProject(Integer id,Model model){
		InvProject invProject = invManageService.selectByPrimaryKey(id);
		model.addAttribute("invProject", invProject);
		return "invproject-del";
	}
	

	@RequestMapping("/delInvProject")
	public String delInvProject(@RequestParam Integer id,Model model,HttpSession session){
		int result = invManageService.deleteByPrimaryKey(id);
		System.out.println(result);
		model.addAttribute("result", result);
		session.setAttribute("oper_result", result>0);
		return "redirect:/investManage/pageList";
	}
	
	@RequestMapping("/toInsert")
	public String toInsertInvProject() {
		return "invproject-add";
	}

	@RequestMapping("/insert")
	public String insertProject(InvProject invProject, Model model, HttpSession session) {
		Subject currentUser = SecurityUtils.getSubject();
		User result = (User) currentUser.getPrincipal();
		SimpleDateFormat time = new SimpleDateFormat("yyyyMMddHH");
		String time1 = time.format(new Date());
		invProject.setInvNo(new Integer(time1));
		invProject.setCreatorId(result.getId());
		invProject.setCreatorName(result.getUsername());
		invProject.setProjectStatus(10);
		invProject.setResource(2);
		int invPro = invManageService.insertSelective(invProject);
		model.addAttribute("invPro", invPro);
		session.setAttribute("oper_result", invPro > 0);
		model.addAttribute("result", result);
		return "redirect:/investManage/pageList";
	}
	
	@RequestMapping("/toUpdate")
	public String toUpdateInvPro(Integer id,Model model){
		
		InvProject invProject = invManageService.selectByPrimaryKey(id);
		model.addAttribute("invProject", invProject);
		return "invproject-update";
	}
	
	@RequestMapping("/update")
	public String updateProject(InvProject invProject,Model model,HttpSession session) throws ParseException{
		Subject currentUser = SecurityUtils.getSubject();
		User result = (User) currentUser.getPrincipal();
		invProject.setModifiorId(result.getId());
		invProject.setModifiorName(result.getUsername());
		
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH-mm:ss");
		String time1 = time.format(new Date());
		invProject.setModifyDate(time.parse(time1));
		
		int invPro = invManageService.updateByPrimaryKeySelective(invProject);
		model.addAttribute("invProject", invPro);
		session.setAttribute("oper_result", invPro>0);
		model.addAttribute("result", result);
		return "redirect:/investManage/pageList";
	}
	
	
	//审核项目相关controller
	@RequestMapping("/listOperProject")
	public String listOperProject(InvProject invProject, Model model){
		// 封装了总数，封装了分页信息，封装了查询出来的数据
		PageInfo<InvProject> inv = invManageService.listOperProject(invProject);
		model.addAttribute("inv", inv);
		
		return "oper-record-list";
	}
	
	@RequestMapping("/showOperRecord")
	public String showOperRecord(OperateRecord operateRecord,Model model){
		List<OperateRecord> showList = invManageService.queryOperRecord(operateRecord);
		model.addAttribute("showList", showList);
		return "oper-record-show";
	}
	
	
	@RequestMapping("/toPass")
	public String toPassOperProject(Integer id,Model model){
		InvProject invProject = invManageService.selectByPrimaryKey(id);
		model.addAttribute("invProject", invProject);
		return "oper-record-pass";
	}
	
	@RequestMapping("/passOper")
	public String passOperProject(Integer id,Model model,HttpSession session) throws ParseException{
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH-mm:ss");
		String time1 = time.format(new Date());
		
		boolean oper_result = invManageService.updateProjectStatus(30,id);
		InvProject inv = invManageService.selectByPrimaryKey(id);
		OperateRecord operRecord = new OperateRecord(null,2,time.parse(time1),inv.getProjectType(),id,inv.getModifiorId(),inv.getModifiorName(),"审核通过");
		invManageService.insertSelective(operRecord);
		
		session.setAttribute("oper_result", oper_result);
		return "redirect:/investManage/listOperProject";
	}
	
	@RequestMapping("/toFail")
	public String toFailOperProject(Integer id,Model model){
		InvProject invProject = invManageService.selectByPrimaryKey(id);
		model.addAttribute("invProject", invProject);
		return "oper-record-fail";
	}
	
	@RequestMapping("/failOper")
	public String failOperProject(OperateRecord operateRecord,Integer id,Model model,HttpSession session) throws ParseException{
		boolean oper_result = invManageService.updateProjectStatus(11,id);
		InvProject inv = invManageService.selectByPrimaryKey(id);
		OperateRecord operRecord = new OperateRecord(null,3,new Date(),inv.getProjectType(),id,inv.getModifiorId(),inv.getModifiorName(),operateRecord.getRemark());
		invManageService.insertSelective(operRecord);
		
		session.setAttribute("oper_result", oper_result);
		return "redirect:/investManage/listOperProject";
	}
	
	@RequestMapping("/toRelease")
	public String toReleaseProject(Integer id,Model model){
		InvProject invProject = invManageService.selectByPrimaryKey(id);
		model.addAttribute("invProject", invProject);
		return "oper-record-release";
	}
	@RequestMapping("/releaseOper")
	public String releaseOperProject(InvProject invProject,Model model,HttpSession session) throws ParseException{
		boolean oper_result = invManageService.updateProjectStatus(40,invProject.getId());
		System.out.println("项目id："+invProject.getId());
		InvProject inv = invManageService.selectByPrimaryKey(invProject.getId());
		inv.setBiddingDate(new Date());
		inv.setFinancingEndTime(invProject.getFinancingEndTime());
		System.out.println("筹款解说时间："+invProject.getFinancingEndTime());
		invManageService.updateByPrimaryKeySelective(inv);
		OperateRecord operRecord = new OperateRecord(null,5,new Date() ,inv.getProjectType(),invProject.getId(),inv.getModifiorId(),inv.getModifiorName(),"项目发布");
		invManageService.insertSelective(operRecord);
		
		session.setAttribute("oper_result", oper_result);
		return "redirect:/investManage/listServiceProject";
	}
	
	@RequestMapping("/listServiceProject")
	public String listServiceProject(InvProject invProject, Model model) {
		// 封装了总数，封装了分页信息，封装了查询出来的数据
		PageInfo<InvProject> inv = invManageService.listServiceProject(invProject);
		model.addAttribute("inv", inv);
		return "service-oper-list";
	}
}
