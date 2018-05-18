package com.lixiang.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import com.lixiang.ssm.entity.InvProject;
import com.lixiang.ssm.entity.News;
import com.lixiang.ssm.job.IncreaseCountDateJob;
import com.lixiang.ssm.service.NewsService;
import com.lixiang.ssm.service.ProjectService;
import com.lixiang.ssm.utils.RedisCacheUtil;

 //* 监听器，用于项目启动的时候初始化信息
@Service
public class StartAddCacheListener implements ApplicationListener<ContextRefreshedEvent>{
    //日志
    private final Logger log= Logger.getLogger(StartAddCacheListener.class);
    
    private Scheduler scheduler;
    
    @Autowired
    private RedisCacheUtil<Object> redisCache;
    
    @Autowired
    private NewsService newsService;
    @Autowired
    private ProjectService projectService;
    
    @Override
    public void onApplicationEvent(ContextRefreshedEvent  event) {
        //spring 启动的时候缓存首页信息
        if(event.getApplicationContext().getDisplayName().equals("Root WebApplicationContext")){
        	//缓存公告和新闻等信息
            List<News> newsList = newsService.listIndexNews();
            Map<Integer,News> newsMap = new HashMap<Integer,News>();
            int newsListSize = newsList.size();
            for(int i = 0 ; i < newsListSize ; i ++ ){
                newsMap.put(newsList.get(i).getId(), newsList.get(i));
            }
            redisCache.setCacheIntegerMap("newsMap:index", newsMap);
            
            //缓存推荐项目，车易贷等项目
            List<InvProject> invProjectList = projectService.listIndexProjects();
            redisCache.setCacheList("projectsList:index", invProjectList);
            
            //缓存累计投资，本息等信息
			try {
			// 通过工厂的方式来创建调度器
			scheduler = StdSchedulerFactory.getDefaultScheduler();
			//创建任务数据
    		JobDetail job = JobBuilder.newJob(IncreaseCountDateJob.class).withIdentity("job1", "group1").build();
			
    		// Trigger the job to run now, and then repeat every 40 seconds
    		//创建触发器
    		Trigger trigger = TriggerBuilder.newTrigger().withIdentity("trigger1", "group1").startNow()
    				.withSchedule(SimpleScheduleBuilder.simpleSchedule().withIntervalInMinutes(60).repeatForever()).build();

    		// Tell quartz to schedule the job using our trigger
    		//把任务添加到调度器中
    		scheduler.scheduleJob(job, trigger);

    		// 启动任务调度器
    		scheduler.start();
    		
			} catch (SchedulerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    }
}