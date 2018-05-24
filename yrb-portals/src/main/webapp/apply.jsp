<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctx = request.getServletContext().getContextPath();
	application.setAttribute("ctx", ctx);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${ctx }/css/common.css" rel="stylesheet" />
<link href="${ctx }/css/register.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx }/script/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/script/common.js"></script>
<!-- <script src="script/login.js" type="text/javascript"></script> -->

<script type="text/javascript">
	function myRefersh(e) {
		const
		source = e.src; // 获得原来的 src 中的内容  
		//console.log( "source : " + source  ) ;  

		var index = source.indexOf("?"); // 从 source 中寻找 ? 第一次出现的位置 (如果不存在则返回 -1 )  
		//console.log( "index : " + index  ) ;  

		if (index > -1) { // 如果找到了 ?  就进入内部  
			var s = source.substring(0, index); // 从 source 中截取 index 之前的内容 ( index 以及 index 之后的内容都被舍弃 )  
			//console.log( "s : " + s  ) ;  

			var date = new Date(); // 创建一个 Date 对象的 一个 实例  
			var time = date.getTime(); // 从 新创建的 Date 对象的实例中获得该时间对应毫秒值  
			e.src = s + "?time=" + time; // 将 加了 尾巴 的 地址 重新放入到 src 上  

			//console.log( e.src ) ;  
		} else {
			var date = new Date();
			e.src = source + "?time=" + date.getTime();
		}
	}
	
	function isVerifyCode(){
		 var flag=false;
		 var jpgVerify=$.trim($("#jpgVerify").val());
		 $("#jpgVerify").val(jpgVerify);
		 if(jpgVerify.length<1){
			 $("#yanzhengmaspan").html("验证码不能为空");
			 $("#yanzhengmaspan").css("color","red");
			 $("#yanzhengmaspan").show();
			 return flag;
		 }else{
			 $("#yanzhengmaspan").hide();
		 }
		 var param={};
		 param.code=jpgVerify;
		 $.ajax({
			   type: "POST",
			   url: "${ctx}/verifyCode/isCode",
			   data: param,
			   dataType:"json",
			   async: false,
			   success: function(data){
				   if(data=="0"){
					   $("#yanzhengmaspan").html("验证码错误");
					   $("#yanzhengmaspan").css("color","red");
						$("#yanzhengmaspan").show();
						flag=false;
				   }else{	
					   $("#yanzhengmaspan").html("验证码正确");
					   $("#yanzhengmaspan").css("color","green");
					   $("#yanzhengmaspan").show();
						flag=true;
				   }
			   }
		 });
		 return flag;
	 }
	function isRealNAame() {		
		var flag = false;
		var realName = $.trim($("#realName").val());
		if(realName.length<1){
			 $("#namespan").html("姓名不能为空");
			 $("#namespan").css("color","red");
			 $("#namespan").show();
			 return flag;
		 }else{
			 $("#namespan").hide();
		 };
		var param = {};
		param.realName = realName;
		 $.ajax({
			   type: "POST",
			   url: "${ctx}/userInfo/isRealName",
			   data: param,
			   dataType:"json",
			   async: false,
			   success: function(data){				  
				   if(data == 0){
					    $("#namespan").html("用户身份没有认证");
						$("#namespan").css("color", "red");
						$("#namespan").show();
						flag = false;
				   }
				   else if(data == 1){
					   $("#namespan").html("请输入您的真实姓名");
						$("#namespan").css("color", "red");
						$("#namespan").show();
						flag = false;
				   }
				   else if(data == 2){
					    window.location.href='${ctx}/views/login.jsp';
						flag = false;
				   }
				   else {
						$("#namespan").html("姓名可用");
						$("#namespan").css("color", "green");
						$("#namespan").show();
						flag = true;
					}
			   }
		 });
		return flag;
	}
	
	function isPhoneNum() {		
		var flag = false;
		var uPattern = /^1[3,4,5,7,8]\d{9}$/;
		var phoneNum = $.trim($("#phoneNum").val());
		if(phoneNum.length<1){
			 $("#phonespan").html("手机号不能为空");
			 $("#phonespan").css("color","red");
			 $("#phonespan").show();
			 return flag;
		 }
		else if(!uPattern.test(phoneNum)){
			$("#phonespan").html("这不是一个手机号码");
			 $("#phonespan").css("color","red");
			 $("#phonespan").show();
			 return flag;
		}
		else{
			 $("#phonespan").hide();
		 };
		var param = {};
		param.phoneNum = phoneNum;
		 $.ajax({
			   type: "POST",
			   url: "${ctx}/userInfo/isPhoneNum",
			   data: param,
			   dataType:"json",
			   async: false,
			   success: function(data){				  
				   if(data == 0){
					    $("#phonespan").html("用户身份没有认证");
						$("#phonespan").css("color", "red");
						$("#phonespan").show();
						flag = false;
				   }
				   else if(data == 1){
					   $("#phonespan").html("手机号码未认证");
						$("#phonespan").css("color", "red");
						$("#phonespan").show();
						flag = false;
				   }
				   else {
						$("#phonespan").html("号码可用");
						$("#phonespan").css("color", "green");
						$("#phonespan").show();
						flag = true;
					}
			   }
		 });
		return flag;
	}
	
	
	function isLoanTerm(){
		var uPattern = /^[1-9][0-9]{0,3}$/;
		var loanTerm = $.trim($("#loanTerm").val());
		
		if(loanTerm.length<1){
			 $("#loanTermspan").html("借款期限不能为空");
			 $("#loanTermspan").css("color","red");
			 $("#loanTermspan").show();
			 return false;
		}else if(!uPattern.test(loanTerm)){
			 $("#loanTermspan").html("必须是数字且为整月，1~999");
			 $("#loanTermspan").css("color","red");
			 $("#loanTermspan").show();
			 return false;
		}else{
			$("#loanTermspan").html("期限日期可用");
			$("#loanTermspan").css("color", "green");
			$("#loanTermspan").show();
			return true;
		}		
	}
	
	function isLoanBalance(){
		var uPattern = /^[1-9][0-9]{4,9}$/;
		var loanBalance = $.trim($("#loanBalance").val());
		
		if(loanBalance.length<1){
			 $("#loanBalancespan").html("借款金额不能为空");
			 $("#loanBalancespan").css("color","red");
			 $("#loanBalancespan").show();
			 return false;
		}else if(!uPattern.test(loanBalance)){
			 $("#loanBalancespan").html("必须是数字且为整数，10000~999999999");
			 $("#loanBalancespan").css("color","red");
			 $("#loanBalancespan").show();
			 return false;
		}else{
			$("#loanBalancespan").html("金额可用");
			$("#loanBalancespan").css("color", "green");
			$("#loanBalancespan").show();
			return true;
		}		
	}
	
	function isAddress(){
		
		var isAddress = $.trim($("#address").val());
		
		if(isAddress.length<1){
			 $("#addressspan").html("所在地区不能为空");
			 $("#addressspan").css("color","red");
			 $("#addressspan").show();
			 return false;
		}else{
			$("#addressspan").html("所在地区可用");
			$("#addressspan").css("color", "green");
			$("#addressspan").show();
			return true;
		}		
	}
		
	function submitApply(){
						
		if(isRealNAame() && isPhoneNum() && isLoanBalance() && isLoanTerm() && isVerifyCode()){			
			var param={};			
			param.realName = $.trim($("#realName").val());
			param.contactNumber = $.trim($("#phoneNum").val());
			param.loanBalance = $.trim($("#loanBalance").val());
			param.loanTerm = $.trim($("#loanTerm").val());
			param.address = $.trim($("#address").val());
			param.code=$.trim($("#jpgVerify").val());
			$.ajax({
				   type: "POST",
				   url: "${ctx}/loanApplicationController/loanApplication",
				   data: param,
				   dataType:"json",
				   async: false,
				   success: function(data){
					   var flag=data.flag;
					   var msg=data.msg;
					   if(flag=="1"){
						   alert(msg);
						   window.location.href='${ctx}/login.jsp';
					   }else if(flag=="2"){
						   alert(msg);
					   }
					   else if(flag=="3"){
						   alert(msg);
					   }
					   else if(flag=="4"){
						   alert(msg);
					   }else{
						   alert(msg);
						   window.location.href='${ctx}/loanApplicationController/index';
					   }
				   }
			 });
		}
	}		
</script>
</head>
<body>
<!-- 引入头部 -->
<jsp:include page="/top.jsp">
	<jsp:param value="apply" name="menu"/>
</jsp:include>
<!--注册-->
<div class="wrap">
 <form id="LonginForm" name="LonginForm" action="" method="post">
	<div class="tdbModule loginPage">
		<div class="registerTitle">借款申请</div>
		<div class="registerCont">
			<ul>
				<li>
					<span class="dis">真实姓名：</span><input class="input" type="text" onblur="isRealNAame();" name="realName" id="realName" maxlength="24" tabindex="1" autocomplete="off" placeholder="请输入真实姓名"> 
					<span id="namespan"></span>
				</li>
				<li>
					<span class="dis">手机号码：</span><input class="input" type="text" onblur="isPhoneNum();" name="phoneNum" id="phoneNum" maxlength="11" tabindex="1" autocomplete="off" placeholder="请输入联系电话"> 
					<span id="phonespan"></span>
				</li>
				<li>
					<span class="dis">借款金额：</span><input class="input" type="text" onblur="isLoanBalance();" name="loanBalance" id="loanBalance" maxlength="10" tabindex="1" autocomplete="off" placeholder="请输入借款金额"> 
					<span id="loanBalancespan"></span>
				</li>
				<li>
					<span class="dis">借款期限：</span><input class="input" type="text" onblur="isLoanTerm();" name="loanTerm" id="loanTerm" maxlength="3" tabindex="1" autocomplete="off" placeholder="请输入借款期限    ~月"> 
					<span id="loanTermspan"></span>
				</li>
				<li>
					<span class="dis">所在地区：</span><input class="input" type="text" onblur="isAddress();" name="address" id="address" maxlength="25" tabindex="1" autocomplete="off" placeholder="请输入所在地区"> 
					<span id="addressspan"></span>
				</li>
				<li>
				  <span class="dis">验证码：</span><input type="text" id="jpgVerify" style="width:166px;" class="input" name="yzm" data-msg="验证码" maxlength="6" tabindex="1" autocomplete="off" onblur="isVerifyCode();">
						<img src="${ctx }/verifyCode/code" id="yanzheng" alt="点击更换验证码" title="点击更换验证码" style="cursor:pointer;" class="valign" onclick="myRefersh(this)">
					<span id="yanzhengmaspan"></span>
				</li>
				<li class="btn"> 
					<input type="button" class="radius1" value="立即申请" id="submitBtn" onclick="submitApply()">
				</li>
			</ul>
		</div>
	</div>
 </form>
</div>
<!-- 引入底部 -->
<%@ include file="/buttom.jsp" %>
</body>
</html>
