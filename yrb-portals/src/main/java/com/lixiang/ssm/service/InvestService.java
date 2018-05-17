package com.lixiang.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.InvRecordMapper;
import com.lixiang.ssm.entity.InvRecord;

@Service
public class InvestService {
	@Autowired
	private InvRecordMapper invRecordMapper;
	
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
