package com.lixiang.ssm.shiro;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lixiang.ssm.constants.ShiroConstant;
import com.lixiang.ssm.redis.RedisUtil;


/**
 * session的监听器
 * @author YI
 *
 */
@Component
public class MyShiroSessionListener implements SessionListener {
	
	protected Logger log = Logger.getLogger(MyShiroSessionListener.class);
	@Autowired
	private RedisUtil redisUtil;
	
	@Override
	public void onStart(Session session) {

	}
	/**
	 * session关闭的时候从redis地面删除
	 */
	@Override
	public void onStop(Session session) {
		// TODO Auto-generated method stub
		log.debug("onStop===" + session.getId());
		redisUtil.remove(ShiroConstant.PRIFFIX+session.getId().toString());
	}
	/**
	 * 当session过期的时候从redis里面删除session数据
	 */
	@Override
	public void onExpiration(Session session) {
		log.debug("onExpiration===" + session.getId());
		redisUtil.remove(ShiroConstant.PRIFFIX+session.getId().toString());
	}
}
