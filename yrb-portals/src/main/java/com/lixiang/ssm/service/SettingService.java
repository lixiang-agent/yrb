package com.lixiang.ssm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixiang.ssm.dao.UserInfoMapper;
import com.lixiang.ssm.entity.UserInfo;

@Service
public class SettingService {
	 @Autowired
	private UserInfoMapper userInfoMapper;
	 
	 public Integer selectEmail(Integer id){
		 return userInfoMapper.selectEmail(id);
	 }
	 
	 public Integer selectPhoneNum(Integer id){
		 return userInfoMapper.selectPhoneNum(id);
	 }
	 public Integer selectPassword(Integer id){
		 return userInfoMapper.selectPassword(id);
	 }
	 
	 public UserInfo getUserInfoById(int id){
		 return userInfoMapper.selectByPrimaryKey(id);
	 }
	 public int updateUserInfo(UserInfo record){
		 return userInfoMapper.updateByPrimaryKeySelective(record);
	 }
}
