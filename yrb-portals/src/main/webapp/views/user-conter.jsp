<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="w" uri="http://com.lixiang/ssm/page"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${ctx }/css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/user.css" />
<script type="text/javascript" src="${ctx }/script/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/script/common.js"></script>
<script src="${ctx }/script/user.js" type="text/javascript"></script>
<style type="text/css">
	.ui-fileupload-choose {
		background: none;
		width: 90px;
		height: 90px;
		border: 0px none;
	}

	.ui-fileupload-choose input {
		width: 100%;
		height: 100%;
	}

	.ui-icon {
		background: none;
		width: 0px;
		height: 0px;
	}
</style>
</head>
<body>
	<!-- 引入头部 -->
	<jsp:include page="/top.jsp">
		<jsp:param value="index" name="menu" />
	</jsp:include>
	<!--个人中心-->
	<div class="wrapper wbgcolor">
		<div class="w1200 personal">
			<div class="credit-ad">
				<img src="${ctx }/images/clist1.jpg" width="1200" height="96"/>
			</div>
			<!-- 引入账户总览 -->
			<%@ include file="/account-pandect.jsp"%>
			<div class="personal-main">
				<link rel="stylesheet" type="text/css"
					href="${ctx }/css/fileupload.less.css">
					<div class="pmain-profile">
						<div class="pmain-welcome">
							<span class="fl"><span id="outLogin">晚上好，</span>${userInfo.realName }
								喝一杯下午茶，让心情放松一下~</span> <span class="fr">上次登录时间：<fmt:formatDate value="${userInfo.modifyDate }" /> 
								14:05:07 </span>
						</div>
						<div class="pmain-user">
							<div class="user-head">
								<span id="clickHeadImage" class="head-img" title="点击更换头像">
									<form method="post" action="">
										<input type="hidden" name="userPhotoUploadForm" value="userPhotoUploadForm"/> 
										<span id="userPhotoUploadForm:photo">
										<img id="userPhotoUploadForm:photoImage" src="${ctx }/images/touxiang.png" alt="" style="width: 88px; height: 88px; z-index: 0;"/> 
										<i class="headframe" style="z-index: 0;"></i>-
													<div id="userPhotoUploadForm:shangchuan-btn" class="ui-fileupload ui-widget" style="z-index: 0;" >
														<div class="ui-fileupload-buttonbar ui-corner-top">
															<span
																class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left ui-fileupload-choose"
																role="button"><span
																class="ui-button-icon-left ui-icon ui-c ui-icon-plusthick"></span><span
																class="ui-button-text ui-c"></span> 
																<input type="file" id="userPhotoUploadForm:shangchuan-btn_input" name="userPhotoUploadForm:shangchuan-btn_input" style="z-index: 0;"/>
															</span>
														</div>
														<div
															class="ui-fileupload-content ui-widget-content ui-corner-bottom">
															<table class="ui-fileupload-files">
																<tbody>
																</tbody>
															</table>
														</div>
													</div></span> <input type="hidden" name="javax.faces.ViewState"
											id="javax.faces.ViewState"
											value="2696547217205030168:-301641994240890871"
											autocomplete="off"/>
									</form>
								</span> <span class="head-icon"> <a href="#"><i
										title="第三方资金账户未认证" class="headiconbg headicon01"></i></a> <a
									href="#"><i class="headiconbg headicon2"></i></a> <a href="#"><i
										class="headiconbg headicon03"></i></a>
								</span>
							</div>
							<div class="user-info user-info1">
								<ul>
									<li>用户名<span>${userInfo.realName }</span></li>
									<li>安全级别<span><i class="safe-level"><i
												class="onlevel" style="width: 40%;"></i></i></span> <a href="#">[低]</a></li>
									<li>您还未开通第三方支付账户，请 <a class="pmain-log" href="#">立即开通</a>以确保您的正常使用和资金安全。
									</li>
								</ul>
							</div>
						</div>
						<div class="pmain-money">
							<ul>
								<li class="none"><span><em>账户总额</em><i id="zhze"
										class="markicon"></i><span class="arrow-show1"
										style="display: none;">可用余额+待收本息</span><span
										class="icon-show1" style="display: none;"></span></span> <span
									class="truemoney"><i class="f26 fb">${userInfo.totalBalance }
									</i> 元</span></li>
								<li><span><em>待收本息</em><i id="dsbx" class="markicon"></i><span
										class="arrow-show2" style="display: none;">未到账的投资项目的本金、利息总额</span><span
										class="icon-show2" style="display: none;"></span></span> <span
									class="truemoney"><i class="f26 fb">0.00 </i>元</span></li>
								<li><span><em>累计收益</em><i id="ljsy" class="markicon"></i><span
										class="arrow-show3" style="display: none;">已到账的投资收益+未到账的投资收益</span><span
										class="icon-show3" style="display: none;"></span></span> <span
									class="truemoney"><i class="f26 fb c-pink">0.00
									</i> 元</span></li>
							</ul>
						</div>
					</div>
					<script type="text/javascript">
						//<![CDATA[
						$(function() {
							$("#clickHeadImage")
									.click(
											function() {
												$(this)
														.find('span')
														.removeClass(
																'ui-state-hover');
												document
														.getElementById(
																"userPhotoUploadForm:shangchuan-btn_input")
														.click();
											});
							var safeLevel = "低";
							if (safeLevel == "高") {
								$(
										".pmain-user .user-info li .safe-level .onlevel")
										.css("background-color", "#f1483c");
							}

							$("#clickHeadImage span").hover(function() {
								$(this).removeClass('ui-state-hover');
							});

							var myDate = new Date();
							var h = myDate.getHours();
							if (h > 11 && h < 19) {
								$("#outLogin").html("下午好，");
							} else if (h > 18) {
								$("#outLogin").html("晚上好，");
							} else {
								$("#outLogin").html("上午好，");
							}
						});
						//]]>
					</script>
					<div class="pmain-connent">
						<div id="pmain-contab" class="pmain-contab">
							<ul>
								<li id="pmain-contab1" class="on">回款计划</li>
								<li id="pmain-contab2">资金记录</li>
								<li id="pmain-contab3">投资记录</li>
								<li class="li-other"></li>
							</ul>
						</div>
						<div class="pmain-conmain" id="pmain-conmain">
							<div class="pmain-conmain1">
								<div class="pmain-contitle">
									<span class="pmain-titledate">计划回款时间</span><span
										class="pmain-titleproject">项目</span><span
										class="pmain-titletype">类型</span><span
										class="pmain-titlemoney">回款金额</span>
								</div>
								<ul style="float: left;">
									<c:forEach items="${page.list }" var="results">
										<li><span class="pmain-titledate"><fmt:formatDate value="${results.planPaybackDate }" /></span><span
											class="pmain-titleproject">${results.projectName }</span>
											<span class="pmain-titletype">
												<c:if test="${results.projectType==1 }">
													车易贷
												</c:if>
												<c:if test="${results.projectType==2 }">
													房易贷
												</c:if>
												<c:if test="${results.projectType==3 }">
													赎楼贷
												</c:if>
												<c:if test="${results.projectType==4 }">
													债权贷
												</c:if>
											</span>
											<span class="pmain-titlemoney">${results.paybackMoney }</span></li>
									</c:forEach>
								</ul>
								<div class="pmain-morebtn" style="border-top: 0; margin-top: 0"></div>
							</div>
							<div class="pmain-conmain2" style="display: none;">
								<div class="pmain-contitle">
									<span class="pmain-titledate">交易时间</span><span
										class="pmain-w100">交易类型</span><span class="pmain-w120">交易金额</span>
										<span class="pmain-w200">备注</span>
								</div>
								<ul style="float: left;">
									<c:forEach items="${fundPage.list }" var="results">
										<li><span class="pmain-titledate"><fmt:formatDate value="${results.moneyTraDate }" /></span><span
											class="pmain-w100">
												<c:if test="${results.projectType==1 }">
													车易贷
												</c:if>
												<c:if test="${results.projectType==2 }">
													房易贷
												</c:if>
												<c:if test="${results.projectType==3 }">
													赎楼贷
												</c:if>
												<c:if test="${results.projectType==4 }">
													债权贷
												</c:if>
											</span>
											<span class="pmain-w120 pmain-money">${results.moneyTraMoney }</span>
											<span class="pmain-w200">备注</span></li>
									</c:forEach>
								</ul>
								<div class="pmain-morebtn" style="border-top: 0; margin-top: 0"></div>
							</div>
							<div class="pmain-conmain3" style="display: none;">
								<div class="pmain-contitle">
									<span class="pmain-titledate">交易时间</span><span
										class="pmain-w210">投资项目</span><span class="pmain-w80">投资状态</span><span
										class="pmain-whb200">投资金额</span><span class="pmain-whb110">我的收益</span>
								</div>
								<ul style="float: left;">
									<c:forEach items="${investPage.list }" var="results">
										<li>
											<span class="pmain-titledate"><fmt:formatDate value="${results.invDate }" /></span>
											<span class="pmain-w210">${results.projectName }</span>
											<span class="pmain-w80 pmain-money">
												<c:if test="${results.projectStatus==10 }">
													待提交
												</c:if>
												<c:if test="${results.projectStatus==11 }">
													退回
												</c:if>
												<c:if test="${results.projectStatus==20 }">
													待审批
												</c:if>
												<c:if test="${results.projectStatus==30 }">
													待发布
												</c:if>
												<c:if test="${results.projectStatus==40 }">
													筹款中
												</c:if>
												<c:if test="${results.projectStatus==50 }">
													筹资成功
												</c:if>
												<c:if test="${results.projectStatus==60 }">
													还款中
												</c:if>
												<c:if test="${results.projectStatus==70 }">
													结束
												</c:if>
												<c:if test="${results.projectStatus==100 }">
													流标
												</c:if>
											</span>
											<span class="pmain-whb200 pmain-money">${results.invrecMoney }</span>
											<span class="pmain-whb110"><fmt:formatNumber type="number" value="${results.interest }" pattern="0.00" maxFractionDigits="2"></fmt:formatNumber></span>
										</li>
									<!--	<div style=" width:760px;height:200px;padding-top:100px; text-align:center;color:#d4d4d4; font-size:16px;">
										    <img src="images/nondata.png" width="60" height="60"><br><br>
										   暂无投资记录</div>-->
									</c:forEach>
								</ul>
								<div class="pmain-morebtn" style="border-top: 0; margin-top: 0"></div>
							</div>
						</div>
					</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- 引入底部 -->
	<%@ include file="/buttom.jsp"%>
</body>
</html>
