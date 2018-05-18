<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<form action="${ctx }/investManage/listServiceProject" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="submit" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>项目投资记录</strong>
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${invRecord.id }">
				<table class="table">
					<thead>

						<tr>
							<th>项目编号:</th>
							<th>投资金额:</th>
							<th>投资人姓名:</th>
							<th>投资时间:</th>
							<th>投资方式:</th>
						</tr>
						<c:forEach items="${invRec}" var="invRecord">
							<tr>
								<td>${invRecord.invrecNo }</td>
								<td>${invRecord.invrecMoney }"</td>
								<td>${invRecord.invUserName }</td>
								<td><fmt:formatDate value="${invRecord.invDate }"
										pattern="yyyy-MM-dd" /></td>

								<td><c:if test="${invRecord.invWay==1 }">
										手动
									</c:if> <c:if test="${invRecord.invWay==0 }">
										自动
									</c:if>
								</td>
								
							</tr>
						</c:forEach>
					</thead>
				</table>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary btn-sm">离开</button>
			</div>
		</div>
	</div>
</form>
