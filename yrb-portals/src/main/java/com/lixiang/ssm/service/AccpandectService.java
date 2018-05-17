package com.lixiang.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.PaybackPlanMapper;
import com.lixiang.ssm.entity.PaybackPlan;
import com.lixiang.ssm.entity.Resources;
@Service
public class AccpandectService {
	@Autowired
	private PaybackPlanMapper paybackPlanMapper;
	
	/**
	 * 根据ID来查询
	 * @param id
	 * @return
	 */
	public PaybackPlan selectByPrimaryKey(Integer id){
		return paybackPlanMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 分页
	 * @param id
	 * @return
	 */
	public PageInfo<PaybackPlan> pageList(PaybackPlan paybackPlan) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(paybackPlan.getPageNum(),paybackPlan.getPageSize());
		//查询语句
		List<PaybackPlan> list = paybackPlanMapper.selectpPrincipalAndInterest(paybackPlan);
		//用PageInfo对结果进行包装
		PageInfo<PaybackPlan> page = new PageInfo<>(list);
		return page;
	}
	
}
