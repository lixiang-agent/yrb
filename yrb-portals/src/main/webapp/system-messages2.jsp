<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/user.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script src="script/user.js" type="text/javascript"></script>
</head>
<body>

<!-- 引入头部 -->
<jsp:include page="/top.jsp">
	<jsp:param value="index" name="menu"/>
</jsp:include>

<!--个人中心-->
<div class="wrapper wbgcolor">
  <div class="w1200 personal">
    <div class="credit-ad"><img src="images/clist1.jpg" width="1200" height="96"></div>
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
        <li style="position:relative;"> <span> <a href="个人中心-系统消息.html"><i class="dot dot08"></i>系统信息 </a> </span> </li>
        <li><span><a href="个人中心-账户设置.html"><i class="dot dot09"></i>账户设置</a></span></li>
      </ul>
    </div> 
    <label id="typeValue" style="display:none;"> </label>
    <div class="personal-main">
      <div class="personal-xtxx">
        <h3><i>系统消息</i></h3>
        <form id="form" name="form" method="post" action="">
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
              <li><a href="#" style="padding:5px 22px;display:block;" title="未读">未读</a> </li>
              <li><a href="#" style="padding:5px 22px;display:block;" title="已读">已读</a> </li>
            </ul>
            <span class="xxsz" style="display:none;">消息设置</span> </div>
          <div class="pxtxx-title"> <span class="pxtxx-type ml46">消息类型</span><span class="pxtxx-con">内容</span><span class="pxxtx-date">发送时间</span> </div>
          <div id="pxtxx-list" class="pxtxx-list">
            <ul>
              <li><span class="pxtxx-type ml46">公司公告</span><span class="pxtxx-con">热烈祝贺阳光易贷新平台上线</span><span class="pxxtx-date">2015-10-1</span></li>
              <li><span class="pxtxx-type ml46">公司公告</span><span class="pxtxx-con">热烈祝贺阳光易贷新平台上线</span><span class="pxxtx-date">2015-10-1</span></li>
              <li><span class="pxtxx-type ml46">公司公告</span><span class="pxtxx-con">热烈祝贺阳光易贷新平台上线</span><span class="pxxtx-date">2015-10-1</span></li>
            </ul>
          </div>
          </span>
        </form>
        
         <%--    <h3><i>系统消息</i></h3>
       <form  action="${ctx}/sysmsg/list">
				<table class="query">
					<tr>
						<td><input type="button" value="全部">
						</td>
						<td><input type="submit" value="全部">
						</td>
					</tr>
				</table>
			</form>
			
			<table >
			<thead>
				<tr>
					<th width="50px">序号</th>
					<th width="200px">用户ID</th>
					<th width="150px">信息类型</th>
					<th width="150px">信息内容</th>
					<th width="100px">发送时间</th>
					<th width="100px">查阅状态</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${systemMessages}" var="sm" varStatus="stat">
					<tr>
						<td>${stat.count }</td>
						<td>${sm.userId }</td>		
						<td>${sm.type}</td>
						<td>${sm.content }</td>	
						<td><fmt:formatDate value="${sm.sendingTime }"
								pattern="yyyy-MM-dd" /></td>
						<td>${sm.status=='1'?"已读":"未读"}</td>
					</tr>

				</c:forEach>
			</tbody>
		</table> --%>
        
        
      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>

<!-- 引入底部 -->
<%@ include file="/buttom.jsp" %>

<script src="script/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="script/datepicker.js" type="text/javascript"></script>
</body>
</html>
