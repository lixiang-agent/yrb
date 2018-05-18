package com.lixiang.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.InvRecordMapper;
import com.lixiang.ssm.dao.PaybackPlanMapper;
import com.lixiang.ssm.dao.TraRecordMapper;
import com.lixiang.ssm.dao.UserInfoMapper;
import com.lixiang.ssm.entity.InvRecord;
import com.lixiang.ssm.entity.PaybackPlan;
import com.lixiang.ssm.entity.Resources;
import com.lixiang.ssm.entity.TraRecord;
import com.lixiang.ssm.entity.UserInfo;
@Service
public class AccpandectService {
	@Autowired
	private PaybackPlanMapper paybackPlanMapper;
	@Autowired
	private UserInfoMapper userInfoMapper;
	@Autowired
	private TraRecordMapper traRecordMapper;
	@Autowired
	private InvRecordMapper invRecordMapper;
	
	/**
	 * 根据ID来查询
	 * @param id
	 * @return
	 */
	public UserInfo selectByPrimaryKey(Integer id){
		return userInfoMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 回款分页
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
	
	/**
	 * 资金分页
	 * @param traRecord
	 * @return
	 */
	public PageInfo<TraRecord> pageList(TraRecord traRecord) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(traRecord.getPageNum(),traRecord.getPageSize());
		//查询语句
		List<TraRecord> list = traRecordMapper.selectFundRecord(traRecord);
		//用PageInfo对结果进行包装
		PageInfo<TraRecord> page = new PageInfo<>(list);
		return page;
	}
	/**
	 * 投资分页
	 * @param invRecord
	 * @return
	 */
	public PageInfo<InvRecord> pageList(InvRecord invRecord) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(invRecord.getPageNum(),invRecord.getPageSize());
		//查询语句
		List<InvRecord> list = invRecordMapper.selectInvestRecord(invRecord);
		//用PageInfo对结果进行包装
		PageInfo<InvRecord> page = new PageInfo<>(list);
		return page;
	}
	
}
