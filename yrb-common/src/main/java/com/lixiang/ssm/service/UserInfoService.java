package com.lixiang.ssm.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
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
	public boolean updateUserInfo(UserInfo userInfo){
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
	
	public boolean updateByPrimaryKeySelective(UserInfo userInfo) {
		return userInfoMapper.updateByPrimaryKeySelective(userInfo);
		}

	/**
	 * 修改用户
	 * @param userInfo
	 * @return
	 */
	public boolean updateUserInfos(UserInfo userInfo){
		return userInfoMapper.updateByPrimaryKey(userInfo)>0;
	}

}
