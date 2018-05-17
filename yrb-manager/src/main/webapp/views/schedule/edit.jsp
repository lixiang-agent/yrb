<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/schedule/save" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title"><strong>${empty job.jobId?"新增":"修改" }</strong></h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="jobId" value="${job.jobId }">
				<input type="hidden" name="jobStatus" value="${job.jobStatus }">
				<table class="table">
					<thead>
						<tr>
							<td>任务名称:</td>
							<td><input type="text" name="jobName" class="form-control" value="${job.jobName }"></td>
						</tr>
						<tr>
							<td>任务组:</td>
							<td><input type="text" name="jobGroup" class="form-control" value="${job.jobGroup }"></td>
						</tr>
						<tr>
							<td>定时表达式:</td>
							<td><input type="text" name="cronExpression" class="form-control" value="${job.cronExpression }" ></td>
						</tr>
						<tr>
							<td>任务执行类:</td>
							<td><input type="text" name="jobClass" class="form-control" value="${job.jobClass }"></td>
						</tr>
						<tr>
							<td>任务描述:</td>
							<td><input type="text" name="jobDesc" class="form-control" value="${job.jobDesc }"></td>
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
