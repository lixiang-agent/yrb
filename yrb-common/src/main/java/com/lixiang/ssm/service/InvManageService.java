package com.lixiang.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.InvProjectMapper;
import com.lixiang.ssm.dao.OperateRecordMapper;
import com.lixiang.ssm.entity.InvProject;
import com.lixiang.ssm.entity.OperateRecord;

@Service
public class InvManageService {

	@Autowired
	private InvProjectMapper invProjectMapper;
	@Autowired
	private OperateRecordMapper operateRecordMapper;

	public PageInfo<InvProject> pageList(InvProject record) {
		// 获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(record.getPageNum(), record.getPageSize());
		// 查询语句
		List<InvProject> list = invProjectMapper.queryAllInvProject(record);
		// 用PageInfo对结果进行包装
		PageInfo<InvProject> page = new PageInfo<>(list);
		System.out.println(page);
		return page;
	}

	public PageInfo<InvProject> listOperProject(InvProject record) {
		// 获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(record.getPageNum(), record.getPageSize());
		// 查询语句
		List<InvProject> list = invProjectMapper.queryAllInvProjectByProStatus(record);
		// 用PageInfo对结果进行包装
		PageInfo<InvProject> page = new PageInfo<>(list);
		System.out.println(page);
		return page;
	}

	public int insertSelective(InvProject record) {
		return invProjectMapper.insertSelective(record);
	}

	public boolean updateProjectStatus(Integer status,Integer id) {
		return invProjectMapper.updateProjectStatus(status,id);
	}

	public int deleteByPrimaryKey(Integer id) {
		return invProjectMapper.deleteByPrimaryKey(id);
	}

	public InvProject selectByPrimaryKey(Integer id) {
		return invProjectMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(InvProject record) {
		return invProjectMapper.updateByPrimaryKeySelective(record);
	}

	public int insertSelective(OperateRecord record) {
		return operateRecordMapper.insertSelective(record);
	}
}
