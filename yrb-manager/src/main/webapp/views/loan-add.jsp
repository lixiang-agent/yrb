<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/loan/addloan" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title"><strong>创建项目</strong></h4>
			</div>
			<div class="modal-body">
				
				<table class="table">
					<thead>
						<tr>
							<td>项目编号</td>
							<td><input type="text" name="projectNo" class="form-control" ></td>
						</tr>
						<tr>
							<td>项目名称</td>
							<td><input type="text" name="projectName" class="form-control" ></td>
						</tr>
						<tr>
							<td>借款人id</td>
							<td><input type="text" name="loanUserId" class="form-control" ></td>
						</tr>
						<tr>
							<td>借款人姓名</td>
							<td><input type="text" name="loanUserName" class="form-control" ></td>
						</tr>
						<tr>
							<td>借款金额</td>
							<td><input type="text" name="loanBalance" class="form-control" ></td>
						</tr>
						<tr>
							<td>年利率(%)</td>
							<td><input type="text" name="annualRate" class="form-control" ></td>
						</tr>
						<tr>
							<td>借款期限</td>
							<td><input type="text" name="loanTerm" class="form-control" ></td>
						</tr>
					
						
						<tr>
							<td>项目状态</td>
							<td><select name="repaymentMethod">
												<option value="1" >到期还本付息</option>
												<option value="2" >按月付息,到期还本</option>
												<option value="3" >等额本息</option>
											
							</select></td>
						</tr>
						
						
						
						<tr>
							<td>借款原因</td>
							<td><input type="text" name="loanReason" class="form-control" ></td>
						</tr>
						<tr>
							<td>借款人信息</td>
							<td><input type="text" name="borrowerInfo" class="form-control" ></td>
						</tr>
						<tr>
							<td>风险控制</td>
							<td><input type="text" name="riskControl" class="form-control" ></td>
						</tr>
						
						<tr>
							<td>项目状态</td>
							<td><select name="projectStatus">
												
												<option value="10" >未提交</option>
												<option value="11" >退回</option>
												<option value="20" >待审批</option>
												<option value="30" >待放款</option>
												<option value="40" >已放款</option>
												<option value="50" >待还款</option>
												<option value="60" >项目结束</option>
											
							</select></td>
						</tr>
						
						
						
						<tr>
							<td>创建人id</td>
							<td><input type="text" name="creatorId" class="form-control" ></td>
						</tr>
						<tr>
							<td>创建人名字</td>
							<td><input type="text" name="creatorName" class="form-control" ></td>
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
