<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/investManage/pageList" method="post">
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
								maxlength="40" disabled="disabled"></td>
						</tr>
						<tr>
							<td>项目类型:</td>
							<td><label class="radio-inline"><input type="radio"
									name="projectType" value="1"
									${invProject.projectType==1?"checked='checked'":"" }
									disabled="disabled">车易贷</label> <label class="radio-inline"><input
									type="radio" name="projectType" value="2"
									${invProject.projectType==2?"checked='checked'":"" }
									disabled="disabled">房易贷</label> <label class="radio-inline"><input
									type="radio" name="projectType" value="3"
									${invProject.projectType==3?"checked='checked'":"" }
									disabled="disabled">售楼贷</label> <label class="radio-inline"><input
									type="radio" name="projectType" value="4"
									${invProject.projectType==4?"checked='checked'":"" }
									disabled="disabled">债券贷</label></td>
						</tr>
						<tr>
							<td>项目编号:</td>
							<td><input type="text" name="invNo" class="form-control"
								value="${invProject.invNo }" maxlength="40" disabled="disabled"></td>
						</tr>
						<tr>
							<td>需投资总金额:</td>
							<td><input type="text" name="invTotbalance"
								class="form-control" value="${invProject.invTotbalance }"
								disabled="disabled" maxlength="10"></td>
						</tr>
						<tr>
							<td>年利率:</td>
							<td><input type="text" name="rate" class="form-control"
								value="${invProject.rate }" disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>回款期限:</td>
							<td><input type="text" name="paybackTime"
								class="form-control" value="${invProject.paybackTime }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>保障方式:</td>
							<td><input type="text" name="safeWay" class="form-control"
								value="${invProject.safeWay }" disabled="disabled"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>回款方式:</td>
							<td>
							<c:if test="${invProject.paybackWay==0 }">
							<input type="text" name="paybackWay"
								class="form-control" value="到期还本"
								disabled="disabled" maxlength="12">
							</c:if>
							<c:if test="${invProject.paybackWay==1 }">
							<input type="text" name="paybackWay"
								class="form-control" value="按月付息"
								disabled="disabled" maxlength="12">
							</c:if>
							<c:if test="${invProject.paybackWay==2 }">
							<input type="text" name="paybackWay"
								class="form-control" value="等额本息"
								disabled="disabled" maxlength="12">
							</c:if>
							</td>
						</tr>
						<tr>
							<td>已投资金额:</td>
							<td><input type="text" name="invBalance"
								class="form-control" value="${invProject.invBalance }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>最小投资金额:</td>
							<td><input type="text" name="minInvBalance"
								class="form-control" value="${invProject.minInvBalance }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>最大投资金额:</td>
							<td><input type="text" name="maxInvBalance"
								class="form-control" value="${invProject.maxInvBalance }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>借款原因:</td>
							<td><input type="text" name="loanReason"
								class="form-control" value="${invProject.loanReason }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>发标时间:</td>
							<td><input type="text" name="biddingDate"
								class="form-control" value="${invProject.biddingDate }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>借款人信息:</td>
							<td><textarea name="borrowerInfo" class="form-control"
									disabled="disabled">${invProject.borrowerInfo }</textarea></td>
						</tr>
						<tr>
							<td>风险控制:</td>
							<td><textarea name="riskControl" class="form-control"
									disabled="disabled">${invProject.riskControl }</textarea></td>
						</tr>
						<tr>
							<td>项目状态:</td>
							<td><c:if test="${invProject.projectStatus==10}">
								<input type="text" name="projectStatus"
								class="form-control" value="待提交"
								disabled="disabled" maxlength="12">
							</c:if> <c:if test="${invProject.projectStatus==11}">
								<input type="text" name="projectStatus"
								class="form-control" value="退回"
								disabled="disabled" maxlength="12">
							</c:if> <c:if test="${invProject.projectStatus==20}">
								<input type="text" name="projectStatus"
								class="form-control" value="待审批"
								disabled="disabled" maxlength="12">		
							</c:if> <c:if test="${invProject.projectStatus==30}">
								<input type="text" name="projectStatus"
								class="form-control" value="待发布"
								disabled="disabled" maxlength="12">						
							</c:if> <c:if test="${invProject.projectStatus==40}">
								<input type="text" name="projectStatus"
								class="form-control" value="筹款中"
								disabled="disabled" maxlength="12">					
							</c:if> <c:if test="${invProject.projectStatus==50}">
								<input type="text" name="projectStatus"
								class="form-control" value="筹资成功"
								disabled="disabled" maxlength="12">						
							</c:if> <c:if test="${invProject.projectStatus==60}">
								<input type="text" name="projectStatus"
								class="form-control" value="还款中"
								disabled="disabled" maxlength="12">						
							</c:if> <c:if test="${invProject.projectStatus==70}">
								<input type="text" name="projectStatus"
								class="form-control" value="结束"
								disabled="disabled" maxlength="12">						
							</c:if> <c:if test="${invProject.projectStatus==100}">
								<input type="text" name="projectStatus"
								class="form-control" value="流标"
								disabled="disabled" maxlength="12">						
							</c:if></td>
						</tr>
						<tr>
							<td>筹资预期结束时间:</td>
							<td><input type="text" name="financingEndTime"
								class="form-control" value="${invProject.financingEndTime }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<c:if test="${invProject.projectStatus==40}">
							<tr>
								<td>筹资实际结束时间:</td>
								<td><input type="text" name="endTime"
									class="form-control" value="${invProject.endTime }"
									disabled="disabled" maxlength="12"></td>
							</tr>
						</c:if>
						<tr>
							<td>创建人ID:</td>
							<td><input type="text" name="creatorId"
								class="form-control" value="${invProject.creatorId }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>创建人姓名:</td>
							<td><input type="text" name="creatorName"
								class="form-control" value="${invProject.creatorName }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>修改人ID:</td>
							<td><input type="text" name="modifiorId"
								class="form-control" value="${invProject.modifiorId }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>修改人姓名:</td>
							<td><input type="text" name="modifiorName"
								class="form-control" value="${invProject.modifiorName }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>修改时间:</td>
							<td><input type="text" name="modifyDate"
								class="form-control" value="${invProject.modifyDate }"
								disabled="disabled" maxlength="12"></td>
						</tr>
						<tr>
							<td>项目来源:</td>
							<c:if test="${invProject.resource==1}">
								<td><input type="text" name="resource"
									class="form-control" value="借款项目"
									disabled="disabled" maxlength="12"></td>
							</c:if>
							<c:if test="${invProject.resource==2}">
								<td><input type="text" name="resource"
									class="form-control" value="新建项目"
									disabled="disabled" maxlength="12"></td>
							</c:if>
						</tr>
						<tr>
							<td>是否延期:</td>
							<td><label class="radio-inline"><input type="radio"
									name="delayFlag" value="0"
									${invProject.delayFlag==0?"checked='checked'":"" }
									disabled="disabled">未延期</label> <label class="radio-inline"><input
									type="radio" name="delayFlag" value="1"
									${invProject.delayFlag==1?"checked='checked'":"" }
									disabled="disabled">延期</label>
						</tr>
						<tr>
							<td>是否推荐项目:</td>
							<td><label class="radio-inline"><input type="radio"
									name="commendFlag" value="0"
									${invProject.commendFlag==0?"checked='checked'":"" }
									disabled="disabled">不是</label> <label class="radio-inline"><input
									type="radio" name="commendFlag" value="1"
									${invProject.commendFlag==1?"checked='checked'":"" }
									disabled="disabled">是</label>
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
