package com.lixiang.ssm.entity;

import java.util.List;

/**
 * 返回给页面的投资项目单品信息
 * @author Administrator
 *
 */
public class InvProjectSingle {


	//记录投资已还款的数据
    private Double repaymentBalance;
    //记录投资项目的基本信息
    private InvProject invProject;
    //记录投资项目的投资记录
    private List<InvRecord> invRecord;
    //记录投资项目的还款计划
    private List<PaybackPlan> paybackPlan;
    
    
	public InvProjectSingle() {
		super();
	}

	
	public InvProjectSingle(Double repaymentBalance, InvProject invProject, List<InvRecord> invRecord,
			List<PaybackPlan> paybackPlan) {
		super();
		this.repaymentBalance = repaymentBalance;
		this.invProject = invProject;
		this.invRecord = invRecord;
		this.paybackPlan = paybackPlan;
	}
	

	public List<InvRecord> getInvRecord() {
		return invRecord;
	}


	public void setInvRecord(List<InvRecord> invRecord) {
		this.invRecord = invRecord;
	}


	public List<PaybackPlan> getPaybackPlan() {
		return paybackPlan;
	}


	public void setPaybackPlan(List<PaybackPlan> paybackPlan) {
		this.paybackPlan = paybackPlan;
	}


	public InvProject getInvProject() {
		return invProject;
	}

	public void setInvProject(InvProject invProject) {
		this.invProject = invProject;
	}




	public Double getRepaymentBalance() {
		return repaymentBalance;
	}

	public void setRepaymentBalance(Double repaymentBalance) {
		this.repaymentBalance = repaymentBalance;
	}

	@Override
	public String toString() {
		return "InvProjectSingle [repaymentBalance=" + repaymentBalance + ", invProject=" + invProject + ", invRecord="
				+ invRecord + ", paybackPlan=" + paybackPlan + "]";
	}
    
}
