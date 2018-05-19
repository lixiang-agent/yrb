package com.lixiang.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lixiang.ssm.dao.UserInfoMapper;
import com.lixiang.ssm.entity.UserInfo;
import com.lixiang.ssm.service.UserInfoService;
import com.lixiang.ssm.utils.Tool;


public class TestQuery {
	
	

	@Test
	public void test(){
		
      ApplicationContext ctx = new ClassPathXmlApplicationContext("application.xml");
		
		UserInfoMapper mapper = ctx.getBean(UserInfoMapper.class);
		UserInfo user = new UserInfo();
		user.setAccount("ljjzww");		
		user.setPassword(Tool.MD5("123456"));
		user.setPhoneNum(Long.valueOf("15222773569"));
		user.setCreateDate(new Date());
		
		
		/*UserInfoService service = new UserInfoService();
		UserInfo user = new UserInfo();
		service.addUser(user);*/
				
		if(mapper.insert(user)>0){
			System.out.println("AAAAAAAAA");
		}
	}
	
}
