<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/investManage/delInvProject" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title"><strong>删除项目</strong></h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${invProject.id }">
				<h5>请确认是否要删除该项目，删除后无法恢复</h5>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm" data-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary btn-sm">确定</button>
			</div>
		</div>
	</div>
</form>
