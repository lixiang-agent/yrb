package com.lixiang.ssm.utils;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.lixiang.ssm.service.ResourcesService;

/**
 * 获取拦截资源的工厂
 * @author YI
 *
 */
public class FilterChainDefinitionMapFactory {
	
	@Autowired
	private ResourcesService resourcesService;
	
	/**
	 * 获取需要连接的资源
	 * @return
	 */
	public   Map<String,String> getFilterChainDefinitionMap(){
		
		return resourcesService.getAllFilterResource();
	}

}
