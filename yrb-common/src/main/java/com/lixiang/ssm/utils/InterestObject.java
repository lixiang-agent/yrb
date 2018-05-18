package com.lixiang.ssm.utils;

import java.io.Serializable;
import java.util.Date;

/**
 * 偿还本金和利息的对象
 * @author YI
 *
 */
public class InterestObject implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//期数
	private Integer periods;
	
	//本金
	private Double capital;
	
	//利率
	private Double interest;
	
	//还款时间
	private Date paymentDate;

	public Integer getPeriods() {
		return periods;
	}

	public void setPeriods(Integer periods) {
		this.periods = periods;
	}

	public Double getCapital() {
		return capital;
	}

	public void setCapital(Double capital) {
		this.capital = capital;
	}

	public Double getInterest() {
		return interest;
	}

	public void setInterest(Double interest) {
		this.interest = interest;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	
	
	
}
