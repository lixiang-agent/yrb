package com.lixiang.ssm.quartz.job;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.lixiang.ssm.redis.RedisUtil;

/**
 * 计算平台总数的任务
 * 1.计算总投资数
 * 2.计算平台注册的总人数
 * 3.计算平台总收入
 * 4.计算平台的总收益
 * @author YI
 *
 */
public class PlatformCountJob implements Job{
	
	protected Logger log = Logger.getLogger(PlatformCountJob.class);

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		//获取IOC容器
		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
		//获取IOC容器里面的bean
		RedisUtil util = wac.getBean(RedisUtil.class);
		System.out.println(util);
		
		log.debug("开会执行计算平台总数的任务,当前时间:"+System.currentTimeMillis());
		
		System.out.println("执行任务......");
		log.debug("计算平台总数的任务结束,当前时间:"+System.currentTimeMillis());
	}

}
