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
.invest-tab .on  a {
	color: #fff;
}
</style>
<script type="text/javascript">
	
	function queryInvRecord(status){
		
		$("#projectStatus").val(status);
		
		$("#form").submit();
	}

</script>
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
				<img src="${ctx }/images/clist1.jpg" width="1200" height="96" />
			</div>
			<!-- 引入账户总览 -->
			<%@ include file="/account-pandect.jsp"%>
			
			<div class="personal-main">
				<div class="personal-investnote">
					<h3>
						<i>投资记录</i>
					</h3>
					<div class="investnote-money">
						<span><b class="fb">累计投资</b><br> <i>${accInvAndProfit.invrecMoney }</i>
								元 </span> <span><b class="fb">累计收益</b><br> <i
								class="c-pink">${accInvAndProfit.paybackMoney }</i> 元 </span> <span><b
							class="fb">待收本金</b><br> <i>${dueInInvAndProfi.paybackMoney }</i>
								元 </span> <span class="none"><b class="fb">待收收益</b><br> <i>${dueInInvAndProfi.paybackMargin }</i>
								元 </span>
					</div>
					<form id="form" name="form" method="post"
						action="${ctx }/invest/investPageList">
						<input type="hidden" id="projectStatus" name="projectStatus" />
						<script type="text/javascript">
							clearPage = function() {
								PrimeFaces.ab({
									source : 'form:j_idt82',
									formId : 'form',
									process : 'form:j_idt82',
									params : arguments[0]
								});
							}
						</script>
						<span id="form:dataTable">
							<div class="invest-tab">
								<ul>
									<li ${ param.projectStatus==40 || param.projectStatus=='' ?'class="on"':'' }><span><a
											href="javascript:queryInvRecord(40);"
											title="筹款中">筹款中 </a> </span></li>
									<li ${ param.projectStatus==60?'class="on"':'' }><a
										href="javascript:queryInvRecord(60);"
										title="回款中">回款中 </a></li>
									<li ${ param.projectStatus==70?'class="on"':'' }><a
										href="javascript:queryInvRecord(70);"
										title="已结束">已结束 </a></li>
								</ul>
							</div>
					</form>



					<div class="investnote-list">
						<div class="investnote-contitle">
							<span class="investnote-w1 fb">交易时间</span> <span
								class="investnote-w2 fb">投资项目</span> <span
								class="investnote-w3 fb">状态</span> <span
								class="investnote-hbw4 fb">投资金额</span> <span
								class="investnote-hbw5 fb">我的收益</span>
						</div>
						<ul>
							<c:forEach items="${investPages.list }" var="results">
								<li><span class="investnote-w1"><fmt:formatDate
											value="${results.invDate }" /></span> <span class="investnote-w2">${results.projectName }</span>
									<span class="investnote-w3"> <c:if
											test="${results.projectStatus==40 }">
              				筹款...
              			</c:if> <c:if test="${results.projectStatus==60 }">
              				回款中 ...
              			</c:if> <c:if test="${results.projectStatus==70 }">
              				已结束
              			</c:if>
								</span><span class="investnote-hbw4">${results.invrecMoney }</span> <span
									class="investnote-hbw5"><fmt:formatNumber type="number"
											value="${results.interest }" pattern="0.00"
											maxFractionDigits="2"></fmt:formatNumber></span></li>
							</c:forEach>
						</ul>
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
