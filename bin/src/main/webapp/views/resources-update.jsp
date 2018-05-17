<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/resources/update" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title"><strong>修改资源</strong></h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${resources.id }">
				<table class="table">
					<thead>
						<tr>
							<td>资源名称:</td>
							<td><input type="text" name="resName" class="form-control" value="${resources.resName }" maxlength="12"></td>
						</tr>
						<tr>
							<td>资源地址:</td>
							<td><input type="text" name="resUrl" class="form-control" value="${resources.resUrl }" maxlength="8"></td>
						</tr>
						<tr>
							<td>权限:</td>
							<td><input type="text" name="auth" class="form-control" value="${resources.auth }" maxlength="8"></td>
						</tr>
						<tr>
							<td>描述:</td>
							<td><input type="text" name="resDesc" class="form-control" value="${resources.resDesc }" maxlength="12"></td>
						</tr>
						<tr>
							<td>类型:</td>
							<td>
								<label class="radio-inline"><input type="radio" name="type" value="1" ${resources.type==1?"checked='checked'":"" }>行为</label>
								<label class="radio-inline"><input type="radio" name="type" value="0" ${resources.type==0?"checked='checked'":"" }>其他</label>
							</td>
						</tr>
					</thead>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm" data-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary btn-sm">保存</button>
			</div>
		</div>
	</div>
</form>
