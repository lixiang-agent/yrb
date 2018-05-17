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
			<jsp:param value="auth-role" name="menu" />
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
					<li class="active">平台用户</li>
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
						<div class="table-header">平台用户列表</div>
						<div class="breadcrumbs" id="breadcrumbs"
							style="margin-top: 5px; padding-bottom: 50px">
							<div class="nav-search" id="nav-search">
								<div class="col-lg-6">
									<form class="form-search" action="${ctx }/getPlatfromList"
										method="post">
										<div class="input-group">
											<input type="text" name="account" class="form-control"
												placeholder="请输入权限名" value="${t_user_info.account}"
												aria-describedby="basic-addon2"> <span
												class="input-group-btn">
												<button class="btn btn-primary btn-sm" type="submit">
													查询</button>
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
										<th>手机号码</th>
										<th>真实姓名</th>
										<th>身份证号码</th>
										<th>认证状态</th>
										<td>邮箱</td>
										<td>总金额</td>
										<td>推荐人</td>
										<td>创建时间</td>
										<td>修改时间</td>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${userInfos.list }" var="userInfo">
										<tr>
											<td class="center"><label> <input
													type="checkbox" class="ace" value="${userInfo.id }" /> <span
													class="lbl"></span>
											</label></td>
											<td>${userInfo.account }</td>
											<td>${userInfo.phoneNum}</td>
											<td>${userInfo.realName}</td>
											<td>${userInfo.idcard}</td>
											<td>${userInfo.authStatus==0?'未认证':(userInfo.authStatus==1?'认证通过':'认证失败')}</td>
											<td>${userInfo.email}</td>
											<td>${userInfo.totalBalance}</td>
											<td>${userInfo.referee}</td>
											<td><fmt:formatDate value="${userInfo.createDate  }"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${userInfo.modifyDate }"
													pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						 	<div class="modal-footer no-margin-top">
							<w:pager pageSize="${userInfos.pageSize }" url="${ctx }/getPlatfromList"
								recordCount="${userInfos.total }" pageNum="${userInfos.pageNum }" />
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
