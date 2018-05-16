package com.lixiang.ssm.service;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.RoleMapper;
import com.lixiang.ssm.dao.UserMapper;
import com.lixiang.ssm.entity.User;
import com.lixiang.ssm.redis.RedisUtil;

@Service
public class UserService {
	protected Logger log = Logger.getLogger(UserService.class);
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;

	@Autowired
	private RedisUtil redisUtil;

	public User getUserById(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Transactional
	public boolean addUser(User user) {
		ByteSource credentialsSalt = ByteSource.Util.bytes(user.getUsername());
		Object value = new SimpleHash("MD5", user.getPassword(), credentialsSalt, 101);
		user.setPassword(value.toString());
		return userMapper.insert(user) > 0;
	}

	@Transactional
	public boolean updateUser(User user) {
		ByteSource credentialsSalt = ByteSource.Util.bytes(user.getUsername());
		Object value = new SimpleHash("MD5", user.getPassword(), credentialsSalt, 101);
		log.debug(value.toString());
		user.setPassword(value.toString());
		return userMapper.updateByPrimaryKey(user) > 0;
	}

	@Transactional
	public boolean unlockUser(Integer id) {
		return userMapper.unlockUser(id);
	}

	public User getUserByName(String name) {
		return userMapper.getUserByName(name);
	}

	public boolean addLoginErrorCount(String username) {
		return userMapper.updateErrorCountByUser(username, 1, new Date());
	}

	public boolean cleanLoginErrorCount(String username) {
		return userMapper.updateErrorCountByUser(username, 0, new Date());
	}

	@Transactional
	public boolean deleteUserInfoByPrimaryKey(Integer id) {
		System.out.println(id);
		userMapper.delUserByPrimaryKey(id);
		userMapper.delUserGroupByPrimaryKey(id);
		return userMapper.delUserRoleByPrimaryKey(id);

	}

	public List<User> getUserName(String user) {
		return userMapper.getUserName(user);

	}

	/**
	 * 分页的查询
	 * 
	 * @param user
	 * @return
	 */
	public PageInfo<User> pageList(User user) {
		// 获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(user.getPageNum(), user.getPageSize());
		// 查询语句
		List<User> list = userMapper.list(user);

		// 用PageInfo对结果进行包装

		// 查询每个用户有哪些角色
		for (User user_list : list) {
			Set<String> user_roles = new LinkedHashSet<>();
			StringBuffer user_role = new StringBuffer();
			user_roles = roleMapper.getRoleNameByUserId(user_list.getId());
			for (String str : user_roles) {
				user_role.append(str + ",");
			}
			String role = user_role.toString();
			if (role.length() != 0) {
				user_list.setUserRoles(role.substring(0, role.length() - 1));
			}
		}
		// 用PageInfo对结果进行包装

		PageInfo<User> page = new PageInfo<>(list);
		return page;
	}
	
	/**
	 * 缓存的例子
	 * 
	 * @param id
	 * @return
	 */
	public User getUser(int id) {
		// 1.从redis缓存里面获取
		User obj = (User) redisUtil.get("user:" + id);
	
		
		// 2.如果能获取，则直接返回
		if (obj != null) {
			return obj;
		}
		if (redisUtil.set("lock:user:" + id, id)) {
			// 3.如果获取不了，则从数据类里面拿
			obj = userMapper.selectByPrimaryKey(id);
			//设置有效时间5分钟
			redisUtil.set("user:" + id, obj,300L);
		} else {
			try {
				Thread.sleep(200);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			obj = (User) redisUtil.get("user:" + id);
		}
		
		return obj;

	}

	public static void main(String[] args) {
		String password = "112233";
		ByteSource credentialsSalt = ByteSource.Util.bytes("admin");
		Object value = new SimpleHash("MD5", password, credentialsSalt, 101);
		System.out.println(value);
	}

}
