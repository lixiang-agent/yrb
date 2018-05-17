package com.lixiang.ssm.quartz.job;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lixiang.ssm.entity.ScheduleJob;
import com.lixiang.ssm.quartz.QuartzManager;
import com.lixiang.ssm.service.ScheduleJobService;

@Component
public class InitJob {
	protected Logger logger = Logger.getLogger(InitJob.class);

	@Autowired
	private ScheduleJobService service;
	@Autowired
	private QuartzManager quartzManager;

	/**
	 * 初始化全部任务
	 */
	public void initAllJob() {

		List<ScheduleJob> jobs = service.list(new ScheduleJob());
		if (CollectionUtils.isNotEmpty(jobs)) {
			for (ScheduleJob job : jobs) {
				if(job.getJobStatus()==1){
					quartzManager.initJob(job);
				}
			}
		}

	}

}
