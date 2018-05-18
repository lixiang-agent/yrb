<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
			<h4 class="modal-title">
				<strong>查看项目详情</strong>
			</h4>
		</div>
		<div class="modal-body">




			<table class="table">
				<thead>
					<tr>
						<td>项目编号</td>
						<td><input type="text" name="projectNo" class="form-control"
							value="${loaninfo.projectNo }" readonly="true "></td>
					</tr>
					<tr>
						<td>项目名称</td>
						<td><input type="text" name="projectName"
							class="form-control" value="${loaninfo.projectName }"
							readonly="true "></td>
					</tr>
					<tr>
						<td>借款人id</td>
						<td><input type="text" name="loanUserId" class="form-control"
							value="${loaninfo.loanUserId }" readonly="true "></td>
					</tr>
					<tr>
						<td>借款人姓名</td>
						<td><input type="text" name="loanUserName"
							class="form-control" value="${loaninfo.loanUserName }"
							readonly="true "></td>
					</tr>
					<tr>
						<td>借款金额</td>
						<td><input type="text" name="loanBalance"
							class="form-control" value="${loaninfo.loanBalance }"
							readonly="true "></td>
					</tr>
					<tr>
						<td>年利率(%)</td>
						<td><input type="text" name="annualRate" class="form-control"
							value="${loaninfo.annualRate }" readonly="true "></td>
					</tr>
					<tr>
						<td>借款期限</td>
						<td><input type="text" name="loanTerm" class="form-control"
							value="${loaninfo.loanTerm }" readonly="true "></td>
					</tr>


					<tr>
						<td>还款方式</td>
						<td><input type="text" name="repaymentMethod"
							class="form-control"
							value="${loan.repaymentMethod==1?'到期还本付息':(loan.repaymentMethod==2?'按月付息,到期还本':'等额本息')}"
							readonly="true "></td>
					</tr>



					<tr>
						<td>借款原因</td>
						<td><input type="text" name="loanReason" class="form-control"
							value="${loaninfo.loanReason }" readonly="true "></td>
					</tr>
					<tr>
						<td>借款人信息</td>
						<td><input type="text" name="borrowerInfo"
							class="form-control" value="${loaninfo.borrowerInfo }"
							readonly="true "></td>
					</tr>
					<tr>
						<td>风险控制</td>
						<td><input type="text" name="riskControl"
							class="form-control" value="${loaninfo.riskControl }"
							readonly="true "></td>
					</tr>

					<tr>
						<td>项目状态</td>
						<td><input type="text" name="projectStatus"
							class="form-control" value="${loaninfo.projectStatus }"
							readonly="true "></td>
					</tr>



					<tr>
						<td>创建人id</td>
						<td><input type="text" name="creatorId" class="form-control"
							value="${loaninfo.projectNo }" readonly="true "></td>
					</tr>
					<tr>
						<td>创建人名字</td>
						<td><input type="text" name="creatorName"
							class="form-control" value="${loaninfo.creatorName }"
							readonly="true "></td>
					</tr>
					<tr>
						<td>创建时间</td>
						<td><input type="text" name="creatorDate"
							class="form-control"
							value=' <fmt:formatDate value="${loaninfo.creatorDate}" pattern="yyyy:MM:dd HH:mm:ss"/> '
							readonly="true "></td>
					</tr>


					<tr>
						<td>修改人id</td>
						<td><input type="text" name="modifiorId" class="form-control"
							value="${loaninfo.modifiorId }" readonly="true "></td>
					</tr>
					<tr>
						<td>修改人名字</td>
						<td><input type="text" name="modifiorName"
							class="form-control" value="${loaninfo.modifiorName }"
							readonly="true "></td>
					</tr>
					
						<tr>
							<td>修改时间</td>
							<td><input type="text" name="creatorDate" class="form-control"
							 value='<fmt:formatDate value="${loaninfo.modifyDate}" pattern="yyyy:MM:dd HH:mm:ss"/> ' ></td>
							
						</tr>





				</thead>
			</table>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn default btn-sm" data-dismiss="modal">取消</button>

		</div>
	</div>
</div>

