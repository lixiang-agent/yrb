<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/investManage/failOper" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>审核不通过</strong>
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${invProject.id }">
				<table class="table">
					<thead>
						<tr>
							<td>请输入审核原因:</td>
						</tr>
						<tr>
							<td><input type="text" name="remark" class="form-control"
								maxlength="100"></td>
						</tr>
					</thead>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm"
					data-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary btn-sm">确定</button>
			</div>
		</div>
	</div>
</form>
