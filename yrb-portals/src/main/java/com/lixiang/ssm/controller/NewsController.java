package com.lixiang.ssm.controller;

import java.util.List;
import java.util.Map;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lixiang.ssm.entity.InvProject;
import com.lixiang.ssm.entity.News;
import com.lixiang.ssm.service.NewsService;
import com.lixiang.ssm.service.ProjectService;
import com.lixiang.ssm.utils.RedisCacheUtil;

@Controller
public class NewsController {
	
	@Autowired
    private RedisCacheUtil<News> redisCacheNews;
	@Autowired
	private RedisCacheUtil<InvProject> redisCacheProjects;
	
	protected Logger log = Logger.getLogger(NewsController.class);
	
	@RequestMapping("/indexSearch")
	public String index(News news,Model model){
		//获取新闻信息
		Map<Integer,News> newsMap = redisCacheNews.getCacheIntegerMap("newsMap:index");
		model.addAttribute("newsMap", newsMap);
		
		//获取投资项目信息
		List<InvProject> invProjectsMap = redisCacheProjects.getCacheList("projectsList:index");
		model.addAttribute("projectsMap",invProjectsMap);
		
		//获取统计信息
		List<Double> countDateList = redisCacheProjects.getCacheList("CountDate:index");
		model.addAttribute("countDateList",countDateList);
		
		return "index";
	}
}
