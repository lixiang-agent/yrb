package com.lixiang.ssm.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.ScheduleJob;
import com.lixiang.ssm.quartz.QuartzManager;
import com.lixiang.ssm.service.ScheduleJobService;
/**
 * 定时任务的控制器
 * @author YI
 *
 */
@Controller
@RequestMapping("/schedule")
public class ScheduleJobController {
	
	@Autowired
	private ScheduleJobService service;
	
	@Autowired
	private QuartzManager quartzManager;
	
	/**
	 * 查询任务的列表页面
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(ScheduleJob scheduleJob,Model model){
		//查询数据
		PageInfo<ScheduleJob> page = service.pageList(scheduleJob);
		//把查询的数据放在模型里面
		model.addAttribute("page", page);
		//返回视图
		return "schedule/list";
	}
	
	@RequestMapping("/start")
	public String start(String jobId,HttpSession session){
		boolean result = false;
		if(StringUtils.isNotBlank(jobId)){
			ScheduleJob job = service.getScheduleJobById(jobId);
			
			if(job!=null){
				quartzManager.initJob(job);
				ScheduleJob scheduleJob = new ScheduleJob();
				scheduleJob.setJobId(jobId);
				scheduleJob.setJobStatus(1);
				result=service.updateJob(scheduleJob);
			}
		}
		
		session.setAttribute("oper_result", result);
		
		return "redirect:/schedule/list";
	}
	
	@RequestMapping("/stop")
	public String stop(String jobId,HttpSession session){
		boolean result = false;
		if(StringUtils.isNotBlank(jobId)){
			ScheduleJob job = service.getScheduleJobById(jobId);
			if(job!=null){
				quartzManager.deleteJob(job);
				ScheduleJob scheduleJob = new ScheduleJob();
				scheduleJob.setJobId(jobId);
				scheduleJob.setJobStatus(0);
				result=service.updateJob(scheduleJob);
			}
		}
		session.setAttribute("oper_result", result);
		return "redirect:/schedule/list";
	}
	
}
