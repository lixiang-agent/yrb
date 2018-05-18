package com.lixiang.ssm.controller;

import java.util.List;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.entity.News;
import com.lixiang.ssm.service.NewsService;

@Controller
@RequestMapping("/news")
public class NewsController {
	protected Logger log = Logger.getLogger(NewsController.class);
	@Autowired
	private NewsService service;
	/**
	 * 查询显示信息
	 * @param news
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String newsList(News news, Model model) {
		PageInfo<News> page = service.pageList(news);
		model.addAttribute("page", page);
		return "news-list";
	}
	/**
	 * 去添加信息
	 * @return
	 */
	@RequestMapping("/to-insert")
	public String toInsertNews() {
		return "news-add";
	}
	/**
	 * 添加新闻
	 * @param news
	 * @param bindingResult
	 * @param model
	 * @return
	 */
	@RequestMapping("/insert")
	public String insertNews(@Valid News news, BindingResult bindingResult, Model model) {
		if (news.getTitle().length() > 20) {
			if (bindingResult.getErrorCount() > 0) {
				List<FieldError> error = bindingResult.getFieldErrors();
				for (FieldError e : error) {
					log.debug(e);
				}
			}
			return "news-add";
		} else {
			boolean result = service.addNews(news);
			model.addAttribute("oper_result", result);
			return "redirect:list";
		}
	}
	/**
	 * 去修改信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/to-update")
	public String toUpdateNews(Integer id, Model model) {
		News news = service.getNewsById(id);
		model.addAttribute("news", news);
		return "news-update";
	}
	/**
	 * 根据id查询信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/getNewsById")
	public String getNewsById(Integer id, Model model) {
		News news = service.getNewsById(id);
		model.addAttribute("news", news);
		return "news-content";
	}
	/**
	 * 修改新闻
	 * @param news
	 * @param bindingResult
	 * @param model
	 * @return
	 */
	@RequestMapping("/update")
	public String updateNews(@Valid News news, BindingResult bindingResult, Model model) {
		if (news.getTitle().length() > 20) {
			if (bindingResult.getErrorCount() > 0) {
				List<FieldError> error = bindingResult.getFieldErrors();
				for (FieldError e : error) {
					log.debug(e);
				}
			}
			return "news-update";
		} else {
		log.debug(news);
		boolean result = service.updateNews(news);
		log.debug(result);
		model.addAttribute("oper_result", result);
		return "redirect:list";
		}
	}
	/**
	 * 去删除新闻
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toDelete")
	public String toDeleteNews(Integer id, Model model) {
		String tip = "确定要删除吗？确定请确定！";
		model.addAttribute("tip", tip);
		model.addAttribute("news", id);
		return "news-delete";
	}
	/**
	 * 删除新闻
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/delete")
	public String deleteNews(Integer id, Model model) {
		boolean result = service.deleteNews(id);
		model.addAttribute("oper_result", result);
		return "redirect:list";
	}
	/**
	 * 修改新闻发布状态
	 * @param news
	 * @param model
	 * @return
	 */
	@RequestMapping("/updatestatus")
	public String updateNewsStatusById(News news, Model model) {
		boolean result = service.updateNewsStatusById(news);
		model.addAttribute("oper_result", result);
		return "redirect:list";
	}

}
