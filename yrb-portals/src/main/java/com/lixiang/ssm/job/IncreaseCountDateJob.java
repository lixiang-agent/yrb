package com.lixiang.ssm.job;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.lixiang.ssm.utils.RedisCacheUtil;

@Component
public class IncreaseCountDateJob implements Job{
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException{
		//获取IOC容器
		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
		//获取IOC容器里面的bean
		RedisCacheUtil<Object> redisCache = wac.getBean(RedisCacheUtil.class);
		
		//读取属性文件
		InputStream in = IncreaseCountDateJob.class.getClassLoader().getResourceAsStream("IndexCountDate.pro");
		OutputStream out = null;
		Properties prop = new Properties();
		try {
			prop.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		//获取属性
		BigDecimal CountOfInvMoney = new BigDecimal(prop.getProperty("CountOfInvMoney"));
		BigDecimal PaybackInterest = new BigDecimal(prop.getProperty("PaybackInterest"));
		BigDecimal CountOfBalance = new BigDecimal(prop.getProperty("CountOfBalance"));
		BigDecimal RegisterPerson = new BigDecimal(prop.getProperty("RegisterPerson"));
		 
		//将读取到的属性添加到List中
		List<BigDecimal> countDate = new ArrayList<>();
		countDate.add(CountOfInvMoney);
		countDate.add(PaybackInterest);
		countDate.add(CountOfBalance);
		countDate.add(RegisterPerson);
        
		//将读取到的数据添加到redis缓存中
		redisCache.setCacheList("CountDate:index", countDate);
		
		//将属性文件中的数据增加一定数量
		BigDecimal newCountOfInvMoney = CountOfInvMoney.add(new BigDecimal(new Random().nextInt(9999)+(float)new Random().nextInt(99)/100).setScale(2, BigDecimal.ROUND_DOWN));
		BigDecimal newPaybackInterest = PaybackInterest.add(new BigDecimal(new Random().nextInt(999)+(float)new Random().nextInt(99)/100).setScale(2, BigDecimal.ROUND_DOWN));
		BigDecimal newCountOfBalance = CountOfBalance.add(new BigDecimal(new Random().nextInt(999)+(float)new Random().nextInt(99)/100).setScale(2, BigDecimal.ROUND_DOWN));
		BigDecimal newRegisterPerson = RegisterPerson.add(new BigDecimal(new Random().nextInt(99)));
		System.out.println(newCountOfInvMoney+">"+newPaybackInterest+">"+newCountOfBalance+">"+newRegisterPerson);
		prop.setProperty("CountOfInvMoney", newCountOfInvMoney+"");
		prop.setProperty("PaybackInterest", newPaybackInterest+"");
		prop.setProperty("CountOfBalance", newCountOfBalance+"");
		prop.setProperty("RegisterPerson", newRegisterPerson+"");
		
		
		
//		try {
//			prop.store(out, "This is new properties");
//			
//			out.close();
//			
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
	}
}
