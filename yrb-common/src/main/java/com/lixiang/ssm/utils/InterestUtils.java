package com.lixiang.ssm.utils;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class InterestUtils {
	/* 到期还本 */
	public static final int MATURITY_REPAYMENT = 1;
	/* 按月付息,到期还本 */
	public static final int MATURITY_INTEREST_REPAYMENT = 2;

	/* 等额本息 */
	public static final int AVERAGE_CAPITAL_PLUS_INTEREST = 3;

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
	public static List<InterestObject> getInterestList(int repaymentType, double balance, int periods, double rate,
			Date startDate) {

		List<InterestObject> interest = new ArrayList<>();

		double monthRate = rate / 12;
		// 到期还本
		if (repaymentType == MATURITY_REPAYMENT) {
			InterestObject obj = new InterestObject();
			// 设置期数
			obj.setPeriods(1);
			// 设置本金
			obj.setCapital(balance);
			// 设置利息
			obj.setInterest(balance * (monthRate * periods));
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
				obj.setInterest(balance * monthRate);
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
				obj.setInterest(balance * monthRate);
				Calendar cal = Calendar.getInstance();
				cal.setTime(startDate);
				cal.add(Calendar.MONTH, i);
				// 设置计划还款时间
				obj.setPaymentDate(cal.getTime());
				interest.add(obj);
				// 设置本金
				obj.setCapital(balance / periods);
				interest.add(obj);
			}

		}
		
		return interest;
	}
	
	
}
