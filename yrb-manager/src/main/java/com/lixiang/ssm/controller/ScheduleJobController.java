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
 * 
 * @author YI
 *
 */
@Controller
@RequestMapping("/schedule")
public class ScheduleJobController {
	
	private final static Integer JOB_STATUS_RUN=1;
	private final static Integer JOB_STATUS_STOP=0;

	@Autowired
	private ScheduleJobService service;

	@Autowired
	private QuartzManager quartzManager;

	/**
	 * 查询任务的列表页面
	 * 
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(ScheduleJob scheduleJob, Model model) {
		// 查询数据
		PageInfo<ScheduleJob> page = service.pageList(scheduleJob);
		// 把查询的数据放在模型里面
		model.addAttribute("page", page);
		// 返回视图
		return "schedule/list";
	}
	/**
	 * 开启任务
	 * @param jobId 任务ID
	 * @param session session
	 * @return
	 */
	@RequestMapping("/start")
	public String start(Integer jobId, HttpSession session) {
		boolean result = false;
		if (jobId!=null) {
			ScheduleJob job = service.getScheduleJobById(jobId);

			if (job != null) {
				quartzManager.initJob(job);
				ScheduleJob scheduleJob = new ScheduleJob();
				scheduleJob.setJobId(jobId);
				scheduleJob.setJobStatus(JOB_STATUS_RUN);
				result = service.updateJob(scheduleJob);
			}
		}
		session.setAttribute("oper_result", result);
		return "redirect:/schedule/list";
	}
	
	/**
	 * 停止任务
	 * @param jobId
	 * @param session
	 * @return
	 */
	@RequestMapping("/stop")
	public String stop(Integer jobId, HttpSession session) {
		boolean result = false;
		if (jobId!=null) {
			ScheduleJob job = service.getScheduleJobById(jobId);
			if (job != null) {
				quartzManager.deleteJob(job);
				ScheduleJob scheduleJob = new ScheduleJob();
				scheduleJob.setJobId(jobId);
				scheduleJob.setJobStatus(JOB_STATUS_STOP);
				result = service.updateJob(scheduleJob);
			}
		}
		session.setAttribute("oper_result", result);
		return "redirect:/schedule/list";
	}
	/**
	 * 编辑任务
	 * 新增或者修改
	 * @param jobId
	 * @param model
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(Integer jobId, Model model) {
		ScheduleJob job = new ScheduleJob();
		if (jobId!=null) {
			job = service.getScheduleJobById(jobId);
		}
		model.addAttribute("job", job);
		return "schedule/edit";
	}
	/**
	 * 保存任务
	 * @param scheduleJob
	 * @param session
	 * @return
	 */
	@RequestMapping("/save")
	public String save(ScheduleJob scheduleJob, HttpSession session) {
		boolean result = false;
		//如果jobId不为空则是修改
		if (scheduleJob.getJobId()!=null) {
			scheduleJob.setJobStatus(JOB_STATUS_STOP);
			result = service.updateJob(scheduleJob);
		}else{
			result = service.insertJob(scheduleJob);
		}
		session.setAttribute("oper_result", result);
		return "redirect:/schedule/list";
	}

}
