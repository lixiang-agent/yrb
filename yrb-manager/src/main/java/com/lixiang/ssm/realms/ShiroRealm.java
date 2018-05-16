package com.lixiang.ssm.realms;

import java.util.Calendar;
import java.util.Date;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.lixiang.ssm.dao.RoleMapper;
import com.lixiang.ssm.dao.UserMapper;
import com.lixiang.ssm.entity.User;

/**
 * 1. 只需要实现认证功能，继承 AuthenticatingRealm 类。，重写 doGetAuthenticationInfo 方法
 * 
 * 2. 如果需要授权的话，要继承 AuthorizingRealm 类
 * 
 * @author YI
 *
 */

public class ShiroRealm extends AuthorizingRealm {

	protected Logger log = Logger.getLogger(ShiroRealm.class);
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private RoleMapper roleMapper;


	/**
	 * 授权 获取用户的权限信息
	 * 
	 * AuthorizationInfo 封装了用户的权限信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection paramPrincipalCollection) {

		// 获取登录用户的信息
		User user = (User) paramPrincipalCollection.getPrimaryPrincipal();

		log.debug("给用户[" + user.getUsername() + "]分配权限");
		// 根据登录用户来分配权限
		// 角色
		Set<String> roles = roleMapper.getRoleByUserName(user.getUsername());
		// 行为
		Set<String> perms = roleMapper.getPermsByUserName(user.getUsername());
		// 普通用户给他分配user角色
		roles.add("user");

		// 权限信息
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo(roles);
		authorizationInfo.setStringPermissions(perms);
		return authorizationInfo;
	}

	/**
	 * 获取认证信息
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		UsernamePasswordToken token2 = (UsernamePasswordToken) token;
		// 获取登陆者的账号
		String username = token2.getUsername();

		User user = userMapper.getUserByName(username);

		if (user == null) {
			throw new UnknownAccountException("用户不存在,用户名:" + username);
		}
		
		// 错误3次，并且冻结时间未结束,表示账号被锁定
		if (user.getErrorCount() != null && user.getErrorCount() >= 3) {
			// 账号被锁定,
			user.getLoginDate();
			Calendar cal = Calendar.getInstance();
			cal.setTime(user.getLoginDate());
			cal.add(Calendar.MINUTE, 30);
			Date now = new Date();
			if (now.before(cal.getTime())) {
				throw new LockedAccountException(user.getUsername() + " 的账号被锁定...");
			}
		}

		// 使用加盐的方式来进行加密处理
		ByteSource credentialsSalt = ByteSource.Util.bytes(username);
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user, user.getPassword(),
				credentialsSalt, super.getName());

		return authenticationInfo;
	}

}
