package com.lixiang;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.ScheduleBuilder;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class JobTest {
	
	public static void main(String[] args) throws SchedulerException {

		// 通过工厂的方式来创建调度器
		Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
		//创建任务数据
		JobDetail job = JobBuilder.newJob(MyJob.class).withIdentity("job1", "group1").build();
		JobDetail job2 = JobBuilder.newJob(MyJob.class).withIdentity("job2", "group1").build();

		// Trigger the job to run now, and then repeat every 40 seconds
		//创建触发器
		Trigger trigger = TriggerBuilder.newTrigger().withIdentity("trigger1", "group1").startNow()
				.withSchedule(SimpleScheduleBuilder.simpleSchedule().withIntervalInSeconds(10).repeatForever()).build();

		// Tell quartz to schedule the job using our trigger
		//把任务添加到调度器中
		scheduler.scheduleJob(job, trigger);
		scheduler.scheduleJob(job2, trigger);

		// 启动任务调度器
		scheduler.start();

	}

}
