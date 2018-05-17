package com.lixiang.ssm.shiro;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;

import com.lixiang.ssm.constants.ShiroConstant;
import com.lixiang.ssm.redis.RedisUtil;

public class SessionDAO extends AbstractSessionDAO {
	
	private Logger log = Logger.getLogger(SessionDAO.class);

	private RedisUtil redisUtil;

	public RedisUtil getRedisUtil() {
		return redisUtil;
	}

	public void setRedisUtil(RedisUtil redisUtil) {
		this.redisUtil = redisUtil;
	}

	// 创建session，保存到数据库
	@Override
	protected Serializable doCreate(Session session) {
		log.debug("创建session");
		Serializable sessionId = generateSessionId(session);
		assignSessionId(session, sessionId);
		// 添加进redis
		redisUtil.set(ShiroConstant.PRIFFIX + sessionId.toString(), sessionToByte(session), 1 * 60L);
		return sessionId;
	}

	// 获取session
	@Override
	protected Session doReadSession(Serializable sessionId) {
		log.debug("读取session："+sessionId);
		// 先从缓存中获取session，如果没有再去数据库中获取
		Session session = null;
		byte[] bytes = (byte[]) redisUtil.get(ShiroConstant.PRIFFIX + sessionId.toString());
		if (bytes != null && bytes.length > 0) {
			session = byteToSession(bytes);
		}
		return session;
	}

	// 把session对象转化为byte保存到redis中
	public byte[] sessionToByte(Session session) {
		ByteArrayOutputStream bo = new ByteArrayOutputStream();
		byte[] bytes = null;
		try {
			ObjectOutput oo = new ObjectOutputStream(bo);
			oo.writeObject(session);
			bytes = bo.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return bytes;
	}

	// 把byte还原为session
	public Session byteToSession(byte[] bytes) {
		ByteArrayInputStream bi = new ByteArrayInputStream(bytes);
		ObjectInputStream in;
		SimpleSession session = null;
		try {
			in = new ObjectInputStream(bi);
			session = (SimpleSession) in.readObject();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return session;
	}

	@Override
	public void update(Session session) throws UnknownSessionException {
		log.debug("更新session:"+session.getId());
		redisUtil.set(ShiroConstant.PRIFFIX + session.getId().toString(), sessionToByte(session), 30 * 60L);
	}

	@Override
	public void delete(Session session) {
		log.debug("删除session:"+session.getId());
		if (session == null || session.getId() == null) {
			System.out.println("Session is null");
			return;
		}
		redisUtil.remove(ShiroConstant.PRIFFIX + session.getId().toString());

	}

	@Override
	public Collection<Session> getActiveSessions() {
		Set<Session> sessions = new HashSet<Session>();
		Set<Serializable> keys = redisUtil.keys(ShiroConstant.PRIFFIX + "*");
		if (keys != null && keys.size() > 0) {
			for (Serializable key : keys) {
				Session session = null;
				byte[] bytes = (byte[]) redisUtil.get(ShiroConstant.PRIFFIX + key);
				if (bytes != null && bytes.length > 0) {
					session = byteToSession(bytes);
				}
				sessions.add(session);
			}
		}
		return sessions;
	}
}
