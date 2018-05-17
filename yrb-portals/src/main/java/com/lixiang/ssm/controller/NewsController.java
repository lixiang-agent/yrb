package com.lixiang.ssm.controller;

import java.util.Map;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lixiang.ssm.entity.News;
import com.lixiang.ssm.service.NewsService;
import com.lixiang.ssm.utils.RedisCacheUtil;

@Controller
public class NewsController {

	@Autowired
	private NewsService newsService;
	
	@Autowired
    private RedisCacheUtil<News> redisCache;
	
	protected Logger log = Logger.getLogger(NewsController.class);
	
	@RequestMapping("/indexSearch")
	public String index(News news,Model model){
		Map<Integer,News> newsMap = redisCache.getCacheIntegerMap("newsMap:new");
		
		 for(Integer key : newsMap.keySet()){
	            System.out.println("key = " + key + ",value=" + newsMap.get(key));
	            System.out.println(newsMap.get(key).getTitle());
	     }
		
		model.addAttribute("newsMap", newsMap);
		return "index";
	}
}
