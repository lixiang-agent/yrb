package com.lixiang.ssm.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixiang.ssm.dao.InvProjectMapper;
import com.lixiang.ssm.entity.InvProject;

@Service
public class ProjectService {
	protected Logger log = Logger.getLogger(ProjectService.class);
	@Autowired
	private InvProjectMapper invProjectMapper;
	
	public List<InvProject> listIndexProjects(){
		List<InvProject> invProject = new ArrayList<>();
		
		List<InvProject> listIndexCommendProjects = invProjectMapper.listIndexCommendProjects();
		List<InvProject> listIndexCarProjects = invProjectMapper.listIndexCarProjects();
		List<InvProject> listIndexHouseProjects = invProjectMapper.listIndexHouseProjects();
		List<InvProject> listIndexObligationProjects = invProjectMapper.listIndexObligationProjects();
						
//		invProject.addAll(listIndexCommendProjects.subList(listIndexCommendProjects.size()-2, listIndexCommendProjects.size()-1));
		invProject.addAll(listIndexCommendProjects.subList(listIndexCommendProjects.size()-2, listIndexCommendProjects.size()));
		invProject.addAll(listIndexCarProjects.subList(listIndexCommendProjects.size()-2, listIndexCommendProjects.size()));
		invProject.addAll(listIndexHouseProjects.subList(listIndexCommendProjects.size()-2, listIndexCommendProjects.size()));
		invProject.addAll(listIndexObligationProjects.subList(listIndexCommendProjects.size()-2, listIndexCommendProjects.size()));
		
		return invProject;
	}
}
