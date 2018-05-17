package com.lixiang.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.SystemMessageMapper;
import com.lixiang.ssm.entity.SystemMessage;
import com.lixiang.ssm.entity.Ugroup;

@Service
public class SystemMessageService {
	
	@Autowired
	private SystemMessageMapper systemMessageMapper;
	
	
	/**
	 * 分页的查询
	 * @param stystemMessage
	 * @return
	 */
	public PageInfo<SystemMessage> pageList(SystemMessage stystemMessage) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(stystemMessage.getPageNum(), stystemMessage.getPageSize());
		//查询语句
		List<SystemMessage> list = systemMessageMapper.queryAllSystemMessagee(stystemMessage);
		//用PageInfo对结果进行包装
		PageInfo<SystemMessage> page = new PageInfo<>(list);
		return page;
	}
	
}
