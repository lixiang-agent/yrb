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
		<jsp:include page="/menu.jsp" >
			<jsp:param value="auth-ugroup" name="menu"/>
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
					<li class="active">用户組管理</li>
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
						<div class="table-header">用户組列表</div>
						<div class="breadcrumbs" id="breadcrumbs"
							style="margin-top: 5px; padding-bottom: 50px">
							<div class="nav-search" id="nav-search">
								<div class="col-lg-6">
									<form class="form-search" action="${ctx }/ugroup/list"
										method="post">
										<div class="input-group">
											<input type="text" name="groupName" class="form-control"
												placeholder="请输入您的用户組名" value="${ugroup.groupName }"
												aria-describedby="basic-addon2"> <span
												class="input-group-btn">
												<button class="btn btn-primary btn-sm" type="submit">查询</button>
												<input class="btn btn-primary btn-sm" type="button" value="新增" onclick="location.href='${ctx}/ugroup/ugroupToAdd'">
											</span>
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
										<th>用户組名</th>
										<th>用戶組描述</th>
										<th>用户组人数</th>
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${page.list }" var="ugroup">
										<tr>
											<td class="center"><label> <input
													type="checkbox" class="ace" value="${ugroup.id }" /> <span
													class="lbl"></span>
											</label></td>
											<td>${ugroup.groupName }</td>
											<td>${ugroup.groupDesc }</td>
											<td><a href="shou_user">${ugroup.num }</a></td>
											<td>
												<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
													<a class="blue" href="${ctx }/ugroup/ugroupRoles?id=${ugroup.id}"> <i
														class="icon-zoom-in bigger-130"></i>
													</a> <a class="green"
														href="javascript:void(0)"
														data-toggle="modal" data-target="#${ugroup.id }" title="修改用户组信息">
														<i class="icon-pencil bigger-130"></i>
													</a>
													
													
													<a class="green" href="${ctx }/ugroup/ugroupUsers?id=${ugroup.id}"  title="分配用户"> <i
														class="icon-group bigger-130"></i>
													</a>
													
													<div class="modal fade" id="${ugroup.id }" tabindex="-1"
														role="dialog" aria-labelledby="myModalLabel">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																	<h4 class="modal-title" id="myModalLabel">修改用户组信息</h4>
																</div>
																<form action="ugroupModify">
																	<div class="modal-body">
																		<input name="groupName" value="${ugroup.groupName }">
																		<input name="groupDesc" value="${ugroup.groupDesc }">
																		<input name="id" type="hidden" value="${ugroup.id }">
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">关闭</button>
																		<button type="submit" class="btn btn-primary">保存</button>
																	</div>
																</form>
															</div>
														</div>
													</div>

													<a class="tooltip-error" title="删除" data-toggle="modal"
														data-target="#deleteModal" data-rel="tooltip"
														id="${ugroup.id }"> <span class="red"> <i
															class="icon-trash bigger-120"></i>
													</span>
													</a>
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

															<li><a href="javascript:void();" data-toggle="modal"
																data-target="#myModal" class="tooltip-success"
																data-rel="tooltip" title="Edit"> <span class="green">
																		<i class="icon-edit bigger-120"></i>
																</span>

															</a></li>
															<li><a class="tooltip-error" title="删除"
																data-toggle="modal" data-target="#deleteModal"
																data-rel="tooltip" id="${ugroup.id }"> <span
																	class="red"> <i class="icon-trash bigger-120"></i>
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
							<w:pager pageSize="${page.pageSize }" url="${ctx }/ugroup/list"
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

</body>
<script type="text/javascript">
	$()
			.ready(
					function() {
						$(".tooltip-error")
								.click(
										function() {
											if (confirm("确定删除?")) {
												location.href = "${ctx}/ugroup/deleteUgroup?id="
														+ $(this).attr("id");
												return true;
											} else {
												return false;
											}

										})

					})
</script>
</html>
