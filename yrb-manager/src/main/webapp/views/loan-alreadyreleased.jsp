<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
</head>
<body>
	<%@ include file="/top.jsp"%>
	<div class="main-container" id="main-container">
		<jsp:include page="/menu.jsp">
			<jsp:param value="loan-alreadyreleased" name="menu" />
		</jsp:include>


		<div class="main-content">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
					<li class="active">已放款项目</li>
				</ul>
				<!-- .breadcrumb -->

				<div class="nav-search" id="nav-search">
					<form class="form-search">
						<span class="input-icon"> <input type="text"
							placeholder="Search ..." class="nav-search-input"
							id="nav-search-input" autocomplete="off"> <i
							class="icon-search nav-search-icon"></i>
						</span>
					</form>
				</div>
				<!-- #nav-search -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<div class="table-header">已放款项目</div>
						<div class="breadcrumbs" id="breadcrumbs"
							style="margin-top: 5px; padding-bottom: 50px">
							<div class="nav-search" id="nav-search">
								<div class="col-lg-6">
									<form class="form-search" action="${ctx }/loan/listLoanProject"
										method="post">
										<div class="input-group">
											<input type="text" name="projectNo" class="form-control"
												placeholder="请输入项目编号" value="${loan.projectNo }"
												aria-describedby="basic-addon2"> <span
												class="input-group-btn">
												<button class="btn btn-primary btn-sm" type="submit">
													查询</button>

											</span> <a href="${ctx }/loan/toaddloan" data-toggle="modal"
												data-target="#addloan" role="button" title="新增项目"><button
													class="btn btn-primary btn-sm" type="button">新增</button> </a> </span>
										</div>
									</form>
								</div>
							</div>
							<!-- #nav-search -->

						</div>
						<div class="table-responsive">
							<table id="sample-table-2"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center"><label> <input type="checkbox"
												class="ace" /> <span class="lbl"></span>
										</label></th>
										<th>项目名称</th>
										<th>项目编号</th>
										<th>借款人姓名</th>
										<th>借款金额</th>
										<th>年利率(%)</th>
										<th>借款期限</th>
										<th>还款方式</th>
										<th>风险控制</th>
										<th>项目状态</th>

										<th>操作</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${page.list  }" var="loan">
										<tr>
											<td class="center"><label> <input
													type="checkbox" class="ace" value="${loan.id }" /> <span
													class="lbl"></span>
											</label></td>
											<td>${loan.projectName}</td>
											<td>${loan.projectNo}</td>
											<%-- <td>${loan.loanUserId}</td> --%>
											<td>${loan.loanUserName}</td>
											<td>${loan.loanBalance}</td>
											<td>${loan.annualRate}</td>
											<td>${loan.loanTerm}</td>
											<td>${loan.repaymentMethod==1?'到期还本付息':(loan.repaymentMethod==2?'按月付息,到期还本':'等额本息')}</td>

											<td>${loan.riskControl}</td>

											<td>${loan.projectStatus}</td>

											<td>
												<div
													class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
													
														
														
														
														 <a class="pink" href="${ctx }/check/repaymentlist?id=${loan.id}"
														data-toggle="modal" data-target="#repaymentlist" title="还款列表">
														<i class="icon-search bigger-130"></i></a>
														
														
														
														
														
														
														
														
														
														
														
														
														
														

												
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

															
															
														</ul>
													</div>
												</div>
											</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
						<div class="modal-footer no-margin-top">
							<w:pager pageSize="${page.pageSize }" url="${ctx }/user/list"
								recordCount="${page.total }" pageNum="${page.pageNum }" />
						</div>

					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div>
		<!-- /.col -->
	</div>



<!-- 查看还款计划的模态框 -->
	<div class="modal fade" id="repaymentlist" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

	<div class="ace-settings-container" id="ace-settings-container">
		<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
			id="ace-settings-btn">
			<i class="icon-cog bigger-150"></i>
		</div>

		<div class="ace-settings-box" id="ace-settings-box">
			<div>
				<div class="pull-left">
					<select id="skin-colorpicker" class="hide">
						<option data-skin="default" value="#438EB9">#438EB9</option>
						<option data-skin="skin-1" value="#222A2D">#222A2D</option>
						<option data-skin="skin-2" value="#C6487E">#C6487E</option>
						<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
					</select>
				</div>
				<span>&nbsp; Choose Skin</span>
			</div>

			<div>
				<input type="checkbox" class="ace ace-checkbox-2"
					id="ace-settings-navbar" /> <label class="lbl"
					for="ace-settings-navbar"> Fixed Navbar</label>
			</div>

			<div>
				<input type="checkbox" class="ace ace-checkbox-2"
					id="ace-settings-sidebar" /> <label class="lbl"
					for="ace-settings-sidebar"> Fixed Sidebar</label>
			</div>

			<div>
				<input type="checkbox" class="ace ace-checkbox-2"
					id="ace-settings-breadcrumbs" /> <label class="lbl"
					for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
			</div>

			<div>
				<input type="checkbox" class="ace ace-checkbox-2"
					id="ace-settings-rtl" /> <label class="lbl" for="ace-settings-rtl">
					Right To Left (rtl)</label>
			</div>

			<div>
				<input type="checkbox" class="ace ace-checkbox-2"
					id="ace-settings-add-container" /> <label class="lbl"
					for="ace-settings-add-container"> Inside <b>.container</b>
				</label>
			</div>
		</div>
	</div>

	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="icon-double-angle-up icon-only bigger-110"></i>
	</a>

	<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
	<script src="${ctx}/assets/js/jquery.mobile.custom.min.js"></script>


	<script src="${ctx}/assets/js/bootstrap.min.js"></script>
	<script src="${ctx}/assets/js/typeahead-bs2.min.js"></script>

	<!-- page specific plugin scripts -->

	<script src="${ctx}/assets/js/jquery.dataTables.min.js"></script>
	<script src="${ctx}/assets/js/jquery.dataTables.bootstrap.js"></script>

	<!-- ace scripts -->

	<script src="${ctx}/assets/js/ace-elements.min.js"></script>
	<script src="${ctx}/assets/js/ace.min.js"></script>

	<script type="text/javascript">
		//模态框隐藏的时候把原来模态框里面的内容去掉
		$("#resModal").on("hidden.bs.modal", function() {
			$(this).removeData("bs.modal");
		});
		$("#modModal").on("hidden.bs.modal", function() {
			$(this).removeData("bs.modal");
		});
		$("#delModal").on("hidden.bs.modal", function() {
			$(this).removeData("bs.modal");
		});
	</script>
</body>
<%@ include file="/tip.jsp"%>
</html>
