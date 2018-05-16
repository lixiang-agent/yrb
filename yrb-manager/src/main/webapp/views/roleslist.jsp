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
			<jsp:param value="auth-role" name="menu"/>
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
					<li class="active">角色管理</li>
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
						<div class="table-header">角色管理</div>
						<div class="breadcrumbs" id="breadcrumbs"
							style="margin-top: 5px; padding-bottom: 50px">
							<div class="nav-search" id="nav-search">
								<div class="col-lg-6">
									<form class="form-search" action="${ctx }/getRolesList"
										method="post">
										<div class="input-group">
											<input type="text" name="roleName" class="form-control"
												placeholder="请输入权限名" value="${role.roleName }"
												aria-describedby="basic-addon2"> <span
												class="input-group-btn">
												<button class="btn btn-primary btn-sm" type="submit">
													查询</button>
											</span> <a href="${ctx }/toaddRole" data-toggle="modal" 
													data-target="#addModal" role="button" title="新增资源"><button
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
										<th>角色名称</th>
										<th>角色描述</th>
										<th>创建时间</th>
										<th>修改时间</th>
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${roles.list }" var="role">
										<tr>
											<td class="center"><label> <input
													type="checkbox" class="ace" value="${role.id }" /> <span
													class="lbl"></span>
											</label></td>
											<td>${role.roleName }</td>
											<td>${role.roleDesc }</td>
											<td><fmt:formatDate value="${role.creatorDate }"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${role.modifyDate }"
													pattern="yyyy-MM-dd" /></td>
											<td>
												<div
													class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
													<a class="blue"
														href="${ctx }/toUpdateRoleInfo?id=${role.id}"
														data-toggle="modal" data-target="#modModal" title="修改角色">
														<i class="icon-wrench bigger-130"></i>
													</a> <a class="green" href="${ctx }/editRoleRes?id=${role.id}"
														data-toggle="modal" data-target="#resModal" title="分配资源">
														<i class="icon-pencil bigger-130"></i>
													</a> <a class="red" data-toggle="modal" href="#"
														data-target="#delModal${role.id}" title="删除角色"> <i
														class="icon-trash bigger-130"></i>
													</a>

													<div class="modal fade" tabindex="-1" role="dialog"
														id="delModal${role.id}">
														<div class="modal-dialog" role="document">
															<form action="${ctx}/deleteRole" method="post">
																<input type="hidden" name="id" value="${role.id }">
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal" aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																		<h4 class="modal-title">删除角色</h4>
																	</div>
																	<div class="modal-body">
																		<p>确定要删除吗?删除后不能恢复..</p>
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

															<li><a href="javascript:void();" data-toggle="modal"
																data-target="#resModal" class="tooltip-success"
																data-rel="tooltip" title="Edit"> <span class="green">
																		<i class="icon-edit bigger-120"></i>
																</span>
															</a> <a href="javascript:void();" data-toggle="modal"
																data-target="#delModal" class="tooltip-success"
																data-rel="tooltip" title="Edit"> <span class="green">
																		<i class="icon-edit bigger-120"></i>
																</span>
															</a></li>

															<li><a class="red" data-toggle="modal" href="#"
																data-target="#delModal${role.id}" title="删除角色"> <i
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
						<div class="modal-footer no-margin-top">
							<w:pager pageSize="${roles.pageSize }" url="${ctx }/getRolesList"
								recordCount="${roles.total }" pageNum="${roles.pageNum }" />
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

	<!-- 增加角色的模态框 -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	
	<!-- 修改角色信息的模态框 -->
	<div class="modal fade" id="modModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	<!-- 修改资源的模态框 -->
	<div class="modal fade" id="resModal" tabindex="-1" role="dialog"
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
