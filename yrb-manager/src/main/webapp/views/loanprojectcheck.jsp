<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal-dialog" style="width: 1000px">
	<div class="modal-content" >
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
			<h4 class="modal-title">
				<strong>${loan.projectName}的项目审核记录</strong>
			</h4>
		</div>
		<div class="modal-body">

						<div class="table-responsive">
							<table id="sample-table-2"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center"><label> <input type="checkbox"
												class="ace" /> <span class="lbl"></span>
										</label></th>
										<!-- <th>项目名称</th> -->
										<!-- <th>项目编号</th>										
									
										<th>借款金额</th>
										<th>年利率(%)</th>
										<th>借款期限</th>
										<th>还款方式</th>									
										<th>风险控制</th> -->
										<th>项目状态</th>
										
										<th>项目类型</th>
										<th>操作人</th>									
										<th>操作时间</th>
										<th>备注</th>
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${operateRecord  }" var="operateRecord">
										<tr>
											<td class="center"><label> <input
													type="checkbox" class="ace" value="${loan.id }" /> <span
													class="lbl"></span>
											</label></td>
											<%-- <td>${loan.projectName}</td> --%>
											<%-- <td>${loan.projectNo}</td>
											
											
											<td>${loan.loanBalance}</td>
											<td>${loan.annualRate}</td>
											<td>${loan.loanTerm}</td>


											<td>${loan.repaymentMethod==1?'到期还本付息':(loan.repaymentMethod==2?'按月付息,到期还本':'等额本息')}</td>

										
											<td>${loan.riskControl}</td> --%>

											
											<%-- <td>${loan.projectStatus }</td> --%>
											<td><c:choose>
													<c:when test="${loan.projectStatus == 10}">
														待提交
													</c:when>
													<c:when test="${loan.projectStatus == 11}">
														退回
													</c:when>
													<c:when test="${loan.projectStatus ==20}">
														待审批
													</c:when>
													<c:when test="${loan.projectStatus ==30}">
														待放款
													</c:when>
													<c:when test="${loan.projectStatus ==40}">
														已放款
													</c:when>
													<c:when test="${loan.projectStatus ==50}">
														待还款
													</c:when>
													<c:otherwise>
														项目结束
													</c:otherwise>


												</c:choose></td>
											
											
											
											<td>${operateRecord.projectType==1?"借款项目":"投资项目"}</td>
											<td>${operateRecord.operatorName}</td>
											<td>${operateRecord.operatorDate}</td>
											<td>${operateRecord.remark}</td>
											
											

											<td>
												<div
													class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
													<a class="blue"
														href="${ctx }/loan/togetloaninfo?id=${loan.id}"
														data-toggle="modal" data-target="#loaninfo" title="查看项目详情">
														<i class="icon-wrench bigger-130"></i></a>
														
													 <a class="green" href="${ctx }/loan/editloan?id=${loan.id}"
														data-toggle="modal" data-target="#editloan" title="修改项目">
														<i class="icon-pencil bigger-130"></i>


													</a> <a class="red" data-toggle="modal" href="#"
														data-target="#delLoan${loan.id}" title="删除项目"> <i
														class="icon-trash bigger-130"></i>
													</a>
													
										
													
													
													
													 <a class="pink" href="${ctx }/check/loanprojectcheck?id=${loan.id}"
														data-toggle="modal" data-target="#loanprojectcheck" title="审核记录">
														<i class="icon-search bigger-130"></i></a>
													
													
													

													<div class="modal fade" tabindex="-1" role="dialog"
														id="delLoan${loan.id}">
														<div class="modal-dialog" role="document">
															<form action="${ctx}/loan/deleteLoan" method="post">
																<input type="hidden" name="id" value="${loan.id }">
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal" aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																		<h4 class="modal-title">删除角色</h4>
																	</div>
																	<div class="modal-body">
																		<p>确定要删除吗?删除后不能恢复..123</p>
																		
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">取消</button>
																		<button type="submit" class="btn btn-primary">
																			删除</button>
																	</div>
																</div>
															</form>
															<!-- /.modal-content -->
														</div>
														<!-- /.modal-dialog -->
													</div>
													<!-- /.modal -->


												</div>
												<div class="visible-xs visible-sm hidden-md hidden-lg">
													<div class="inline position-relative">
														<button class="btn btn-minier btn-yellow dropdown-toggle"
															data-toggle="dropdown">
															<i class="icon-caret-down icon-only bigger-120"></i>
														</button>

														<ul
															class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
															<li><a href="#" class="tooltip-info"
																data-rel="tooltip" title="View"> <span class="blue">
																		<i class="icon-zoom-in bigger-120"></i>
																</span>
															</a></li>

															<!-- <li><a href="javascript:void();" data-toggle="modal"
															data-target="#resModal" class="tooltip-success"
															data-rel="tooltip" title="Edit"> <span class="green">
																	<i class="icon-edit bigger-120"></i>
															</span>
														</a> <a href="javascript:void();" data-toggle="modal"
															data-target="#delModal" class="tooltip-success"
															data-rel="tooltip" title="Edit"> <span class="green">
																	<i class="icon-edit bigger-120"></i>
															</span>
														</a></li> -->

															<li><a class="red" data-toggle="modal" href="#"
																data-target="#delLoan${role.id}" title="删除角色"> <i
																	class="icon-trash bigger-130"></i>
															</a></li>
														</ul>
													</div>
												</div>
											</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn default btn-sm" data-dismiss="modal">取消</button>

		</div>
	</div>
</div>

