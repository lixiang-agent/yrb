package com.lixiang.ssm.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.ResourcesMapper;
import com.lixiang.ssm.entity.Resources;
import com.lixiang.ssm.entity.User;

@Service
public class ResourcesService {

	@Autowired
	private ResourcesMapper mapper;
	
	/**
	 * 获取所有需要拦截的资源
	 * @return
	 */
	public Map<String, String> getAllFilterResource() {

		Map<String, String> map = new LinkedHashMap<>();

		List<Resources> resources = mapper.getAllResource();

		for (Resources res : resources) {
			map.put(res.getResUrl(), res.getAuth());
		}
		return map;
	}
	
	/**
	 * 根据ID删除
	 * @param id
	 * @return
	 */
	public int deleteByPrimaryKey(Integer id){
		return mapper.deleteByPrimaryKey(id);
	}
	/**
	 *	新增
	 * @param record
	 * @return
	 */
	public int insert(Resources record){
		return mapper.insert(record);
	}
	public int insertSelective(Resources record){
		return 0;
	}
	public Resources selectByPrimaryKey(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	public int updateByPrimaryKeySelective(Resources record){
		return mapper.updateByPrimaryKeySelective(record);
	}
	/**
	 * 更新
	 * @param record
	 * @return
	 */
	public int updateByPrimaryKey(Resources record){
		return mapper.updateByPrimaryKey(record);
	}
	/**
	 * 查询全部
	 * @param record
	 * @return
	 */
	public List<Resources> queryAllResource(Resources record){
		return mapper.queryAllResource(record);
	}
	/**
	 * 分页的查询
	 * @param user
	 * @return
	 */
	public PageInfo<Resources> pageList(Resources record) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(record.getPageNum(), record.getPageSize());
		//查询语句
		List<Resources> list = mapper.queryAllResource(record);
		//用PageInfo对结果进行包装
		PageInfo<Resources> page = new PageInfo<>(list);
		return page;
	}
}
