<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<form action="${ctx }/loan/updateloan" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title"><strong>查看项目详情</strong></h4>
			</div>
			<div class="modal-body">

				<table class="table">
					<thead>
					<tr>
						<td><input type="hidden" name="id" value="${loaninfo.id }"></td>
						</tr>
						<tr>
							<td>项目编号</td>
							<td><input type="text" name="projectNo" class="form-control" value="${loaninfo.projectNo }" ></td>
						</tr>
						<tr>
							<td>项目名称</td>
							<td><input type="text" name="projectName" class="form-control" value="${loaninfo.projectName }"></td>
						</tr>
						<tr>
							<td>借款人id</td> 
							<td><input type="text" name="loanUserId" class="form-control" value="${loaninfo.loanUserId }" ></td>
						</tr>
						<tr>
							<td>借款人姓名</td>
							<td><input type="text" name="loanUserName" class="form-control" value="${loaninfo.loanUserName }" ></td>
						</tr>
						<tr>
							<td>借款金额</td>
							<td><input type="text" name="loanBalance" class="form-control" value="${loaninfo.loanBalance }" ></td>
						</tr>
						<tr>
							<td>年利率(%)</td>
							<td><input type="text" name="annualRate" class="form-control" value="${loaninfo.annualRate }" ></td>
						</tr>
						<tr>
							<td>借款期限</td>
							<td><input type="text" name="loanTerm" class="form-control" value="${loaninfo.loanTerm }" ></td>
						</tr>
					
						
						
						<tr>
							<td>还款方式</td>
							<td><select name="repaymentMethod">
											
											<option value="1" ${loaninfo.repaymentMethod==1 ?"selected='true'":"" }>到期还本付息</option>
											<option value="2" ${loaninfo.repaymentMethod==2 ?"selected='true'":"" }>按月付息,到期还本</option>
											<option value="3" ${loaninfo.repaymentMethod==3 ?"selected='true'":"" }>等额本息</option>
											
										</select>
										</td> 
									
						</tr>
						
						
						
						
						
						
						
						<tr>
							<td>借款原因</td>
							<td><input type="text" name="loanReason" class="form-control" value="${loaninfo.loanReason }" ></td>
						</tr>
						<tr>
							<td>借款人信息</td>
							<td><input type="text" name="borrowerInfo" class="form-control" value="${loaninfo.borrowerInfo }" ></td>
						</tr>
						<tr>
							<td>风险控制</td>
							<td><input type="text" name="riskControl" class="form-control" value="${loaninfo.riskControl }" ></td>
						</tr>
						
						<tr>
							<td>项目状态</td>
							<%-- <td><select name="projectStatus">
											
											<option value="10" ${loaninfo.projectStatus==10 ?"selected='true'":"" }>待提交</option>
											<option value="11" ${loaninfo.projectStatus==11 ?"selected='true'":"" }>退回</option>
											<option value="20" ${loaninfo.projectStatus==20 ?"selected='true'":"" }>待审批</option>
											<option value="30" ${loaninfo.projectStatus==30?"selected='true'":"" }>待放款</option>
											<option value="40" ${loaninfo.projectStatus==40?"selected='true'":"" }>已放款</option>
											<option value="50" ${loaninfo.projectStatus==50?"selected='true'":"" }>待还款</option>
											<option value="60" ${loaninfo.projectStatus==60?"selected='true'":"" }>项目结束</option>
											
										</select>
										</td> --%>
										<td><input type="text" name="loanTerm" class="form-control" value="${loaninfo.projectStatus}" readonly="true"></td>	
						</tr>
						
						
						
						<tr>
							<td>创建人id</td>
							<td><input type="text" name="creatorId" class="form-control" value="${loaninfo.projectNo }" ></td>
						</tr>
						<tr>
							<td>创建人名字</td>
							<td><input type="text" name="creatorName" class="form-control" value="${loaninfo.creatorName }" ></td>
						</tr>
						<tr>
							<td>创建时间</td>
							<td><input type="text" name="creatorDate" class="form-control"
							 value='<fmt:formatDate value="${loaninfo.creatorDate}" pattern="yyyy:MM:dd HH:mm:ss"/> ' ></td>
							
						</tr>
						
						
						<tr>
							<td>修改人id</td>
							<td><input type="text" name="modifiorId" class="form-control" value="${loaninfo.modifiorId }" ></td>
						</tr>
						<tr>
							<td>修改人名字</td>
							<td><input type="text" name="modifiorName" class="form-control" value="${loaninfo.modifiorName }" ></td>
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
