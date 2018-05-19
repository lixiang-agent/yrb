package com.lixiang.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lixiang.ssm.dao.LoanProjectMapper;
import com.lixiang.ssm.dao.OperateRecordMapper;
import com.lixiang.ssm.entity.LoanProject;
import com.lixiang.ssm.entity.OperateRecord;
import com.lixiang.ssm.entity.Role;

@Service
public class LoanProjectService {
	
	@Autowired
	private LoanProjectMapper loanProjectMapper;
	
	
	
	/**
	 * 分页的查询
	 * @param LoanProject
	 * @return
	 */
	public PageInfo<LoanProject> pageList(LoanProject loanProject) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(loanProject.getPageNum(), loanProject.getPageSize());
		//查询语句
		List<LoanProject> list = loanProjectMapper.listLoanProject(loanProject);
		//用PageInfo对结果进行包装
		PageInfo<LoanProject> page = new PageInfo<>(list);
		
		return page;
	}
	
	/**
	 * 添加项目
	 * @param loanProject
	 * @return
	 */
	public int addLoan(LoanProject loanProject){
		return loanProjectMapper.insertSelective(loanProject);
		
	}
	
	public LoanProject getLoan(int id){
		return loanProjectMapper.selectByPrimaryKey(id);
		
	}
	
	public int updateLoan(LoanProject record){
		return loanProjectMapper.updateByPrimaryKeySelective(record);
		
	}
	public int delLoan(int id){
		return loanProjectMapper.deleteByPrimaryKey(id);
		
	}

	public PageInfo<LoanProject> pageListloan(LoanProject loanProject) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(loanProject.getPageNum(), loanProject.getPageSize());
		//查询语句
		List<LoanProject> list = loanProjectMapper.listLoanProject(loanProject);
		//用PageInfo对结果进行包装
		PageInfo<LoanProject> page = new PageInfo<>(list);
		
		return page;
	}
	
	
	public boolean updateLoanSubmit(LoanProject loanProject){
		return loanProjectMapper.updateLoanSubmit(loanProject);
	}
	public boolean subloanproject(LoanProject loanProject){
		return loanProjectMapper.subloanproject(loanProject);
	}
	
	public boolean backloanproject(LoanProject loanProject){
		return loanProjectMapper.backloanproject(loanProject);
	}
	
	public boolean agree(LoanProject loanProject){
		return loanProjectMapper.agree(loanProject);
	}
	/*public boolean alreadyreleased(LoanProject loanProject){
		return loanProjectMapper.alreadyreleased(loanProject);
	}*/
	
	
	/**
	 * 分页的查询  查询待放款的所有项目
	 * @param LoanProject
	 * @return
	 */
	public PageInfo<LoanProject> pageListloanproject(LoanProject loanProject) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(loanProject.getPageNum(), loanProject.getPageSize());
		//查询语句
		List<LoanProject> list = loanProjectMapper.readyloan(loanProject);
		//用PageInfo对结果进行包装
		PageInfo<LoanProject> page = new PageInfo<>(list);
		
		return page;
	}
	
	
	/**
	 * 分页的查询  查询已放款的所有项目
	 * @param LoanProject
	 * @return
	 */
	public PageInfo<LoanProject> alreadyreleased(LoanProject loanProject) {
		//获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(loanProject.getPageNum(), loanProject.getPageSize());
		//查询语句
		List<LoanProject> list = loanProjectMapper.readyloan(loanProject);
		//用PageInfo对结果进行包装
		PageInfo<LoanProject> page = new PageInfo<>(list);
		
		return page;
	}

	

	
}
