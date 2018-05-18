<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<form action="${ctx }/investManage/pageList" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>项目详情</strong>
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${invProject.id }">
				<table class="table">
					<thead>
						<tr>
							<td>项目名称:</td>
							<td>${invProject.projectName }
								</td>
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
							<td>${invProject.invNo}</td>
						</tr>
						<tr>
							<td>需投资总金额:</td>
							<td>${invProject.invTotbalance}</td>
						</tr>
						<tr>
							<td>年利率:</td>
							<td>${invProject.rate}</td>
						</tr>
						<tr>
							<td>回款期限:</td>
							<td>${invProject.paybackTime}</td>
						</tr>
						<tr>
							<td>保障方式:</td>
							<td>${invProject.safeWay}</td>
						</tr>
						<tr>
							<td>回款方式:</td>
							<td>
							<c:if test="${invProject.paybackWay==0 }">
							到期还本
							</c:if>
							<c:if test="${invProject.paybackWay==1 }">
							按月付息
							</c:if>
							<c:if test="${invProject.paybackWay==2 }">
							等额本息
							</c:if>
							</td>
						</tr>
						<tr>
							<td>已投资金额:</td>
							<td>${invProject.invBalance }</td>
						</tr>
						<tr>
							<td>最小投资金额:</td>
							<td>${invProject.minInvBalance }</td>
						</tr>
						<tr>
							<td>最大投资金额:</td>
							<td>${invProject.maxInvBalance }</td>
						</tr>
						<tr>
							<td>借款原因:</td>
							<td>${invProject.loanReason }</td>
						</tr>
						<tr>
							<td>发标时间:</td>
							<td><fmt:formatDate value="${invProject.biddingDate }" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td>借款人信息:</td>
							<td>${invProject.borrowerInfo }</td>
						</tr>
						<tr>
							<td>风险控制:</td>
							<td><textarea name="riskControl" class="form-control"
									disabled="disabled">${invProject.riskControl }</textarea></td>
						</tr>
						<tr>
							<td>项目状态:</td>
							<td><c:if test="${invProject.projectStatus==10}">
								待提交
							</c:if> <c:if test="${invProject.projectStatus==11}">
								退回
							</c:if> <c:if test="${invProject.projectStatus==20}">
								待审批		
							</c:if> <c:if test="${invProject.projectStatus==30}">
								待发布					
							</c:if> <c:if test="${invProject.projectStatus==40}">
								筹款中					
							</c:if> <c:if test="${invProject.projectStatus==50}">
								筹资成功						
							</c:if> <c:if test="${invProject.projectStatus==60}">
								还款中						
							</c:if> <c:if test="${invProject.projectStatus==70}">
								结束					
							</c:if> <c:if test="${invProject.projectStatus==100}">
								流标				
							</c:if></td>
						</tr>
						<tr>
							<td>筹资预期结束时间:</td>
							<td>${invProject.financingEndTime}</td>
						</tr>
						<c:if test="${invProject.projectStatus==40}">
							<tr>
								<td>筹资实际结束时间:</td>
								<td>${invProject.endTime }</td>
							</tr>
						</c:if>
						<tr>
							<td>创建人ID:</td>
							<td>${invProject.creatorId }</td>
						</tr>
						<tr>
							<td>创建人姓名:</td>
							<td>${invProject.creatorName }</td>
						</tr>
						<tr>
							<td>修改人ID:</td>
							<td>${invProject.modifiorId }</td>
						</tr>
						<tr>
							<td>修改人姓名:</td>
							<td>${invProject.modifiorName }</td>
						</tr>
						<tr>
							<td>修改时间:</td>
							<td>${invProject.modifyDate }</td>
						</tr>
						<tr>
							<td>项目来源:</td>
							<c:if test="${invProject.resource==1}">
								<td>借款项目</td>
							</c:if>
							<c:if test="${invProject.resource==2}">
								<td>新建项目</td>
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
