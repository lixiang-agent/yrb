<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>p2p网贷平台</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
<%
	String ctx = request.getServletContext().getContextPath();
	application.setAttribute("ctx", ctx);
%>
		<link href="${ctx}/css/common.css" rel="stylesheet" />
		<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css">
		<link href="${ctx}/css/detail.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx}/script/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/script/common.js"></script>
		<script type="text/javascript" src="${ctx}/script/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${ctx}/script/invProjectInfo.js"></script>
		<script src="${ctx}/script/ablumn.js"></script>
		<script src="${ctx}/script/plugins.js"></script>
		<script src="${ctx}/script/detail.js"></script>
		
	</head>
	<body>
		<header>
		<jsp:include page="/top.jsp">
			<jsp:param value="inv" name="menu" />
		</jsp:include> <!--列表-->
			
		<!--信息详细-->
		<div class="item-detail wrap">
			<div class="breadcrumbs">
				<a href="index.html">首页</a>&gt;
				<a href="#">散标投资列表</a>&gt; <span class="cur">项目详情</span> </div>
			<div class="item-detail-head clearfix" data-target="sideMenu">
				<div class="hd">	
			 <i class="icon	
				<c:choose>
					<c:when test="${invProjectSingle.invProject.projectType ==1 }">icon-che</c:when>
					<c:when test="${invProjectSingle.invProject.projectType ==2 }">icon-fang</c:when>
					<c:when test="${invProjectSingle.invProject.projectType ==3 }">icon-shu</c:when>
					<c:when test="${invProjectSingle.invProject.projectType ==4 }">icon-zhai</c:when>
				</c:choose>
				"></i>
					<h2>${invProjectSingle.invProject.projectName }</h2>
				</div>
				<div class="bd clearfix">
					<div class="data">
						<ul>
							<li> <span class="f16">借款金额</span><br>
								<span class="f30 c-333" id="account">${invProjectSingle.invProject.invTotbalance }</span>元 </li>
							 <li class="relative"><span class="f16">年利率</span><br>
								<span class="f30 c-orange">${invProjectSingle.invProject.rate }</span>.00% </li>
							<li><span class="f16">借款期限</span><br>
								<span class="f30 c-333">${invProjectSingle.invProject.paybackTime }</span>个月 </li> 
							<li><span class="c-888">借款编号：</span>${invProjectSingle.invProject.invNo }</li>
							<li><span class="c-888">发标日期：</span>
								<fmt:formatDate value="${invProjectSingle.invProject.biddingDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
							</li>
							<li><span class="c-888">保障方式：</span>${invProjectSingle.invProject.safeWay }</li>
							<li><span class="c-888">还款方式：</span>
								<c:choose>
											<c:when test="${invProjectSingle.invProject.paybackWay ==0 }">到期还本还息</c:when>
											<c:when test="${invProjectSingle.invProject.paybackWay ==1 }">按月付息，到期还本</c:when>
											<c:when test="${invProjectSingle.invProject.paybackWay ==2 }">等额本息</c:when>
								</c:choose>
							 </li>
							<li><span class="c-888">需还本息：</span> ${invProjectSingle.invProject.invTotbalance + invProjectSingle.invProject.interest }</li>
							<li><span class="c-888">借款用途：</span>${invProjectSingle.invProject.loanReason }</li>
							<li class="colspan"> <span class="c-888 fl">投标进度：</span>
								<div class="progress-bar fl"> <span style="width:100%"></span> </div>
								<span class="c-green">${(invProjectSingle.invProject.invBalance/invProjectSingle.invProject.invTotbalance)*100 }</span>% </li>
							<li> <span class="c-888">投资范围：</span> <span id="account_range">${invProjectSingle.invProject.minInvBalance }~${invProjectSingle.invProject.maxInvBalance }
            </span> </li>
						</ul>
					</div>
					<div class="mod-right mod-status">
						<div class="inner">
							<div class="text"> 可投金额：<span class="f24 c-333">${invProjectSingle.invProject.invTotbalance - invProjectSingle.invProject.invBalance }</span>元<br>
								<div class="info-2" style="padding-bottom: 10px;"><span class="info2-input">
								<!-- 投资表单 -->
								<form action="4444" method="post" id="invBalanceForm">
								  <input type="hidden" value="" name="userId"/>
				                  <input type="text" id="investBalance" placeholder="投资金额" class="tx-txt" style="width: 206px;height: 23px;" />
				                  <span class="info-tit">元</span>
													<span class="quick-error3" id="investError"></span> </div>
													<div class="info-2" style="padding-bottom: 10px;"><span class="info2-input">
				                  <input type="password" id="password" placeholder="交易密码" class="tx-txt" style="width: 206px;height: 23px;" />
													<span class="quick-error3" id="investError"></span> </div>
											
								<input type="submit" id="submit" value="我要投资" style=" float: left;width: 233px;height: 28px;background: #f66257;font-size: 20px;color: #fff;border-radius: 2px;border: none;cursor: pointer;transition: background 0.3s ease-in-out;" onclick="return getShowPayVal1()" />
									<i class="icon icon-status icon-status1"></i><br />
									<span id="errorInfo" style="color: red;"></span>
								</form>
									
								</div>
								
						</div>
						
					</div>
					
						
				</div>
				<div class="item-detail-body clearfix mrt30 ui-tab">
					<div class="ui-tab-nav hd"> <i class="icon-cur" style="left: 39px;"></i>
						<ul>
							<li class="nav_li active" id="nav_1">
								<a href="javascript:;">借款信息</a>
							</li>
							<li class="nav_li" id="nav_2">
								<a href="javascript:;">投资记录</a> <i class="icon icon-num1" style="margin-left: -15px;"> <span id="tender_times">23</span> <em></em> </i> </li>
							<li class="nav_li" id="nav_3">
								<a href="javascript:;">还款列表</a>
							</li>
						</ul>
					</div>
					<div class="bd">
						<div class="ui-tab-item active" style="display: block;">
							<div class="borrow-info">
								<dl class="item">
									<dt>
              <h3>借款人介绍</h3>
            </dt>
									<dd>
										<div class="text">
											${invProjectSingle.invProject.borrowerInfo }
										</div>
									</dd>
								</dl>
								<dl class="item">
									<dt>
              <h3>审核信息</h3>
            </dt>
									<dd>
										<div class="verify clearfix">
											<ul>
												<li><i class="icon icon-4"></i><br> 身份证
												</li>
												<li><i class="icon icon-5"></i><br> 户口本
												</li>
												<li><i class="icon icon-6"></i><br> 结婚证
												</li>
												<li><i class="icon icon-7"></i><br> 工作证明
												</li>
												<li><i class="icon icon-8"></i><br> 工资卡流水
												</li>
												<li><i class="icon icon-9"></i><br> 收入证明
												</li>
												<li><i class="icon icon-10"></i><br> 征信报告
												</li>
												<li><i class="icon icon-11"></i><br> 亲属调查
												</li>
												<li><i class="icon icon-19"></i><br> 行驶证
												</li>
												<li><i class="icon icon-20"></i><br> 车辆登记证
												</li>
												<li><i class="icon icon-21"></i><br> 车辆登记发票
												</li>
												<li><i class="icon icon-22"></i><br> 车辆交强险
												</li>
												<li><i class="icon icon-23"></i><br> 车辆商业保险
												</li>
												<li><i class="icon icon-24"></i><br> 车辆评估认证
												</li>
											</ul>
										</div>
									</dd>
								</dl>
								<dl class="item">
									<dt>
              <h3>风控步骤</h3>
            </dt>
									<dd>
										<div class="text">
												${invProjectSingle.invProject.riskControl} 
										</div>
										<div class="step clearfix">
											<ul>
												<li><i class="icon icon-1"></i>资料审核</li>
												<li><i class="icon icon-2"></i>实地调查</li>
												<li><i class="icon icon-3"></i>资产评估</li>
												<li class="no"><i class="icon icon-4"></i>发布借款</li>
											</ul>
										</div>
										<div class="conclusion f16"> 结论：经风控部综合评估， <span class="c-orange">同意放款${invProjectSingle.invProject.invTotbalance }元；</span> <i class="icon icon-status icon-status1"></i> </div>
									</dd>
								</dl>
								<dl class="item">
									<dt>
              <h3>权证信息</h3>
            </dt>
									<dd>
										<div class="warrant"> <span class="f14 c-888">（注：为保护借款人的个人隐私信息，实物材料对部分信息进行了隐藏处理）</span>
											<div class="album" id="album">
												<div class="album-show">
													<div class="loading" style="display: none;"></div>
													<img src="images/news.jpg"> </div>
												<div class="album-thumb">
													<a href="javascript:;" class="btn btn-prev"></a>
													<a href="javascript:;" class="btn btn-next"></a>
													<div style="visibility: visible; overflow: hidden; position: relative; z-index: 2; left: 0px; width: 1070px;" class="container" id="albumThumb">
														<ul style="margin: 0px; padding: 0px; position: relative; list-style-type: none; z-index: 1; width: 1926px; left: 0px;">
															<li style="overflow: hidden; float: left; width: 164px; height: 108px;">
																<a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a>
															</li>
															<li style="overflow: hidden; float: left; width: 164px; height: 108px;">
																<a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a>
															</li>
															<li style="overflow: hidden; float: left; width: 164px; height: 108px;">
																<a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a>
															</li>
															<li style="overflow: hidden; float: left; width: 164px; height: 108px;">
																<a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a>
															</li>
															<li style="overflow: hidden; float: left; width: 164px; height: 108px;">
																<a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a>
															</li>
															<li style="overflow: hidden; float: left; width: 164px; height: 108px;">
																<a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a>
															</li>
															<li style="overflow: hidden; float: left; width: 164px; height: 108px;">
																<a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a>
															</li>
															<li style="overflow: hidden; float: left; width: 164px; height: 108px;">
																<a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a>
															</li>
															<li style="overflow: hidden; float: left; width: 164px; height: 108px;">
																<a class="small_img" id="images/news.jpg"><img src="images/news.jpg"></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</dd>
								</dl>
							</div>
						</div>
						<div class="ui-tab-item" style="display: none;">
							<div class="repayment-list"> 目前投标总额：<span class="c-orange">${invProjectSingle.invProject.invBalance }元</span>&nbsp;&nbsp; 剩余投标金额：
								<span class="c-orange">${invProjectSingle.invProject.invTotbalance - invProjectSingle.invProject.invBalance } 元</span>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tbody>
										<tr>
											<th>投标人</th>
											<th>投标金额</th>
											<th>投标时间</th>
											<th>投标方式</th>
										</tr>
									</tbody>
									<tbody id="repayment_content">
									<c:forEach items="${invProjectSingle.invRecord}" var="invRecord">
										<tr>
											<td>${invRecord.invUserName } </td>
											<td><span class="c-orange">￥${invRecord.invrecMoney }</span></td>
											<td>
												<fmt:formatDate value="${invRecord.invDate }" pattern="yyyy-MM-dd"/>
											</td>
											<td>${invRecord.invWay }</td>
										</tr>
									</c:forEach>
									</tbody>
									<tfoot>
										<tr class="page-outer">
											<td colspan="4" align="center">
												<div class="pagination clearfix"><span class="page" id="repayment_content_pager"><a class="disabled"> 上一页 </a><a class="curr">1</a><a href="javascript:void(0)">2</a><a href="javascript:void(0)" next="2">下一页</a><em>共2页</em>
                    <dl class="page-select">
                      <dt><span>1</span><i class="icon icon-down"></i></dt>
													<dd style="display: none;">
														<a href="javascript:;" total="23" spaninterval="2" content="repayment_content">1</a>
														<a href="javascript:;" total="23" spaninterval="2" content="repayment_content">2</a>
													</dd>
													</dl>
													</span>
												</div>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						<div class="ui-tab-item" style="display: none;">
							<div class="repayment-list"> 已还本息：<span class="c-orange">${invProjectSingle.repaymentBalance }.00元</span>&nbsp;&nbsp; 待还本息：
								<span class="c-orange">${invProjectSingle.invProject.invTotbalance + invProjectSingle.invProject.interest- invProjectSingle.repaymentBalance }元</span>&nbsp;&nbsp;(待还本息因算法不同可能会存误差，实际金额以到账金额为准！)
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<th>合约还款日期</th>
											<th>期数</th>
											<th>应还本金</th>
											<th>应还利息</th>
											<th>应还本息</th>
											<th>还款状态</th>
										</tr>
										<c:forEach items="${invProjectSingle.paybackPlan}" var="paybackPlan"> 
											<tr>
												<td>
													<fmt:formatDate value="${paybackPlan.planPaybackDate }" pattern="yyyy-MM-dd"/>
												</td>
												<td>${paybackPlan.paybackNo }</td>
												<td>${paybackPlan.paybackMoney }.00元</td>
												<td>${paybackPlan.paybackMargin }.00元</td>
												<td>${paybackPlan.paybackMoney+paybackPlan.paybackMargin }.00元</td>
												<td>
													<c:if test="${paybackPlan.paybackStatus ==0}">
														还款中
													</c:if>
													<c:if test="${paybackPlan.paybackStatus ==1}">
														已还款
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- 引入底部 --> <%@ include file="/buttom.jsp"%>
</html>