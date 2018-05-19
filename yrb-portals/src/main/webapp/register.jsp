<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%
	String ctx = request.getServletContext().getContextPath();
	application.setAttribute("ctx", ctx);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台-注册</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/common.css" rel="stylesheet" />
<link href="css/register.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="script/common.js"></script>
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

	document.onkeydown = function(e) {
		var keycode = document.all ? event.keyCode : e.which;
		if (keycode == 13)
			submitzhuc();
	};
	
	
	
	function isAccount() {		
		var flag = false;
		var uPattern = /^[a-zA-Z][a-zA-Z0-9_]{5,23}$/;
		var account = $.trim($("#account").val());
		if (account.length < 6) {
			$("#userNameAlt").html("用户长度不能小于6位");
			$("#userNameAlt").css("color", "red");
			$("#userNameAlt").show();
			return flag;
		} else if (!uPattern.test(account)) {
			$("#userNameAlt").html("6-24个字符，字母开头，字母、数字下划线组成");
			$("#userNameAlt").css("color", "red");
			$("#userNameAlt").show();
			return flag;
		} else {
			$("#userNameAlt").html("用户名可用");
			$("#userNameAlt").css("color", "green");
			$("#userNameAlt").show();			
		} 
		var param = {};
		param.account = account;
		 $.ajax({
			   type: "POST",
			   url: "${ctx}/userInfo/isAccount",
			   data: param,
			   dataType:"json",
			   async: false,
			   success: function(data){
				   if (data == 1) {
						$("#userNameAlt").html("用户名重复");
						$("#userNameAlt").css("color", "red");
						$("#userNameAlt").show();
						flag = false;
					} else {
						$("#userNameAlt").html("用户名可用");
						$("#userNameAlt").css("color", "green");
						$("#userNameAlt").show();
						flag = true;
					}
			   }
		 });
		return flag;
	}

	function isyanzhengma() {
		var flag = false;
		var jpgVerify = $.trim($("#jpgVerify").val());
		$("#jpgVerify").val(jpgVerify);
		if (jpgVerify.length < 1) {
			$("#yanzhengmaspan").html("验证码不能为空");
			$("#yanzhengmaspan").css("color", "red");
			$("#yanzhengmaspan").show();
			return flag;
		} else {
			$("#yanzhengmaspan").hide();
		}
		var param = {};
		param.code = jpgVerify;
		$.ajax({
			type : "POST",
			url : "${ctx}/verifyCode/isCode",
			data : param,
			dataType : "json",
			async : false,
			success : function(data) {
				if (data == "0") {
					$("#yanzhengmaspan").html("验证码错误");
					$("#yanzhengmaspan").css("color", "red");
					$("#yanzhengmaspan").show();
					flag = false;
				} else {
					$("#yanzhengmaspan").html("验证码正确");
				   $("#yanzhengmaspan").css("color","green");
				   $("#yanzhengmaspan").show();
					flag = true;
				}
			}
		});
		return flag;
	}

	function ispwd() {
		var pwd = $.trim($("#password").val());
		if (pwd.length < 6) {
			$("#passwordAlt").html("6-24个字符，英文、数字组成，区分大小写");
			$("#passwordAlt").css("color", "red");
			$("#passwordAlt").show();
			return false;
		} 		
		else {
			$("#passwordAlt").html("密码格式正确");
			$("#passwordAlt").css("color", "green");
			$("#passwordAlt").show();
			return true;
		}
	}

	function isqpwd() {
		var pwd = $.trim($("#password").val());
		var qpwd = $.trim($("#repeatPassword").val());
		if (pwd != qpwd) {
			$("#repeatPasswordAlt").html("两次密码不一致");
			$("#repeatPasswordAlt").css("color", "red");
			$("#repeatPasswordAlt").show();
			return false;
		} else {
			$("#repeatPasswordAlt").html("两次密码一致");
			$("#repeatPasswordAlt").css("color", "green");
			$("#repeatPasswordAlt").show();
			return true;
		}
	}
	
	function isPhoneNum() {		
		var flag = false;
		var uPattern = /^1[3,4,5,7,8]\d{9}$/;
		var phoneNum = $.trim($("#phoneNum").val());
		if(phoneNum.length<1){
			 $("#phoneJy").html("手机号不能为空");
			 $("#phoneJy").css("color","red");
			 $("#phoneJy").show();
			 return flag;
		 }
		else if(!uPattern.test(phoneNum)){
			 $("#phoneJy").html("这不是一个手机号码");
			 $("#phoneJy").css("color","red");
			 $("#phoneJy").show();
			 return flag;
		}
		else{
			 $("#phoneJy").html("手机号码可用");
			 $("#phoneJy").css("color","green");
			 $("#phoneJy").show();
			 flag = true;
			 
		}
		return flag;
	}
	
	function check(){
		
         var checkbox = document.getElementById("protocol");//选中checkbox的id；
         if(checkbox.checked==true){//按钮已选中          
             document.getElementById("zhucbut").removeAttribute("disabled");//移除disabled
             return true;
         }else{
             document.getElementById("zhucbut").disadled="disabled";
             return false;
         }
       
	}
	
	function isReferee(){
		var flag = false;
		var account = $.trim($("#referee").val());
		if(account != null && account !=""){
			var param={};
			param.account = account;
			$.ajax({
			   type: "POST",
			   url: "${ctx}/userInfo/isAccount",
			   data: param,
			   dataType:"json",
			   async: false,
			   success: function(data){
				   if (data == 0) {	
					    $("#refereespan").html("推荐人不存在");
						$("#refereespan").css("color", "red");
						$("#refereespan").show();
						flag = false;					
					} else {
						$("#refereespan").html("推荐人可用");
						$("#refereespan").css("color", "green");
						$("#refereespan").show();
						flag = true;
					}
			   }
			});
		}else{
			$("#refereespan").html("请填写推荐人账户名，如无推荐人请留空");
			$("#refereespan").css("color", "black");
			$("#refereespan").show();
			flag = true;
		}
		return flag;
	}
	
	function submitzhuc(){
		
		if(isAccount() && ispwd() && isqpwd() && isyanzhengma() && check() && isPhoneNum() && isReferee()){	
			var param={};
			param.account = $.trim($("#account").val());
			param.password = $.trim($("#password").val());
			param.code = $.trim($("#jpgVerify").val());
			param.phoneNum = $.trim($("#phoneNum").val());
			param.referee = $.trim($("#referee").val());
			$.ajax({
				   type: "POST",
				   url: "${ctx}/userInfo/register",
				   data: param,
				   dataType:"json",
				   async: false,
				   success: function(data){
					   var flag=data.flag;
					   var msg=data.msg;
					   if(flag=="1"){
						   alert(msg);					   
					   }
					   else if(flag=="2"){
						   alert(msg);
					   }
					   else{
						   alert(msg);
						   window.location.href='${ctx}/login.jsp';
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
	<jsp:param value="register" name="menu"/>
</jsp:include>
<!--注册-->
<div class="wrap">
  <div class="tdbModule register">
    <div class="registerTitle">注册账户</div>
    <div class="registerLc1">
      <p class="p1">填写账户信息</p>
      <p class="p2">验证手机信息</p>
      <p class="p3">注册成功</p>
    </div>
    <form action="${ctx}/userInfo/register" id="form" method="post">
    <div class="registerCont">
      <ul>
        <li><span class="dis">用户名:</span>
          <input type="text" name="account" id="account" class="input _userName" maxlength="24" tabindex="1" onblur="isAccount();">
          <span id="userNameAlt" data-info="6-24个字符，字母开头，字母、数字下划线组成">6-24个字符，字母开头，字母、数字下划线组成</span></li>
        
        <li><span class="dis">密码:</span>
          <input type="password" name="password" id="password" class="input _password" maxlength="24" tabindex="1" onblur="ispwd();">
          <span id="passwordAlt" data-info="6-24个字符，英文、数字组成，区分大小写">6-24个字符，英文、数字组成，区分大小写</span></li>
        
        <li><span class="dis">确认密码:</span>
          <input type="password" name="repeatPassword" id="repeatPassword" class="input _repeatPassword" maxlength="24" tabindex="1" onblur="isqpwd();">
          <span id="repeatPasswordAlt" data-info="请再次输入密码">请再次输入密码</span></li>
       
        <li> <span class="dis">验证码:</span>
          <input class="input input1 _yanzhengma" type="text" name="yanzhengma" id="jpgVerify" maxlength="6" tabindex="1" onblur="isyanzhengma();">
          <img src="${ctx }/verifyCode/code" id="yanzheng" alt="点击更换验证码" title="点击更换验证码" style="cursor:pointer;" class="valign" onclick="myRefersh(this)">
					<span id="yanzhengmaspan"></span> <span class="info" id="jpgVerifys" data-info="请输入手机验证码"></span> </li>
       
        <li class="telNumber"> <span class="dis">手机号码:</span>
          <input type="text" class="input _phoneNum" id="phoneNum" name="phoneNum" tabindex="1" maxlength="11" onblur="isPhoneNum();">
          <!-- <a href="javascript:void(0);" class="button radius1 _getkey" id="sendPhone">获取验证码</a> --> <span id="phoneJy" data-info="请输入您的常用电话">请输入您的常用电话</span></li>
       
       <!--  <li class="telNumber"><span class="dis">短信验证码:</span>
          <input id="phonVerify" type="text" class="input input1  _phonVerify" data-_id="phonVerify" tabindex="1">
          <span class="info" id="phonVerifys" data-info="请输入手机验证码">请输入手机验证码</span></li> -->
       
        <li> <span class="dis">推 荐 人:</span>
          <input type="text" class="input input1 _invist" id="referee" name="referee" onblur="isReferee();" tabindex="1" maxlength="24">
          <span id="refereespan" class="_invist_msg">请填写推荐人账户名，如无推荐人请留空</span> </li>
       
        <li class="agree">
          <input name="protocol" id="protocol" type="checkbox" value="" checked="checked" onclick="check();">
          我同意《<a href="#" target="_black">亿人宝注册协议</a>》 <span id="protocolAlt" data-info="请查看协议">请查看协议</span></li>
        <li class="btn"><input type="button" id="zhucbut" value="立即注册"  onclick="submitzhuc();" /></li>
      </ul>
    </div>
    </form>
  </div>
</div>
<c:remove var="msg" scope="session"/>
<!-- 引入底部 -->
<%@ include file="/buttom.jsp" %>
</body>
</html>
