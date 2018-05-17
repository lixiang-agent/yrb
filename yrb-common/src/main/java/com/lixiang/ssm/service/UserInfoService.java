package com.lixiang.ssm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixiang.ssm.dao.UserInfoMapper;
import com.lixiang.ssm.entity.UserInfo;

@Service
public class UserInfoService {
	
	@Autowired
	private UserInfoMapper userInfoMapper;
	
	public boolean updateUserInfo(UserInfo userInfo){
		return userInfoMapper.updateByPrimaryKey(userInfo)>0;
	}

}
