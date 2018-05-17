package com.lixiang.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.ScheduleJobMapper;
import com.lixiang.ssm.entity.ScheduleJob;

@Service
public class ScheduleJobService {

	@Autowired
	private ScheduleJobMapper mapper;

	/**
	 * 查看任务列表，待分页功能
	 * 
	 * @param job
	 * @return
	 */
	public PageInfo<ScheduleJob> pageList(ScheduleJob job) {
		// 获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(job.getPageNum(), job.getPageSize());
		// 查询语句
		List<ScheduleJob> list = mapper.list(job);
		// 用PageInfo对结果进行包装
		PageInfo<ScheduleJob> page = new PageInfo<>(list);
		return page;
	}
	
	/**
	 * 查看任务列表
	 * 
	 * @param job
	 * @return
	 */
	public List<ScheduleJob> list(ScheduleJob job) {
		// 查询语句
		List<ScheduleJob> list = mapper.list(job);
		return list;
	}
	
	
	public ScheduleJob getScheduleJobById(String jobId){
		return mapper.selectByPrimaryKey(jobId);
	}
	
	public boolean updateJob(ScheduleJob job){
		return mapper.updateByPrimaryKeySelective(job);
	}

}
