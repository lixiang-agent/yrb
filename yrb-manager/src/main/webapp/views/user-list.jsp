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
			<jsp:param value="user-list" name="menu"/>
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
					<li class="active">用户管理</li>
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
						<div class="table-header">用户列表</div>
						<div class="breadcrumbs" id="breadcrumbs"
							style="margin-top: 5px; padding-bottom: 50px">
							<div class="nav-search" id="nav-search">
								<div class="col-lg-6"  style="width:100%;">
									<form class="form-search" action="${ctx}/user/list"
										method="get">
										<div class="input-group">
											<input type="text" name="username" class="input-group-input"
												placeholder="请输入您要查找的账号" value="${user.username }"
												aria-describedby="basic-addon2" style="magin-right:12px;">
											<input type="text" name="realName" class="input-group-input"
												placeholder="请输入您要查找的用户名" value="${user.realName }"
												aria-describedby="basic-addon2" style="magin-right:12px;">
									<label class="input-group-radio" style="width:45px;"><input name="sex" type="radio" value="2" 
												${ user.sex==2||user.sex==null ?"checked='checked'":"" }>全部</label> 
									<label class="input-group-radio"><input name="sex" type="radio" value="1" 
												${ user.sex==1 ?"checked='checked'":"" }>男</label> 
									<label class="input-group-radio"><input name="sex" type="radio" value="0"
												${ user.sex==0 ?"checked='checked'":""}>女</label> 
									<select name="user_role_id">
										<option value="-1">全部角色类型</option>
										<c:forEach var="role" items="${roles}">
											<option value="${role.id}" ${role.id==user.user_role_id ?"selected='true'":"" }>${role.roleDesc}</option>
										</c:forEach>
									</select>
												 <span class="input-group-btn3">
												<button class="btn btn-primary btn-sm" type="submit">查询</button>
												<button class="btn btn-primary btn-sm" type="submit">新增</button>
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
										<th>账号</th>
										<th>用户名</th>
										<th>性别</th>
										<th>角色</th>
										<th class="hidden-480">出生年月</th>
										<th>错误次数</th>
										<th>最后登陆时间</th>
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${page.list }" var="user">
										<tr>
											<td class="center"><label> <input id="pitchOn"
													type="checkbox" class="ace" value="${user.id }" /> <span
													class="lbl"></span>
											</label></td>
											<td>${user.username }</td>
											<td>${user.realName }</td>
											<td>${user.sex==1?'男':(user.sex==0?'女':'保密')}</td>
											<td>${user.userRoles }</td>
											<td class="hidden-480"><fmt:formatDate
													value="${user.birthday }" pattern="yyyy-MM-dd"></fmt:formatDate>
											</td>
											<td>${user.errorCount}</td>
											<td><fmt:formatDate value="${user.loginDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
											<td>
												<div
													class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
													<a class="blue" href="#"> <i
														class="icon-zoom-in bigger-130"></i>
													</a> <a class="green" href="${ctx }/editUserRole?id=${user.id}"
														data-toggle="modal" data-target="#roleModal" title="分配权限">
														<i class="icon-wrench bigger-130"></i>

													</a>


													<!-- 发送请求(删除) -->
													<a class="red" href="${ctx }/operateUser?id=${user.id}"
														data-toggle="modal" data-target="#userModal" title="删除用户">>

														<i class="icon-trash bigger-130"></i>

													</a> 
													<a class="orange"
														href="${ctx}/user/toUpdateUser?id=${user.id}"
														data-toggle="modal" data-target="#userModal" title="修改用户">
														<i class="icon-pencil bigger-130"></i>
													</a> 
													<a class="purple" href="${ctx}/user/unlockUser?id=${user.id}"> <i
														class="icon-unlock bigger-130"></i>
													</a>
													<a class="red" href="#"> <i
														class="icon-trash bigger-130"></i>

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
																data-target="#roleModal" class="tooltip-success"
																data-rel="tooltip" title="Edit"> <span class="green">
																		<i class="icon-wrench bigger-120"></i>
																</span>

															</a></li>
															<li><a href="javascript:void();" data-toggle="modal"
																data-target="#userModal" class="tooltip-success"
																data-rel="tooltip" title="Edit"> <span class="orange">
																		<i class="icon-edit  bigger-120"></i>
																</span>

															</a></li>
																<li><a href="#" class="tooltip-success"
																data-rel="tooltip" title="Unlock"> <span class="purple">
																		<i class="icon-unlock bigger-120"></i>
																</span>
															</a></li>
									

															<li><a href="#" class="tooltip-error"
																data-rel="tooltip" title="Delete"> <span class="red">
																		<i class="icon-trash bigger-120"></i>
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
							<div class="modal-footer no-margin-top">
								<w:pager pageSize="${page.pageSize }" url="${ctx }/user/list"
									recordCount="${page.total }" pageNum="${page.pageNum }" />
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 修改角色的模态框 -->
	<div class="modal fade" id="roleModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
 	<!-- 修改用户的模态框 -->
	<div class="modal fade" id="userModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div> 

	<!-- 修改角色的模态框 -->
	<div class="modal fade" id="userModal" tabindex="-1" role="dialog"
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
		 $("#roleModal").on("hidden.bs.modal", function() {
			 $(this).removeData("bs.modal");
			}); 
		 
		$("#userModal").on("hidden.bs.modal", function() {
			$(this).removeData("bs.modal");
		});
	</script>

</body>
</html>
