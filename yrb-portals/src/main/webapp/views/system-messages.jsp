<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="w"  uri="http://com.lixiang/ssm/page"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${ctx}/css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/user.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery.datetimepicker.css"/>
<script type="text/javascript" src="${ctx}/script/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/script/common.js"></script>
<script src="${ctx}/script/user.js" type="text/javascript"></script>
</head>
<body>

<!-- 引入头部 -->
<jsp:include page="/top.jsp">
	<jsp:param value="system-messages" name="menu"/>
</jsp:include>

<!--个人中心-->
<div class="wrapper wbgcolor">
  <div class="w1200 personal">
    <div class="credit-ad"><img src="${ctx}/images/clist1.jpg" width="1200" height="96"></div>
    <div id="personal-left" class="personal-left">
      <ul>
        <li class="pleft-cur"><span><a href="个人中心首页.html"><i class="dot dot1"></i>账户总览</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="个人中心-资金记录 .html">资金记录</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="个人中心-投资记录.html">投资记录</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="个人中心-回款计划.html">回款计划</a></span></li>
        <li class=""><span><a href="个人中心-开通第三方1.html"><i class="dot dot02"></i>开通第三方</a> </span> </li>
        <li><span><a href="个人中心-充值1.html"><i class="dot dot03"></i>充值</a></span></li>
        <li class=""><span><a href="个人中心-提现1.html"><i class="dot dot04"></i>提现</a></span></li>
        <li style="position:relative;" class=""> <span> <a href="个人中心-我的红包.html"> <i class="dot dot06"></i> 我的红包 </a> </span> </li>
        <li class=""><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="个人中心-兑换历史.html">兑换历史</a></span></li>
        <li style="position:relative;"> <span> <a href="${ctx}/sysmsg/list"><i class="dot dot08"></i>系统信息 </a> </span> </li>
        <li><span><a href="个人中心-账户设置.html"><i class="dot dot09"></i>账户设置</a></span></li>
      </ul>
    </div> 
    <label id="typeValue" style="display:none;"> </label>
    <div class="personal-main">
      <div class="personal-xtxx">
      
        <h3><i>系统消息</i></h3>
        <form id="form" name="form" method="post" action="${ctx}/sysmsg/list">
          <input type="hidden" name="form" value="form">
          <span id="form:dataTable">
          <script type="text/javascript">
								//<![CDATA[
									$(function(){
										$("#pxtxx-list li").click(function(){
											var changeStatusTag = false;
											if($(this).children("span").hasClass("pxtxx-newmail")){
												$(this).children("span").removeClass("fb");
												$(this).children("span.pxtxx-newmail").removeClass("pxtxx-newmail").addClass("pxtxx-mail");	
												changeStatusTag = true;
											}
											$(this).children(".pxtxx-notice").show();
											/*var displayValue = $(this).children(".pxtxx-notice").css("display");
											if("block"==displayValue || "inline"==displayValue){
												$(this).css("background-color","#fff");
												$(this).mouseover(function(){
													$(this).css("background-color","#fff");
												});
												$(this).mouseout(function(){
													$(this).css("background-color","#fff");
												});
											}else if("none"==$(this).children(".pxtxx-notice").css("display")){
												$(this).css("background-color","#F8F8F8");
												$(this).mouseover(function(){
													$(this).css("background-color","#F8F8F8");
												});
												$(this).mouseout(function(){
													$(this).css("background-color","#fff");
												});
												
											}*/
											$(this).siblings().children(".pxtxx-notice").css("display","none");
											if(changeStatusTag){
												$(this).children("a").click();
												$(this).click();
											}
										});
									});
									
								//]]>
								</script>
          <div id="pxtxx-tab" class="pxtxx-tab">
            <ul>
              <li class="on"><a  href="#" style="color:#fff;padding:5px 22px;display:block;" title="全部">全部</a> </li>
            </ul>
            	<span class="xxsz" style="display:none;">消息设置</span></div>
            	
				<div class="pxtxx-title">
					<span class="pxtxx-type">信息类型</span>
					<span class="pxtxx-con">信息内容</span>
					<span class="pxxtx-date">发送时间</span>
					<span class="pxxtx-sta">查阅状态</span>
				</div>
			<div id="pxtxx-list" class="pxtxx-list">
				<c:forEach items="${page.list}" var="sm" varStatus="stat">
				<ul>
						<li>
						<span class="pxtxx-type">${sm.type}</span>
						<span class="pxtxx-con">${sm.content }	</span>
						<span class="pxxtx-date"><fmt:formatDate value="${sm.sendingTime }"
								pattern="yyyy-MM-dd" /></span>
						<span class="pxxtx-sta">${sm.status=='1'?"已读":"未读"}</span></li>
				</ul>
				</c:forEach>
			</div>
        </form>
        <div >
			<w:pager pageSize="${page.pageSize }" url="${ctx }/ugroup/list"
			recordCount="${page.total }" pageNum="${page.pageNum }" />
	</div>
 		
      </div>
    </div>
    <div class="clear"></div>
  </div>
 		
</div>

<!-- 引入底部 -->
 <%@ include file="/buttom.jsp" %> 

<script src="${ctx}/script/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="${ctx}/script/datepicker.js" type="text/javascript"></script>
</body>
</html>
