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
@Service
public class InvProjectService {
	
	@Autowired
	private InvProjectMapper invProjectMapper;
	
	public List<InvProject> ListByInvProject(InvProject  invProject,String orderBy,Integer orderMethod){
		return invProjectMapper.ListByInvProject(invProject,orderBy,orderMethod);
	}
}
