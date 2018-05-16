package com.lixiang.ssm.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.RoleMapper;
import com.lixiang.ssm.entity.Resources;
import com.lixiang.ssm.entity.Role;

@Service
public class RoleService {

	@Autowired
	private RoleMapper roleMapper;

	public Set<String> getRolesByUsername(String username) {
		return roleMapper.getRoleByUserName(username);
	}

	public Set<String> getPermsByUsername(String username) {
		return roleMapper.getPermsByUserName(username);
	}

	public List<Role> getRolesForUsername(String username) {
		return roleMapper.getRolesForUsername(username);
	}
	
	public List<Role> getRolesList(){
		return roleMapper.getRolesList();
	}
	
	public boolean updateByPrimaryKey(Role record){
		return roleMapper.updateByPrimaryKeySelective(record);
	}
	/**
	 * 分页的查询
	 * @param user
	 * @return
	 */
	public PageInfo<Role> pageList(Role role) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(role.getPageNum(), role.getPageSize());
		//查询语句
		List<Role> list = roleMapper.list(role);
		//用PageInfo对结果进行包装
		PageInfo<Role> page = new PageInfo<>(list);
		
		return page;
	}
	
	public boolean addRolesList(Role role){
		return roleMapper.insertSelective(role);
		
	}
	
	public Role selectByPrimaryKey(int roleId){
		return roleMapper.selectByPrimaryKey(roleId);
	}
	
	public boolean deleteRoleByRoleId(int roleId){
		
		return roleMapper.deleteRoleByRoleId(roleId);
	}

	public List<Role> getRolesForUserId(Integer id) {
		return roleMapper.getRolesForUserId(id);
	}
	public List<Role> getAllRoles(){
		return roleMapper.getAllRoles();
	}
	
	public List<Resources> getResForRoleId(Integer id) {
		return roleMapper.getResForRoleId(id);
	}
	
	@Transactional
	public boolean updateUserRole(int userId, int[] roelIds) {
		// 把之前的角色全部删除
		roleMapper.deleteRoleByUserId(userId);
		// 添加新的角色
		return roleMapper.batchAddRole(userId, roelIds);
	}
	
	@Transactional
	public boolean updateRoleRes(int roleId, int[] resIds) {
		boolean result = false;
		// 把之前的资源全部删除
		result=roleMapper.deleteResByRoleId(roleId);
		if(resIds!=null && resIds.length>0){
			// 添加新的资源
			result= roleMapper.batchAddRes(roleId, resIds);
			
		}
		
		return result;
	}
	
	
}
