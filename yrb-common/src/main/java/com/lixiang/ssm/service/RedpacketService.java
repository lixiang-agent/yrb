package com.lixiang.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.RedpacketMapper;
import com.lixiang.ssm.entity.Redpacket;

@Service
public class RedpacketService {
	
	@Autowired
	private RedpacketMapper redpacketMapper;
	
	/**
	 * 分页的查询
	 * @param redpacket
	 * @return
	 */
	public PageInfo<Redpacket> pageList(Redpacket redpacket) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(redpacket.getPageNum(), redpacket.getPageSize());
		//查询语句
		List<Redpacket> list = redpacketMapper.queryAllRedpacket(redpacket);
		//用PageInfo对结果进行包装
		PageInfo<Redpacket> page = new PageInfo<>(list);
		return page;
	}

}
