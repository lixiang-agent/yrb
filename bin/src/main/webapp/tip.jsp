<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx} /css/common.css">
<c:set var="ctx" value="${pageContext.request.contextPath }"
	scope="application"></c:set>

<style type="text/css">
#tip-window {
	height: 200px;
	width: 300px;
	border: 1px solid #ccc;
	position: fixed;
	bottom: 5px;
	right: 5px;
	display: none;
}

#tip-window .title {
	height: 40px;
	line-height: 40px;
	font-size: 16px;
	background-color: #C1C1C1;
	text-indent: 20px;
	font-weight: bold;
}

#tip-window .result {
	margin-top: 20px;
	text-indent: 50px;
	color: green;
}

#tip-window .result i {
	background: url(img/accept.png) no-repeat;
	display: inline-block;
	width: 20px;
	height: 20px;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div id="tip-window">
		<div class="title">操作结果</div>
		<div class="result">
			<i></i>操作成功
		</div>
	</div>
	<script type="text/javascript">
		function showTipWindow() {
			$("#tip-window").slideDown();
		}

		function hideTipWindow() {
			$("#tip-window").slideUp();
		}

		//操作之后提示
		//从session中获取操作结果
		var result = '${oper_result}';

		if (result == 'true') {
			//显示提示窗口
			showTipWindow();
			//5秒后隐藏
			setTimeout("hideTipWindow()", 3000);
		}

		if (result == 'false') {
			$("#tip-window .result").text("操作失败..");
			//显示提示窗口
			showTipWindow();
			//5秒后隐藏
			setTimeout("hideTipWindow()", 5000);
		}
	</script>
	<c:remove var="oper_result" scope="session" />
</body>
</html>