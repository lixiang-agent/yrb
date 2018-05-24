package com.lixiang.ssm.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixiang.ssm.dao.NewsMapper;
import com.lixiang.ssm.dao.UserMapper;
import com.lixiang.ssm.entity.News;
import com.lixiang.ssm.service.UserService;

@Service
public class NewsService {
	protected Logger log = Logger.getLogger(UserService.class);
	@Autowired
	private NewsMapper newsMapper;
	
	public List<News> listIndexNews(){
		return newsMapper.listIndexNews();
	}
}
