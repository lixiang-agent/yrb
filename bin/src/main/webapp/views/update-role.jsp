<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/updateSaveRoleInfo" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>修改角色信息</strong>
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${roles.id }">
				<table class="table">
					<thead>
						<tr>
							<td>角色名称:</td>
							<td><input type="text" name="roleName" class="form-control" value="${roles.roleName }"></td>
						</tr>
						<tr>
							<td>角色描述:</td>
							<td><input type="text" name="roleDesc" class="form-control" value="${roles.roleDesc }"></td>
						</tr>
						
					</thead>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm"
					data-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary btn-sm">保存</button>
			</div>
		</div>
	</div>
</form>
