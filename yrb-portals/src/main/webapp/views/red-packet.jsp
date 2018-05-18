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
	<jsp:param value="index" name="menu"/>
</jsp:include>

<!--个人中心-->
<div class="wrapper wbgcolor">
  <div class="w1200 personal">
    <div class="credit-ad"><img src="${ctx}/images/clist1.jpg" width="1000" height="80"></div>
    <div id="personal-left" class="personal-left">
      <ul>
        <li class="pleft-cur"><span><a href="个人中心首页.html"><i class="dot dot1"></i>账户总览</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="个人中心-资金记录 .html">资金记录</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="个人中心-投资记录.html">投资记录</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="个人中心-回款计划.html">回款计划</a></span></li>
        <li class=""><span><a href="个人中心-开通第三方1.html"><i class="dot dot02"></i>开通第三方</a> </span> </li>
        <li><span><a href="个人中心-充值1.html"><i class="dot dot03"></i>充值</a></span></li>
        <li class=""><span><a href="个人中心-提现1.html"><i class="dot dot04"></i>提现</a></span></li>
        <li style="position:relative;" class=""> <span> <a href="${ctx}/redpacket/list"> <i class="dot dot06"></i> 我的红包 </a> </span> </li>
        <li class=""><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="个人中心-兑换历史.html">兑换历史</a></span></li>
        <li style="position:relative;"> <span> <a href="个人中心-系统消息.html"><i class="dot dot08"></i>系统信息 </a> </span> </li>
        <li><span><a href="个人中心-账户设置.html"><i class="dot dot09"></i>账户设置</a></span></li>
      </ul>
    </div>
    <label id="typeValue" style="display:none;"> </label>
    <style type="text/css">
			.wdhb-tab .on  a{color:#fff;}
		</style>
    <div class="personal-main">
      <div class="personal-zqzr personal-xtxx" style="min-height: 500px;">
        <h3><i>我的红包</i></h3>
        <div class="lx-wdhb"> <span class="pay-title">兑换红包</span> <span class="pay-number">
          <form id="codeForm" name="codeForm" method="post" action="">
            <input id="codeForm:code" type="text" name="codeForm:code" class="pay-money-txt">
            <input type="submit" name="codeForm:j_idt73" value="兑换" class="btn-dh">
            <span class="cz-error" style="display:none;"> <span class="error">红包兑换码不能为空！</span> </span>
          </form>
          <script>
	        //<![CDATA[  
	          	$(function(){
	          		if(true){
	          			$("#codeForm\\:code").val("输入验证码，兑换相应面值的红包");	
	          		}
	          		$("#codeForm\\:code").blur(function(){
	          			var code = $(this).val();
	          			if(undefined == code || null == code || "" == code || "输入验证码，兑换相应面值的红包" == code){
	          				$(this).val("输入验证码，兑换相应面值的红包");	     
	          				$(".cz-error").css({"display": "block"});
	          			}
	          		});
	          		$("#codeForm\\:code").focus(function(){
	          			$(".cz-error").css({"display": "none"});
	          			var code = $(this).val();
	          			if(undefined != code && null != code && "输入验证码，兑换相应面值的红包" == code){
	          				$(this).val("");	          				
	          			}
	          		});
	          	})
	          	
	          	function checkExchangeCode(){
	          		var code = $("#codeForm\\:code").val();
          			if(undefined == code || null == code || "" == code || "输入验证码，兑换相应面值的红包" == code){
          				$(this).val("输入验证码，兑换相应面值的红包");	     
          				$(".cz-error").css({"display": "block"});
          				return false;
          			}
          			return true;
	          	}
	          	//]]>
	          </script>
          </span> </div>
        <form id="form" name="form" method="post" action="${ctx}/redpacket/list">
          <script type="text/javascript">clearPage = function() {PrimeFaces.ab({source:'form:j_idt76',formId:'form',process:'form:j_idt76',params:arguments[0]});}</script>
          <span id="form:dataTable">
          <div id="wdhb-tab" class="wdhb-tab">
            <ul>
              <li class="on"><a href="#" title="未使用">未使用 </a> </li>
            </ul>
          </div>
          <div class="wdhb-title">
          			<span class="wdhb-name">红包名称</span>
          			<span class="wdhb-con">红包简介</span>
          			<span class="wdhb-deadline">截止日期</span> 
          			<span class="wdhb-status">状态</span>
          	 </div>
          <div class="zqzr-list">
          <c:forEach items="${page.list}" var="redpacket" varStatus="stat">
            <ul>
              <li>
              <span class="wdhb-name">${redpacket.redpacketName}</span>
              <span class="wdhb-con">${redpacket.remarks}</span>
              <span class="wdhb-deadline"><fmt:formatDate value="${redpacket.stopTime}"
								pattern="yyyy-MM-dd" /></span> 
              <span class="wdhb-status">${redpacket.usedStatus=='0'?"未使用":(redpacket.usedStatus=='1'?"已使用":"已过期")}</span></li>
            </ul>
            </c:forEach>
          </div>
          <!--<div style="float:left; width:760px;height:200px;padding-top:100px; text-align:center;color:#d4d4d4; font-size:16px;">
					 <img src="images/nondata.png" width="60" height="60"><br><br>
					   暂无红包记录</div>-->
          </span>
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
</div>

<script src="${ctx}/script/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="${ctx}/script/datepicker.js" type="text/javascript"></script>
</body>
</html>
