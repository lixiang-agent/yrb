package com.lixiang.ssm.job;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import org.jboss.logging.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.lixiang.ssm.controller.NewsController;
import com.lixiang.ssm.utils.RedisCacheUtil;

public class IncreaseCountDateJob implements Job{
	
	protected Logger log = Logger.getLogger(IncreaseCountDateJob.class);
	
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException{
		//获取IOC容器
		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
		//获取IOC容器里面的bean
		RedisCacheUtil<Object> redisCache = wac.getBean(RedisCacheUtil.class);
		
		//从redis里面获取首页统计信息
		List<BigDecimal> countDateCache = redisCache.getCacheList("CountDate:index");
		
		if(countDateCache == null||countDateCache.size()==0){
			countDateCache.add(new BigDecimal("1047288129.79"));
			countDateCache.add(new BigDecimal("400507750.81"));
			countDateCache.add(new BigDecimal("677679983.07"));
			countDateCache.add(new BigDecimal("20649"));
			redisCache.setCacheList("CountDate:index", countDateCache);
		}else{
			countDateCache.set(0, countDateCache.get(0).add(new BigDecimal(new Random().nextInt(9999)+(float)new Random().nextInt(99)/100).setScale(2, BigDecimal.ROUND_DOWN)));
			countDateCache.set(1, countDateCache.get(1).add(new BigDecimal(new Random().nextInt(999)+(float)new Random().nextInt(99)/100).setScale(2, BigDecimal.ROUND_DOWN)));
			countDateCache.set(2, countDateCache.get(2).add(new BigDecimal(new Random().nextInt(999)+(float)new Random().nextInt(99)/100).setScale(2, BigDecimal.ROUND_DOWN)));
			countDateCache.set(3, countDateCache.get(3).add(new BigDecimal(new Random().nextInt(99))));
			//将修改后的数据添加到redis缓存中
			redisCache.deleteCache("CountDate:index");
			redisCache.setCacheList("CountDate:index", countDateCache);
		}
	}
}
