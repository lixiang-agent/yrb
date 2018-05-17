<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增角色</title>
</head>
<body>
	<h3>新增角色</h3>
	<div>
		<form action="addRolesList" method="post">
			<p>
				角色名称:<input name="roleName">
			</p>
			<p>
				角色描述:<input name="roleDesc">
			</p>
			<p>
				<input type="submit"> <input type="reset">
			</p>
		</form>
	</div>
</body>
</html>