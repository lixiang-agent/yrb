package com.lixiang.ssm.service;

import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.UserInfoMapper;
import com.lixiang.ssm.entity.InvProject;
import com.lixiang.ssm.entity.Role;
import com.lixiang.ssm.entity.UserInfo;

@Service
public class UserInfoService {
	
	protected Log log=LogFactory.getLog(UserInfoService.class);
	
	@Autowired
	private UserInfoMapper userInfoMapper;
	
		//用户组用户
		List<UserInfo> userInfolist;
		
		public List<UserInfo> getUserInfoList(){
			return userInfoMapper.getUserInfoList();
		}
	/**
	 * 分页的查询
	 * @param user
	 * @return
	 */
	public PageInfo<UserInfo> pageList(UserInfo userInfo) {
		//获取第1页，10条内容，默认查询总数count
	    PageHelper.startPage(userInfo.getPageNum(), userInfo.getPageSize());
		//查询语句
		List<UserInfo> list= userInfoMapper.list(userInfo);
		//用PageInfo对结果进行包装
		PageInfo<UserInfo> page = new PageInfo<>(list);
		
		return page;
	}
	
	/**
	 * 修改用户
	 * @param ugroup
	 * @return
	 */
	@Transactional
	public int updateUserInfo(UserInfo userInfo){
		//获取当前用户
		UserInfo userInfo1 = (UserInfo)SecurityUtils.getSubject().getPrincipal();
		return userInfoMapper.updateByPrimaryKeySelective(userInfo1);
	}
	
	public UserInfo selectByPrimaryKey(int UserInfoid){
		return userInfoMapper.selectByKey(UserInfoid);
	}
	
	public UserInfo selectByKey(Integer id) {
		return userInfoMapper.selectByKey(id);
	}
	
	public int updateByPrimaryKeySelective(UserInfo userInfo) {
		return userInfoMapper.updateByPrimaryKeySelective(userInfo);
		}

	/**
	 * 修改用户,充值
	 * @param userInfo
	 * @return
	 */
	public boolean updateTopUp(UserInfo userInfo){
		return userInfoMapper.updateTopUp(userInfo)>0;
	}
	
	/**
	 * 注册者信息
	 * @param UserInfo
	 * @return
	 */
	public int register(UserInfo userInfo){
		
		ByteSource credentialsSalt = ByteSource.Util.bytes(userInfo.getAccount());
		Object value = new SimpleHash("MD5", userInfo.getPassword(), credentialsSalt, 101);
		userInfo.setPassword(value.toString());	
		userInfo.setCreateDate(new Date());
		return userInfoMapper.register(userInfo);
		
	}
	
	/**
	 * 登录者信息
	 * @param account
	 * @return
	 */
	public UserInfo login(String account){
		
		return userInfoMapper.login(account);
	}
	
		 /** 更新
		 * @param userInfo
		 * @return
		 */
		public boolean updateUserInfos(UserInfo userInfo){
			return userInfoMapper.updateUserInfo(userInfo)>0;
		}
	

	 /** 修改用户,提现
	 * @param userInfo
	 * @return
	 */
	public boolean updateWithdraw(UserInfo userInfo){
		return userInfoMapper.updateWithdraw(userInfo)>0;
	}
}
