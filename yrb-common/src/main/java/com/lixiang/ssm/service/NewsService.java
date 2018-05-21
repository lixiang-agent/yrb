package com.lixiang.ssm.service;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.NewsMapper;
import com.lixiang.ssm.dao.UserMapper;
import com.lixiang.ssm.entity.News;
import com.lixiang.ssm.entity.User;

@Service
public class NewsService {
	protected Logger log = Logger.getLogger(NewsService.class);
	@Autowired
	private NewsMapper mapper;
	@Autowired
	private UserMapper usermapper;
	
	/**
	 * 添加新闻
	 * @param news
	 * @param bindingResult
	 * @param model
	 * @return
	 */
	@Transactional
	public boolean addNews(News news){
		
		Subject currentUser = SecurityUtils.getSubject();
		User user = (User)currentUser.getPrincipal();
		log.debug(user.getUsername());
		news.setCreatorName(user.getUsername());
		news.setCreateDate(new Date());
		return mapper.insertSelective(news)>0;
	}
	/**
	 * 修改新闻
	 * @param news
	 * @param bindingResult
	 * @param model
	 * @return
	 */
	@Transactional
	public boolean updateNews(News news){
		return mapper.updateByPrimaryKeySelective(news)>0;
	}
	/**
	 * 删除新闻
	 * @param id
	 * @param model
	 * @return
	 */
	@Transactional
	public boolean deleteNews(Integer id){
		return mapper.deleteByPrimaryKey(id)>0;
	}
	/**
	 * 根据id查询信息
	 * @param id
	 * @param model
	 * @return
	 */
	public News getNewsById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	/**
	 * 修改新闻发布状态
	 * @param news
	 * @param model
	 * @return
	 */
	public boolean updateNewsStatusById(News news){
		Subject currentUser = SecurityUtils.getSubject();
		User user = (User)currentUser.getPrincipal();
		log.debug(user.getUsername());
		news.setPublisherName(user.getUsername());
		news.setPublishDate(new Date());
		news.setStatus(true);
		return mapper.updateNewsStatusById(news)>0;
	}
	/**
	 * 批量修改新闻发布状态
	 * @param news
	 * @param model
	 * @return
	 */
	public boolean bathUpdateNewsStatusById(String id){
		String[] nid = id.split(",");
		for(String newsid:nid){
		News news = new News(); 
		news.setId(Integer.parseInt(newsid));
		Subject currentUser = SecurityUtils.getSubject();
		User user = (User)currentUser.getPrincipal();
		log.debug(user.getUsername());
		news.setPublisherName(user.getUsername());
		news.setPublishDate(new Date());
		news.setStatus(true);
		mapper.updateNewsStatusById(news);
		}
		return true;
	}
	/**
	 * 查询显示信息
	 * @param news
	 * @param model
	 * @return
	 */
	public PageInfo<News> pageList(News news) {
		// 获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(news.getPageNum(), news.getPageSize());
		// 查询语句
		List<News> list = mapper.list(news);
		PageInfo<News> page = new PageInfo<>(list);
		return page;
	}
	
}
