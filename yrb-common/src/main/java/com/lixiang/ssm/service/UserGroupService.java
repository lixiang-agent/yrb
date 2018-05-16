package com.lixiang.ssm.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.UgroupMapper;
import com.lixiang.ssm.entity.Role;
import com.lixiang.ssm.entity.Ugroup;
import com.lixiang.ssm.entity.User;

@Service
public class UserGroupService {
	
	protected Log log=LogFactory.getLog(UserGroupService.class);
	@Autowired
	private UserService userService;
	
	@Autowired
	private UgroupMapper ugroupMapper;
	
	//用户组用户
	List<User> userlist;
	//用户组用户
	List<Role> rolelist;
	
	/**
	 * 分页的查询
	 * @param user
	 * @return
	 */
	public PageInfo<Ugroup> pageList(Ugroup ugroup) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(ugroup.getPageNum(), ugroup.getPageSize());
		//查询语句
		List<Ugroup> list = ugroupMapper.selectList(ugroup);
		//用PageInfo对结果进行包装
		PageInfo<Ugroup> page = new PageInfo<>(list);
		return page;
	}
	
	
	/**
	 * 添加用户组
	 * @param ugroup
	 * @return
	 */
	public boolean addUgroup(Ugroup ugroup){
		return ugroupMapper.insert(ugroup)>0;
	}
	/**
	 * 修改用户组普通信息业务
	 * @param ugroup
	 * @return
	 */
	@Transactional
	public boolean ugroupModify(Ugroup ugroup)
	{
		//获取当前用户
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		
		return ugroupMapper.ugroupModify(ugroup,user);
	}
	
	/**
	 * 查询用户,标记用户组用户
	 */
	/**
	 * 分页的查询
	 * @param user
	 * @return
	 */
	public PageInfo<User> ugroupUsers(Ugroup ugroup) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(ugroup.getPageNum(), ugroup.getPageSize());
		//查询语句
		userlist = ugroupMapper.ugroupUsers(ugroup);
		//用PageInfo对结果进行包装
		PageInfo<User> page = new PageInfo<>(userlist);
		return page;
	}
	
	
	/**
	 * 修改用户组用户
	 */
	@Transactional
	public void ugroupUsersModify(int groupid ,int[] id)
	{
		//从List<User>列表清除不需要删除的元素的索引
		ArrayList<Integer> delListIndex = new ArrayList<>();
		//跳出循环id[]
		boolean breakarray; 
		
		for (int l = 0; l < userlist.size(); l++)
		{
			//是否是用户组用户
			if(userlist.get(l).isIsgroupuser()==true)
			{
				breakarray = false;//初始化
				//去除没改动的用户
				int i =0 ;
				while(breakarray==false&&i < id.length)
				{
					//id数组的元素设置为0，意义为去除
					//如果用户组已经有的用户，则在list集合和id数组删除
					if(id[i]!=0 && userlist.get(l).getId().intValue()==id[i])
					{
						delListIndex.add(new Integer(l));//已经是是用户组用户,从列表删除
						id[i] = 0;//id数组的元素设置为0，意义为去除
						breakarray = true;
					}
					i++;
				}
			}
			else
				delListIndex.add(new Integer(l));//不是用户组用户,从列表删除
		}
		
		//去除id数组元素为0的
		ArrayList<Integer> addlist = new ArrayList<>();
		for (int i = 0; i < id.length; i++)
		{
			if(id[i] !=0)
				addlist.add(id[i]);
		}
		
		//删除不是用户组用户
		for (int i = delListIndex.size()-1 ; i >=0 ; i--)
		{
			
			userlist.remove(delListIndex.get(i).intValue());
		}
		
		if(addlist.size()>0)
			ugroupMapper.ugroupAddUsers(groupid, addlist);
		if(userlist.size()>0)
			ugroupMapper.ugroupDelUsers(groupid, userlist);
		
	}
	
	/**
	 * 查询角色,标记用户组角色
	 */
	/**
	 * 分页的查询
	 * @param user
	 * @return
	 */
	public PageInfo<Role> ugroupRoles(Ugroup ugroup) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(1, 10);
		//查询语句
		rolelist = ugroupMapper.ugroupRoles(ugroup);
		//用PageInfo对结果进行包装
		PageInfo<Role> page = new PageInfo<>(rolelist);
		return page;
	}
	
	/**
	 * 修改用户组角色
	 * @param groupid
	 * @param id
	 */
	@Transactional
	public void ugroupRolesModify(int groupid ,int[] id)
	{
		//从List<Role>列表清除不需要删除的元素的索引
		ArrayList<Integer> delListIndex = new ArrayList<>();
		//跳出循环id[]
		boolean breakarray; 
		
		for (int l = 0; l < rolelist.size(); l++)
		{
			//是否是用户组角色
			if(rolelist.get(l).isIsgrouprole()==true)
			{
				breakarray = false;//初始化
				//去除没改动的角色
				int i =0 ;
				while(breakarray==false&&i < id.length)
				{
					//id数组的元素设置为0，意义为去除
					//如果用户组已经有的角色，则在list集合和id数组删除
					if(id[i]!=0 && rolelist.get(l).getId().intValue()==id[i])
					{
						delListIndex.add(new Integer(l));//已经是是用户组角色,从列表删除
						id[i] = 0;//id数组的元素设置为0，意义为去除
						breakarray = true;
					}
					i++;
				}
			}
			else
				delListIndex.add(new Integer(l));//不是用户组用户,从列表删除
		}
		
		//去除id数组元素为0的
		ArrayList<Integer> addlist = new ArrayList<>();
		for (int i = 0; i < id.length; i++)
		{
			if(id[i] !=0)
				addlist.add(id[i]);
		}
		
		//删除不是用户组角色
		for (int i = delListIndex.size()-1 ; i >=0 ; i--)
		{
			
			rolelist.remove(delListIndex.get(i).intValue());
		}
		
		if(addlist.size()>0)
			ugroupMapper.ugroupAddRoles(groupid, addlist);
		if(rolelist.size()>0)
			ugroupMapper.ugroupDelRoles(groupid, rolelist);
	}
	
	
	/**
	 * 删除用户组
	 * id:用户组的Id
	 */
	@Transactional
	public boolean deleteUgroup(Integer id){
		int flag;
		flag=ugroupMapper.deleteUgroup(id);
		if(flag>0){
			return true;
		}
		return false;
	}

	
}
