<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/investManage/insert" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>增加项目</strong>
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${invpro.id }">
				<table class="table">
					<thead>
						<tr>
							<td>项目名称:</td>
							<td><input type="text" name="projectName"
								class="form-control" maxlength="40"></td>
						</tr>
						<tr>
							<td>项目类型:</td>
							<td><label class="radio-inline"><input type="radio"
									name="projectType" value="1">车易贷</label> <label
								class="radio-inline"><input type="radio"
									name="projectType" value="2">房易贷</label> <label
								class="radio-inline"><input type="radio"
									name="projectType" value="3">售楼贷</label> <label
								class="radio-inline"><input type="radio"
									name="projectType" value="4">债券贷</label></td>
						</tr>
						<tr>
							<td>需投资总金额:</td>
							<td><input type="text" name="invTotbalance"
								class="form-control" maxlength="10"></td>
						</tr>
						<tr>
							<td>年利率:</td>
							<td><input type="text" name="rate" class="form-control"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>回款期限:</td>
							<td><input type="text" name="paybackTime"
								class="form-control" maxlength="8"></td>
						</tr>
						<tr>
							<td>保障方式:</td>
							<td><input type="text" name="safeWay" class="form-control"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>回款方式:</td>
							<td><label class="radio-inline"><input type="radio"
									name="paybackWay" value="0">到期还本</label> <label
								class="radio-inline"><input type="radio"
									name="paybackWay" value="1">按月付息</label> <label
								class="radio-inline"><input type="radio"
									name="paybackWay" value="2">等额本息</label></td>
						</tr>
						<tr>
							<td>已投资金额:</td>
							<td><input type="text" name="invBalance"
								class="form-control" maxlength="12"></td>
						</tr>
						<tr>
							<td>最小投资金额:</td>
							<td><input type="text" name="minInvBalance"
								class="form-control" maxlength="12"></td>
						</tr>
						<tr>
							<td>最大投资金额:</td>
							<td><input type="text" name="maxInvBalance"
								class="form-control" maxlength="12"></td>
						</tr>
						<tr>
							<td>借款原因:</td>
							<td><input type="text" name="loanReason"
								class="form-control" maxlength="12"></td>
						</tr>
						<tr>
							<td>借款人信息:</td>
							<td><input type="text" name="borrowerInfo"
								class="form-control" maxlength="12"></td>
						</tr>
						<tr>
							<td>风险控制:</td>
							<td><input type="text" name="riskControl"
								class="form-control" maxlength="12"></td>
						</tr>
						<tr>
							<td>是否延期:</td>
							<td><label class="radio-inline"><input type="radio"
									name="delayFlag" value="0">未延期</label> <label
								class="radio-inline"><input type="radio"
									name="delayFlag" value="1">延期</label>
						</tr>
						<tr>
							<td>是否推荐项目:</td>
							<td><label class="radio-inline"><input type="radio"
									name="commendFlag" value="0">不是</label> <label
								class="radio-inline"><input type="radio"
									name="commendFlag" value="1">是</label>
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
