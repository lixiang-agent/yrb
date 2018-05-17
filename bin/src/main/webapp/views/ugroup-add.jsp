<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>新增用户组</h3>
	<div>
		<form action="ugroupAdd" method="post">
			<p>
				用户组名:<input name="groupName">
			</p>
			<p>
				用户组名描述:<input name="groupDesc" >
			</p>
			<input type="hidden" name="creatorId" value="${user.id}">
			<p>
				<input type="submit">
				<input type="reset">
			</p>
		</form>
	</div>
</body>
</html>