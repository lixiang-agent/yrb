package com.lixiang.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.LoanApplicationMapper;
import com.lixiang.ssm.entity.LoanApplication;

/**
 * 申请的业务处理
 * @author Administrator
 *
 */

@Service
public class LoanApplicationService
{
	//操作数据库申请表的mapper
	@Autowired
	private LoanApplicationMapper mapper;
	
	/**
	 * 分页查询未处理申请的申请列表
	 * @return
	 */
	public PageInfo<LoanApplication> listLoanApplication()
	{
		//获取未处理申请的列表,参数为申请结果：0=未处理，1=申请未通过，2=通过申请
		List<LoanApplication> list = mapper.listSelectByResult(0);
		PageInfo<LoanApplication> page = new PageInfo<>(list);
		return page;
	}
}
