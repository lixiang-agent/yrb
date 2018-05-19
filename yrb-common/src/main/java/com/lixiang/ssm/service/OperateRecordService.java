package com.lixiang.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.OperateRecordMapper;
import com.lixiang.ssm.entity.LoanProject;
import com.lixiang.ssm.entity.OperateRecord;

@Service
public class OperateRecordService {
	
	@Autowired
	private OperateRecordMapper operateRecordMapper;
	
	/*public OperateRecord getoperator(int id){
		return operateRecordMapper.selectByPrimaryKey(id);
	}*/
	
	public int insertSelective(OperateRecord record){
		return operateRecordMapper.insertSelective(record);
		
	}
	

	public List<OperateRecord> getoperator(int id){
		return operateRecordMapper.getoperator(id);
	}
	
	

	
	
	
	
	

}
