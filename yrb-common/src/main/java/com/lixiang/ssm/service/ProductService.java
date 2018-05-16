package com.lixiang.ssm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixiang.ssm.dao.ProductMapper;

@Service
public class ProductService {
	
	@Autowired
	private ProductMapper mapper;
	
	public boolean secondKill(String name,Integer pid){
		System.out.println(name+"，开始进行秒杀");
		return mapper.decrStock(pid);
		
	}

}