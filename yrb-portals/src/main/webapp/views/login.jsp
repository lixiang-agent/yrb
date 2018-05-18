<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台-登录</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${ctx }/css/common.css" rel="stylesheet" />
<link href="${ctx }/css/register.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx }/script/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/script/common.js"></script>
<%-- <script src="${ctx }/script/login.js" type="text/javascript"></script> --%>


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
	
	document.onkeydown=function(e){
		 var keycode=document.all?event.keyCode:e.which;
		 if(keycode==13)submitlogin();
	};	
	
	function userNameJy(){
		 var userName=$.trim($("#userName").val());
		 $("#userName").val(userName);
		 if(userName==""){
			 $("#namespan").html("用户不能为空");
			 $("#namespan").css("color","red")
			 $("#namespan").show();
			 return false;
		 }else{
			 $("#namespan").hide();
			 return true;
		 }
	 }
	
	function ispwd(){
		 var password=$.trim($("#password").val());
		 $("#password").val(password);
		 if(password.length<6){
			 $("#pwdspan").html("密码长度不能小于6位");
			 $("#pwdspan").css("color","red")
			 $("#pwdspan").show();
			 return false;
		 }else{
			 $("#pwdspan").hide();
			 return true;
		 }
	 }
	
	function isyanzhengma(){
		 var flag=false;
		 var jpgVerify=$.trim($("#jpgVerify").val());
		 $("#jpgVerify").val(jpgVerify);
		 if(jpgVerify.length<1){
			 $("#yanzhengmaspan").html("验证码不能为空");
			 $("#yanzhengmaspan").css("color","red")
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
					   $("#yanzhengmaspan").css("color","red")
						$("#yanzhengmaspan").show();
						flag=false;
				   }else{	
					   $("#yanzhengmaspan").hide();					  
						flag=true;
				   }
			   }
		 });
		 return flag;
	 }
	
function submitForm(){
	if(userNameJy() && ispwd() && isyanzhengma()){
		var param={};
		param.account = $.trim($("#userName").val());
		param.password = $.trim($("#password").val());
		param.code = $.trim($("#jpgVerify").val());
		$.ajax({
			   type: "POST",
			   url: "${ctx}/userInfo/login",
			   data: param,
			   dataType:"json",
			   async: false,
			   success: function(data){
				   var flag=data.flag;
				   var msg=data.msg;
				   if(flag=="1"){
					   alert(msg);					   
				   }else if(flag=="2"){
					   alert(msg);
				   }
				   else if(flag=="3"){
					   alert(msg);
				   }else{
					   alert(msg);
					   window.location.href='${ctx}/index.jsp';
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
	<jsp:param value="login" name="menu"/>
</jsp:include>
<!--注册-->
<div class="wrap">
 <form id="LonginForm" name="LonginForm" action="${ctx }/userInfo/login" method="post">
	<div class="tdbModule loginPage">
		<div class="registerTitle">用户登录</div>
		<div class="registerCont">
			<ul>
				 
				<li>
					<span class="dis">用户名：</span><input class="input" type="text" onblur="userNameJy()" name="account" id="userName" maxlength="24" tabindex="1" autocomplete="off"> 
				    <a id="sssdfasdfas" href="#" class="blue">注册用户</a> &nbsp;&nbsp;&nbsp;<span id="namespan"></span>
				</li>
				<li>
				   <span class="dis">密码：</span><input class="input" type="password" name="password" id="password" maxlength="24" tabindex="1" autocomplete="off" onblur="ispwd()">  
				   <a href="#" id="pawHide" class="blue">忘记密码</a>&nbsp;&nbsp;&nbsp;<span id="pwdspan"></span>
				</li>
				<li>
				  <span class="dis" for="ZODRdi">验证码：</span><input type="text" id="jpgVerify" style="width:166px;" class="input" name="yzm" data-msg="验证码" maxlength="6" tabindex="1" autocomplete="off" onblur="isyanzhengma();">
						<img src="${ctx }/verifyCode/code" id="yanzheng" alt="点击更换验证码" title="点击更换验证码" style="cursor:pointer;" class="valign" onclick="myRefersh(this)">
					<span id="yanzhengmaspan"></span>
				<li class="btn"> 
					<input type="button" class="radius1" value="立即登录" onclick="submitForm();">
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
