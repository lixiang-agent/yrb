<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 发送删除请求 -->
<form action="${ctx}/modifyUser?id=${param.id}" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title"><strong>删除用户信息</strong></h4>
			</div>
			
			<div class="modal-body">
			<span style="color: red;"><h3>${strings}</h3> </span>	
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm" data-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary btn-sm">确定</button>
			</div>
		</div>
	</div>
</form>
