package com.lixiang;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 * 定义任务
 * @author YI
 *
 */
public class MyJob implements Job{

	/**
	 * 任务具体要做的事情
	 */
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		
		System.out.println("我正在执行任务.....");
		
		
	}

}
