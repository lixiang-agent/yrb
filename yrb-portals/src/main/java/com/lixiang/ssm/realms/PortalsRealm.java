package com.lixiang.ssm.realms;

import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
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
import com.lixiang.ssm.dao.UserInfoMapper;
import com.lixiang.ssm.entity.UserInfo;

/**
 * 1. 只需要实现认证功能，继承 AuthenticatingRealm 类。，重写 doGetAuthenticationInfo 方法
 * 
 * 2. 如果需要授权的话，要继承 AuthorizingRealm 类
 * 
 * @author YI
 *
 */

public class PortalsRealm extends AuthorizingRealm {

	protected Logger log = Logger.getLogger(PortalsRealm.class);
	
	@Autowired
	private UserInfoMapper userInfoMapper;
	
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
		UserInfo userInfo = (UserInfo) paramPrincipalCollection.getPrimaryPrincipal();

		log.debug("给用户[" + userInfo.getAccount() + "]分配权限");
		// 根据登录用户来分配权限
		// 角色
		Set<String> roles = roleMapper.getRoleByUserName(userInfo.getAccount());
		// 行为
		Set<String> perms = roleMapper.getPermsByUserName(userInfo.getAccount());
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
		String account = token2.getUsername();

		UserInfo userInfo = userInfoMapper.login(account);

		if (userInfo == null) {
			throw new UnknownAccountException("用户不存在,用户名:" + account);
		}

		// 使用加盐的方式来进行加密处理
		ByteSource credentialsSalt = ByteSource.Util.bytes(account);
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(userInfo, userInfo.getPassword(),
				credentialsSalt, super.getName());

		return authenticationInfo;
	}

}
