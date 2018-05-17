<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="w"  uri="http://com.lixiang/ssm/page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String ctx = request.getServletContext().getContextPath();
	application.setAttribute("ctx", ctx);
%>
</head>
<body>
		<h3>用户组角色</h3><a href="${ctx }/ugroup/list">《——</a>
	<div>
		<form action=ugroupRolesModify method="post">
			<input name="groupid" type="hidden" value="${ugroup.id}">
			<table>
				<thead>
					<tr>
						<td></td>
						<td>角色id</td>
						<td>角色名:</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.list}" var="role">
						<tr>
							<td><input name="id" type="checkbox" <c:if test="${role.isgrouprole ==true}">  checked="checked" </c:if> value="${role.id}" /></td>
							<td><span>${role.id}</span></td>
							<td><span>${role.roleName}</span></td>			
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button type="submit">添加</button>
		</form>
		<div class="modal-footer no-margin-top">
			<w:pager pageSize="${page.pageSize }" url="${ctx }/ugroup/ugroupRoles?id=${ugroup.id}" recordCount="${page.total }" pageNum="${page.pageNum }" />
		</div>
	</div>
</body>
</html>