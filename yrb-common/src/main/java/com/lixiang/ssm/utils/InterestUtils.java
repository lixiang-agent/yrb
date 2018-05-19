package com.lixiang.ssm.utils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class InterestUtils {
	/* 到期还本 */
	public static final int MATURITY_REPAYMENT = 0;
	/* 按月付息,到期还本 */
	public static final int MATURITY_INTEREST_REPAYMENT = 1;
	/* 等额本息 */
	public static final int AVERAGE_CAPITAL_PLUS_INTEREST = 2;

	/**
	 * 获取还款记录或获取借款记录
	 * 
	 * @param repaymentType
	 *            还款方式
	 * @param balance
	 *            贷款金额
	 * @param periods
	 *            期数
	 * @param rate
	 *            年利率
	 * @param startDate
	 *            开始时间
	 * @return
	 */
	public static List<InterestObject> getInterestList(int repaymentType, BigDecimal balance, int periods, BigDecimal rate,
			Date startDate) {

		List<InterestObject> interest = new ArrayList<>();

		BigDecimal monthRate = InterestUtils.div(rate.doubleValue(), 12, 2);
		// 到期还本
		if (repaymentType == MATURITY_REPAYMENT) {
			InterestObject obj = new InterestObject();
			// 设置期数
			obj.setPeriods(1);
			// 设置本金
			obj.setCapital(balance);
			// 设置利息
			obj.setInterest(InterestUtils.mul(balance.doubleValue(),(InterestUtils.mul(monthRate.doubleValue(), periods)).doubleValue()));
			Calendar cal = Calendar.getInstance();
			cal.setTime(startDate);
			cal.add(Calendar.MONTH, 1);
			// 设置计划还款时间
			obj.setPaymentDate(cal.getTime());
			interest.add(obj);
		} else if (repaymentType == MATURITY_INTEREST_REPAYMENT) {// 按月付息,到期还本

			for (int i = 1; i <= periods; i++) {
				InterestObject obj = new InterestObject();
				// 设置期数
				obj.setPeriods(i);
				// 设置利息
				obj.setInterest(InterestUtils.mul(balance.doubleValue(),monthRate.doubleValue()));
				Calendar cal = Calendar.getInstance();
				cal.setTime(startDate);
				cal.add(Calendar.MONTH, i);
				// 设置计划还款时间
				obj.setPaymentDate(cal.getTime());
				interest.add(obj);

				// 最后一期加上本金
				if (i == periods) {
					// 设置本金
					obj.setCapital(balance);
				}
				interest.add(obj);
			}

		} else if (repaymentType == AVERAGE_CAPITAL_PLUS_INTEREST) {// 按月付息,到期还本

			for (int i = 1; i <= periods; i++) {
				InterestObject obj = new InterestObject();
				// 设置期数
				obj.setPeriods(i);
				// 设置利息
				obj.setInterest(InterestUtils.mul(balance.doubleValue(),monthRate.doubleValue()));
				Calendar cal = Calendar.getInstance();
				cal.setTime(startDate);
				cal.add(Calendar.MONTH, i);
				// 设置计划还款时间
				obj.setPaymentDate(cal.getTime());
				interest.add(obj);
				// 设置本金
				obj.setCapital(InterestUtils.div(balance.doubleValue(), periods, 2));
				interest.add(obj);
			}

		}
		
		return interest;
	}
	
	public static BigDecimal add(double v1,double v2){     
		BigDecimal b1 = new BigDecimal(Double.toString(v1));     
		BigDecimal b2 = new BigDecimal(Double.toString(v2));     
		return b1.add(b2);     
		}   
	public static BigDecimal sub(double v1,double v2){     
		BigDecimal b1 = new BigDecimal(Double.toString(v1));     
		BigDecimal b2 = new BigDecimal(Double.toString(v2));     
		return b1.subtract(b2);     
		} 
	public static BigDecimal mul(double v1,double v2){     
		BigDecimal b1 = new BigDecimal(Double.toString(v1));     
		BigDecimal b2 = new BigDecimal(Double.toString(v2));     
		return b1.multiply(b2);     
		}    
	public static BigDecimal div(double v1,double v2,int scale){     
		if(scale<0){     
		throw new IllegalArgumentException(     
		"值必须为整数或者零");     
		}     
		BigDecimal b1 = new BigDecimal(Double.toString(v1));     
		BigDecimal b2 = new BigDecimal(Double.toString(v2));     
		return b2.divide(b1,scale,BigDecimal.ROUND_HALF_UP);     
		} 
}
