<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/resources/delResources" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title"><strong>删除资源</strong></h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${resources.id }">
				<h5>是否确定要删除此资源，如何该资源被删除则无法恢复，请慎重！！！</h5>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm" data-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary btn-sm">确定</button>
			</div>
		</div>
	</div>
</form>
