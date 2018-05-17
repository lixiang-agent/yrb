package com.lixiang.ssm.quartz;


import org.apache.log4j.Logger;
import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.impl.StdScheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lixiang.ssm.entity.ScheduleJob;

/**
 * 任务调度管理类
 *  延迟加载...
 * @author YI
 *
 */
@Component
public class QuartzManager {
	private static final Logger logger = Logger.getLogger(QuartzManager.class.getName());
	
	@Autowired
	private Scheduler scheduler;

	

	/**
	 * @param scheduler
	 *            the scheduler to set
	 */
	public void setScheduler(StdScheduler scheduler) {
		this.scheduler = scheduler;
	}

	

	/**
	 * 初始化任务
	 * 
	 * @param job
	 * @param cls
	 */
	public void initJob(ScheduleJob job) {
		logger.info("初始化任务调度");
		try {
			TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());
			CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
			if (null == trigger) {
				addQuartzJob(job, trigger);
			}
		} catch (Exception e) {
			logger.error("初始化任务调度异常！" + e.getMessage(), e);
		}
	}

	/**
	 * 向任务调度中添加定时任务
	 * 
	 * @param job
	 *            定时任务信息
	 * @param trigger
	 *            定时调度触发器
	 */
	private void addQuartzJob(ScheduleJob job, CronTrigger trigger) {
		logger.info("向任务调度中添加定时任务");
		try {
			Class jobClass = Class.forName(job.getJobClass());
			JobDetail jobDetail = JobBuilder.newJob(jobClass).withIdentity(job.getJobName(), job.getJobGroup()).build();
			jobDetail.getJobDataMap().put(job.getJobName(), job);
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
			trigger = TriggerBuilder.newTrigger().withIdentity(job.getJobName(), job.getJobGroup())
					.withSchedule(scheduleBuilder).build();
			scheduler.scheduleJob(jobDetail, trigger);
		} catch (Exception e) {
			logger.error("向任务调度中添加定时任务异常！" + e.getMessage(), e);
		}
	}

	/**
	 * 立即运行定时任务
	 * 
	 * @param job
	 *            定时任务信息
	 */
	void runJob(ScheduleJob job) {
		logger.info("立即运行任务调度中的定时任务");
		try {
			if (null == job) {
				logger.info("定时任务信息为空，无法立即运行");
				return;
			}
			JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
			if (null == jobKey) {
				logger.info("任务调度中不存在[" + job.getJobName() + "]定时任务，不予立即运行！");
				return;
			}
			scheduler.triggerJob(jobKey);
		} catch (Exception e) {
			logger.error("立即运行任务调度中的定时任务异常！" + e.getMessage(), e);
		}
	}

	/**
	 * 修改任务调度中的定时任务
	 * 
	 * @param job
	 *            定时任务信息
	 * @param triggerKey
	 *            定时调度触发键
	 * @param trigger
	 *            定时调度触发器
	 */
	void updateQuartzJob(ScheduleJob job, TriggerKey triggerKey, CronTrigger trigger) {
		logger.info("修改任务调度中的定时任务");
		try {
			if (null == job || null == triggerKey || null == trigger) {
				logger.info("修改调度任务参数不正常！");
				return;
			}
			logger.info("原始任务表达式:" + trigger.getCronExpression() + "，现在任务表达式:" + job.getCronExpression());
			if (trigger.getCronExpression().equals(job.getCronExpression())) {
				logger.info("任务调度表达式一致，不予进行修改！");
				return;
			}
			logger.info("任务调度表达式不一致，进行修改");
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
			trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
			scheduler.rescheduleJob(triggerKey, trigger);
		} catch (Exception e) {
			logger.error("修改任务调度中的定时任务异常！" + e.getMessage(), e);
		}
	}

	/**
	 * 暂停任务调度中的定时任务
	 * 
	 * @param job
	 *            定时任务信息
	 */
	void pauseJob(ScheduleJob job) {
		logger.info("暂停任务调度中的定时任务");
		try {
			if (null == job) {
				logger.info("暂停调度任务参数不正常！");
				return;
			}
			JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
			if (null == jobKey) {
				logger.info("任务调度中不存在[" + job.getJobName() + "]定时任务，不予进行暂停！");
				return;
			}
			scheduler.pauseJob(jobKey);
		} catch (Exception e) {
			logger.error("暂停任务调度中的定时任务异常！" + e.getMessage(), e);
		}
	}

	/**
	 * 恢复任务调度中的定时任务
	 * 
	 * @param job
	 *            定时任务信息
	 */
	void resumeJob(ScheduleJob job) {
		logger.info("恢复任务调度中的定时任务");
		try {
			if (null == job) {
				logger.info("恢复调度任务参数不正常！");
				return;
			}
			JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
			if (null == jobKey) {
				logger.info("任务调度中不存在[" + job.getJobName() + "]定时任务，不予进行恢复！");
				return;
			}
			scheduler.resumeJob(jobKey);
		} catch (Exception e) {
			logger.error("恢复任务调度中的定时任务异常！" + e.getMessage(), e);
		}
	}

	/**
	 * 删除任务调度中的定时任务
	 * 
	 * @param job
	 *            定时任务信息
	 */
	public void deleteJob(ScheduleJob job) {
		logger.info("删除任务调度中的定时任务");
		try {
			if (null == job) {
				logger.info("删除调度任务参数不正常！");
				return;
			}
			JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
			if (null == jobKey) {
				logger.info("任务调度中不存在[" + job.getJobName() + "]定时任务，不予进行删除！");
				return;
			}
			scheduler.deleteJob(jobKey);
		} catch (Exception e) {
			logger.error("删除任务调度中的定时任务异常！" + e.getMessage(), e);
		}
	}

	/**
	 * 删除任务调度定时器
	 * 
	 * @param triggerKey
	 */
	void deleteJob(TriggerKey triggerKey) {
		logger.info("删除任务调度定时器");
		try {
			if (null == triggerKey) {
				logger.info("停止任务定时器参数不正常，不予进行停止！");
				return;
			}
			logger.info("停止任务定时器");
			scheduler.pauseTrigger(triggerKey);
			scheduler.unscheduleJob(triggerKey);
		} catch (Exception e) {
			logger.info("删除任务调度定时器异常！" + e.getMessage(), e);
		}
	}
}
