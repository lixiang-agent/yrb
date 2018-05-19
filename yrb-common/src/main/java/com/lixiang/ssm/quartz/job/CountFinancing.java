package com.lixiang.ssm.quartz.job;

import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.lixiang.ssm.entity.InvProject;
import com.lixiang.ssm.service.InvManageService;
import com.lixiang.ssm.utils.InterestUtils;

public class CountFinancing implements Job {

	protected Logger log = Logger.getLogger(CountFinancing.class);
	@Autowired
	private InvManageService invManageService;

	@Override
	public void execute(JobExecutionContext checkJob) throws JobExecutionException {

		// 获取IOC容器
		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
		invManageService = wac.getBean(InvManageService.class);
		InvProject inv = new InvProject();
		List<InvProject> list = invManageService.queryInvProjectByFinancingTime(inv);
		for (Iterator<InvProject> it = list.iterator(); it.hasNext();) {
			InvProject obj = (InvProject) it.next();
			System.out.println("这是对象："+obj);
			System.out.println("这是金额差："+InterestUtils.sub(obj.getInvBalance().doubleValue(), obj.getInvTotbalance().doubleValue()).doubleValue());
			if ((InterestUtils.sub(obj.getInvBalance().doubleValue(), obj.getInvTotbalance().doubleValue()).doubleValue()) >=0) {
				obj.setProjectStatus(50);
				int result = invManageService.updateByPrimaryKeySelective(obj);
				if (result > 0) {
					System.out.println("项目：" + obj.getProjectName() + "筹资成功,项目id为:" + obj.getId());
				}
			}else if(InterestUtils.sub(obj.getInvBalance().doubleValue(), obj.getInvTotbalance().doubleValue()).doubleValue() < 0){
				obj.setProjectStatus(100);
				int result = invManageService.updateByPrimaryKeySelective(obj);
				if (result > 0) {
					System.out.println("项目：" + obj.getProjectName() + "筹资失败,项目id为:" + obj.getId());
				}
			}
		}
	}

}
