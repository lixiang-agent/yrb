package com.lixiang.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 投资项目service
 * @author Administrator
 *
 */

import com.lixiang.ssm.dao.InvProjectMapper;
import com.lixiang.ssm.entity.InvProject;
import com.lixiang.ssm.entity.InvProjectSingle;
@Service
public class InvProjectService {
	
	@Autowired
	private InvProjectMapper invProjectMapper;
	/**
	 * 根据条件查询投资项目列表
	 * @param invProject 条件
	 * @param orderBy 依照该字段排序
	 * @param orderMethod 排序的方式
	 * @return
	 */
	public List<InvProject> ListByInvProject(InvProject  invProject,String orderBy,Integer orderMethod){
		return invProjectMapper.ListByInvProject(invProject,orderBy,orderMethod);
	}
	/**
	 * 根据项目Id来返回项目的所有单品信息
	 * @param id 要查询的项目id
	 * @return invProjectSingle 返回包装后的项目详细信息
	 */
	public InvProjectSingle getInvProjectSingle(Integer id){
		InvProjectSingle invProjectSingle=new InvProjectSingle();
		invProjectSingle.setInvProject(invProjectMapper.getInvProjectById(id));
		invProjectSingle.setInvRecord(invProjectMapper.getInvRecordById(id));
		invProjectSingle.setPaybackPlan(invProjectMapper.getPaybackPlan(id));
		invProjectSingle.setRepaymentBalance(invProjectMapper.getRepaymentBalance(id));
		return invProjectSingle;
	}
}
