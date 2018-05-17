<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/investManage/update" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>修改项目</strong>
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${invProject.id }">
				<table class="table">
					<thead>
						<tr>
							<td>项目名称:</td>
							<td><input type="text" name="projectName"
								class="form-control" value="${invProject.projectName }"
								maxlength="40"></td>
						</tr>
						<tr>
							<td>项目类型:</td>
							<td><label class="radio-inline"><input type="radio"
									name="projectType" value="1"
									${invProject.projectType==1?"checked='checked'":"" }>车易贷</label>
								<label class="radio-inline"><input type="radio"
									name="projectType" value="2"
									${invProject.projectType==2?"checked='checked'":"" }>房易贷</label>
								<label class="radio-inline"><input type="radio"
									name="projectType" value="3"
									${invProject.projectType==2?"checked='checked'":"" }>售楼贷</label>
								<label class="radio-inline"><input type="radio"
									name="projectType" value="4"
									${invProject.projectType==2?"checked='checked'":"" }>债券贷</label>
							</td>
						</tr>
						<tr>
							<td>需投资总金额:</td>
							<td><input type="text" name="invTotbalance"
								class="form-control" value="${invProject.invTotbalance }"
								maxlength="10"></td>
						</tr>
						<tr>
							<td>年利率:</td>
							<td><input type="text" name="rate" class="form-control"
								value="${invProject.rate }" maxlength="12"></td>
						</tr>
						<tr>
							<td>回款期限:</td>
							<td><input type="text" name="paybackTime"
								class="form-control" value="${invProject.paybackTime }"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>保障方式:</td>
							<td><input type="text" name="safeWay" class="form-control"
								value="${invProject.safeWay }" maxlength="12"></td>
						</tr>
						<tr>
							<td>回款方式:</td>
							<td><input type="text" name="paybackWay"
								class="form-control" value="${invProject.paybackWay }"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>已投资金额:</td>
							<td><input type="text" name="invBalance"
								class="form-control" value="${invProject.invBalance }"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>最小投资金额:</td>
							<td><input type="text" name="minInvBalance"
								class="form-control" value="${invProject.minInvBalance }"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>最大投资金额:</td>
							<td><input type="text" name="maxInvBalance"
								class="form-control" value="${invProject.maxInvBalance }"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>借款原因:</td>
							<td><input type="text" name="loanReason"
								class="form-control" value="${invProject.loanReason }"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>借款人信息:</td>
							<td><input type="text" name="borrowerInfo"
								class="form-control" value="${invProject.borrowerInfo }"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>风险控制:</td>
							<td><input type="text" name="riskControl"
								class="form-control" value="${invProject.riskControl }"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>是否延期:</td>
							<td><label class="radio-inline"><input type="radio"
									name="delayFlag" value="0" ${invProject.delayFlag==1?"checked='checked'":"" }>未延期</label> 
								<label class="radio-inline"><input type="radio"
									name="delayFlag" value="1" ${invProject.delayFlag==1?"checked='checked'":"" }>延期</label>
						</tr>
						<tr>
							<td>是否推荐项目:</td>
							<td><label class="radio-inline"><input type="radio"
									name="commendFlag" value="0" ${invProject.commendFlag==0?"checked='checked'":"" }>不是</label> <label
								class="radio-inline"><input type="radio"
									name="commendFlag" value="1" ${invProject.commendFlag==1?"checked='checked'":"" }>是</label>
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
