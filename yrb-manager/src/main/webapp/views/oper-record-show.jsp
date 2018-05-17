<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/investManage/listOperProject" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>项目操作记录详情</strong>
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${operRecord.id }">
				<table class="table">
					<thead>

						<tr>
							<th>操作人名称:</th>
							<th>项目名称:</th>
							<th>操作时间:</th>
							<th>操作类型:</th>
							<th>审核备注:</th>
						</tr>
						<c:forEach items="${showList}" var="operRecord">
							<tr>
								<td><input type="text" name="operatorName"
									class="form-control" value="${operRecord.operatorName }"
									maxlength="40" disabled="disabled"></td>
								<td><input type="text" name="projectName"
									class="form-control" value="${operRecord.projectName }"
									maxlength="40" disabled="disabled"></td>
								<td><input type="text" name="operatorDate"
									class="form-control" value="${operRecord.operatorDate }"
									maxlength="40" disabled="disabled"></td>

								<td><c:if test="${operRecord.operType==1 }">
										<input type="text" name="operType" class="form-control"
											value="提交" disabled="disabled" maxlength="12">
									</c:if> <c:if test="${operRecord.operType==2 }">
										<input type="text" name="operType" class="form-control"
											value="通过" disabled="disabled" maxlength="12">
									</c:if> <c:if test="${operRecord.operType==3 }">
										<input type="text" name="operType" class="form-control"
											value="撤回" disabled="disabled" maxlength="12">
									</c:if> <c:if test="${operRecord.operType==4 }">
										<input type="text" name="operType" class="form-control"
											value="不同意" disabled="disabled" maxlength="12">
									</c:if> <c:if test="${operRecord.operType==5 }">
										<input type="text" name="operType" class="form-control"
											value="发布" disabled="disabled" maxlength="12">
									</c:if></td>
								<td><textarea name="remark" class="form-control"
										disabled="disabled" maxlength="400">${operRecord.remark }</textarea></td>
							</tr>
						</c:forEach>
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
