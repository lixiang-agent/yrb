<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<form action="${ctx }/investManage/listOperProject" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>该项目操作记录</strong>
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${operRecord.id }">
				<table class="table">
					<thead>

						<tr>
							<th>操作人名称:</th>
							<th>项目名称:
							<th>操 作时间:</th>
							<th>操作类型:</th>
							<th>审核备注:</th>

						</tr>
						<tr>
							<c:forEach items="${inv}" var="operRecord">
								<td>${operRecord.operatorName }</td>
								<td>${operRecord.projectName }</td>
								<td><fmt:formatDate value="${operRecord.operatorDate }"
										pattern="yyyy-MM-dd" /></td>
								<td><c:if test="${operRecord.operType==1 }">
										提交
									</c:if> <c:if test="${operRecord.operType==2 }">
										通过
									</c:if> <c:if test="${operRecord.operType==3 }">
										撤回
									</c:if> <c:if test="${operRecord.operType==4 }">
										不同意
									</c:if> <c:if test="${operRecord.operType==5 }">
										发布
									</c:if></td>
								<td>${operRecord.remark }</td>
							</c:forEach>
						</tr>
					</thead>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm"
					data-dismiss="modal">确定</button>
			</div>
		</div>
	</div>
</form>
