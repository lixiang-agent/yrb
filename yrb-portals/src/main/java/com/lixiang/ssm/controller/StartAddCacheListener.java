package com.lixiang.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import com.lixiang.ssm.entity.News;
import com.lixiang.ssm.service.NewsService;
import com.lixiang.ssm.utils.RedisCacheUtil;

 //* 监听器，用于项目启动的时候初始化信息
@Service
public class StartAddCacheListener implements ApplicationListener<ContextRefreshedEvent>{
    //日志
    private final Logger log= Logger.getLogger(StartAddCacheListener.class);
    
    @Autowired
    private RedisCacheUtil<Object> redisCache;
    
    @Autowired
    private NewsService newsService;
    
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
            redisCache.setCacheIntegerMap("newsMap:new", newsMap);
            
            //缓存累计投资，本息等信息
            
            
        }
    }
}