<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务器出错了~~~</title>
<style type="text/css">
* {
	font-size: 18px;
	padding-bottom: 15px;
	text-align: center;
}

#tipImg {
	background: url(${ctx}/static/image/505.jpg) center no-repeat;
	width: 500px;
	margin: 10px auto;
	height: 500px;
}

a{
	color: blue;
	text-decoration: none;

}

a:HOVER {
	text-decoration: underline;
}

</style>
</head>
<body>
	<div style="text-align: center">
		<div id="tipImg" style=""></div>
		<div>服务器内部错误，不能执行该请求!</div>
		<div>
			<a href="${ctx }/main">返回首页</a>
		</div>
	</div>
</body>
</html>