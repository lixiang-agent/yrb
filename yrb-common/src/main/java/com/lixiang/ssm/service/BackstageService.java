package com.lixiang.ssm.service;

import org.apache.commons.lang.math.RandomUtils;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixiang.ssm.dao.PlatFormAccountMapper;
import com.lixiang.ssm.dao.UserMapper;
import com.lixiang.ssm.entity.PlatFormAccount;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.redis.RedisUtil;

@Service
public class BackstageService {
	@Autowired
	private PlatFormAccountMapper accountMapper;
	@Autowired
	private RedisUtil redisUtil;
	@Autowired
	private UserMapper userMapper;

	public Object selectmoneyTraMoney() {
		// 1.从redis缓存里面获取
		Integer obj = (Integer)redisUtil.get("PlatFormAccount:tolal");
		
		// 2.如果能获取，则直接返回
		if (obj != null) {
			return obj;
		}
		if (redisUtil.setnx("lock:PlatFormAccount",123,200L)) {
			// 3.如果获取不了，则从数据类里面拿
			obj = accountMapper.selectmoneyTraMoney();
			
			// 设置有效时间50分钟
			redisUtil.set("PlatFormAccount:tolal",obj, 3000L);
		
		} else {
			try {
				Thread.sleep(200);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			obj = (Integer)redisUtil.get("PlatFormAccount:tolal");
		}
		
		return obj;

	}
	public Object selectmoneyTraDate() {
		// 1.从redis缓存里面获取
		Integer object = (Integer)redisUtil.get("PlatFormlAccount:time");
		
		// 2.如果能获取，则直接返回
		if (object != null) {
			return object;
		}
		if (redisUtil.setnx("lock:PlatFormlAccount",125,200L)) {
			// 3.如果获取不了，则从数据类里面拿
			object = accountMapper.selectmoneyTraDate();
			
			if(object==null){
				object=0;
			}
			// 设置有效时间50分钟
			redisUtil.set("PlatFormlAccount:time",object, 3000L);
		
		} else {
			try {
				Thread.sleep(200);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			object = (Integer)redisUtil.get("PlatFormlAccount:time");
		}
		return object;

	}
	public Object selectCount() {
		// 1.从redis缓存里面获取
		Integer object = (Integer)redisUtil.get("User:count");
		
		// 2.如果能获取，则直接返回
		if (object != null) {
			return object;
		}
		if (redisUtil.setnx("lock:User",125,200L)) {
			// 3.如果获取不了，则从数据类里面拿
			object = userMapper.selectCount();
			
			if(object==null){
				object=0;
			}
			// 设置有效时间50分钟
			redisUtil.set("User:count",object, 3000L);
		
		} else {
			try {
				Thread.sleep(200);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			object = (Integer)redisUtil.get("User:count");
		}
		return object;

	}
}
