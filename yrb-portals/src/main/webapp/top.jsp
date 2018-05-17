<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="w" uri="http://com.lixiang/ssm/page"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String ctx = request.getServletContext().getContextPath();
	application.setAttribute("ctx", ctx);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${ctx}/css/common.css" rel="stylesheet" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx}/script/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/script/common.js"></script>
<body>
	<header>
		<div class="header-top min-width">
			<div class="container fn-clear">
				<strong class="fn-left">咨询热线：400-668-6698<span
					class="s-time">服务时间：9:00 - 18:00</span></strong>
				<ul class="header_contact">
					<li class="c_1"><a class="ico_head_weixin" id="wx"></a>
						<div class="ceng" id="weixin_xlgz" style="display: none;">
							<div class="cnr">
								<img src="images/code.png">
							</div>
							<b class="ar_up ar_top"></b> <b class="ar_up_in ar_top_in"></b>
						</div></li>
					<li class="c_2"><a href="#" target="_blank" title="官方QQ"
						alt="官方QQ"><b class="ico_head_QQ"></b></a></li>
					<li class="c_4"><a href="#" target="_blank" title="新浪微博"
						alt="新浪微博"><b class="ico_head_sina"></b></a></li>
				</ul>
				<ul class="fn-right header-top-ul">
					<li><a href="${ctx}/index.jsp" class="app">返回首页</a></li>
					<shiro:guest>
						<li>
							<div class="">
								<a href="register.html" class="c-orange" title="免费注册">免费注册</a>
							</div>
						</li>
						<li>
							<div class="">
								<a href="login.html" class="js-login" title="登录">登录</a>
							</div>
						</li>
					</shiro:guest>
					<shiro:authenticated>
						<li>
							<div class="">
								<a href="logout" class="js-login" title="退出">退出</a>
							</div>
						</li>
					</shiro:authenticated>
				</ul>
			</div>
		</div>
		<div class="header min-width">
			<div class="container">
				<div class="fn-left logo">
					<a class="" href="${ctx}/index.jsp"> <img src="${ctx }/images/logo.png"
						title="">
					</a>
				</div>
				<ul class="top-nav fn-clear">
					<li id="index"><a href="${ctx}/index.jsp">首页</a></li>
					<li id="inv"><a href="list.html" class="">我要投资</a></li>
					<li id="apply"><a href="apply.html" class="">我要借款</a></li>
					<li id="security"><a href="帮助中心.html">安全保障</a></li>
					<li class="top-nav-safe" id="usercenter"><a href="个人中心首页.html">我的账户</a></li>
					<li id="company"><a href="公司简介.html">关于我们</a></li>
				</ul>
			</div>
		</div>
	</header>
	<script type="text/javascript">
		var menu = '${param.menu}';
		$("#" + menu).addClass("on");
	</script>
</body>
</html>
