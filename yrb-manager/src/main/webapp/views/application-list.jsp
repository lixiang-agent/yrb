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
					<li class="active">申请列表</li>
				</ul>
				<!-- .breadcrumb -->

				<div class="nav-search" id="nav-search">
					<form class="form-search">
						<span class="input-icon">
							<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
							<i class="icon-search nav-search-icon"></i>
						</span>
					</form>
				</div>
				<!-- #nav-search -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<div class="table-header">申请列表</div>
						<div class="breadcrumbs" id="breadcrumbs" style="margin-top: 5px; padding-bottom: 50px">
							<div class="nav-search" id="nav-search">
								<div class="col-lg-6"  style="width:100%;">
									<form class="form-search" action="${ctx}/loanApplication/listLoanApplication" method="get">
										<div class="input-group">
											<input type="text" name="realName" class="input-group-input" placeholder="请输入您要查找的真实姓名" aria-describedby="basic-addon2" style="magin-right:12px;">
											<input type="text" name="contactNumber" class="input-group-input" placeholder="请输入您要查找的联系电话" aria-describedby="basic-addon2" style="magin-right:12px;">
											<span class="input-group-btn3">
												<button class="btn btn-primary btn-sm" type="submit">查询</button>
											</span>
										</div>
									</form>
								</div>
							</div>
							<!-- #nav-search -->
						</div>
						<div class="table-responsive">
							<table id="sample-table-2" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>申请id</th>
										<th>用户id</th>
										<th>真实姓名</th>
										<th>联系电话</th>
										<th>借款金额</th>
										<th>借款期限</th>
										<th>所在地址</th>
										<th class="hidden-480">申请时间</th>
										<th>处理</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${page.list}" var="application">
										<tr>
											<td>${application.id}</td>
											<td>${application.userId}</td>
											<td>${application.realName}</td>
											<td>${application.contactNumber}</td>
											<td>${application.loanBalance}</td>
											<td>${application.loanTerm}</td>
											<td>${application.address}</td>
											<td class="hidden-480">
												<fmt:formatDate value="${application.appliyDate }" pattern="yyyy-MM-dd"></fmt:formatDate>
											</td>											
											<td>
												<button class="btn btn-xs btn-info">
													<i class="icon-edit bigger-120" data-toggle="modal" data-target="#updateModal"></i>
												</button>
												<button class="btn btn-xs btn-danger">
													<i class="icon-trash bigger-120"></i>
												</button>
												<button class="btn btn-xs btn-success">
													<i class="icon-ok bigger-120"></i>
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="modal-footer no-margin-top">
								<w:pager pageSize="${page.pageSize }" url="${ctx}/loanApplication/list" recordCount="${page.total }" pageNum="${page.pageNum }" />
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="updateForm">
					<div class="panel panel-default">
					  <div class="panel-heading">申请信息修改</div>
					  <div class="panel-body">
					  	<div class="container">
							<div class="row">
						    	<div class="col-md-5">
						    		<span class="label label-primary">申请id:</span>
						      		<input id="updateId" name="id" readonly   />
						    	</div>
						    	<div class="col-md-5">
						    		<span class="label label-primary">真实姓名:</span>
						      		<input id="updateRealName" name="realName"  readonly  />
						    	</div>   
							</div>
							<div class="row">
						    	<div class="col-md-5">
						    		<span class="label label-primary">联系电话:</span>
						      		<input id="updateContactNumber" name="contactNumber"  readonly  />
						    	</div>
						    	<div class="col-md-5">
						    		<span class="label label-primary">联系地址:</span>
						      		<input id="updateAddress" name="address" readonly  />
						    	</div>
							</div>
							<div class="row">
						    	<div class="col-md-5">
						    		<span class="label label-primary">借款金额:</span>
						      		<input id="updateLoanBalance" type="number" name="loanBalance"  />
						    	</div>
						    	<div class="col-md-5">
						    		<span class="label label-primary">借款期限:</span>
						      		<input id="updateLoanTerm" type="number" name="loanTerm" />
						    	</div>   
							</div>
						</div>
						<input id="updateUserId" type="hidden" name="userId" />
						
						<input id="updateHandlerId" type="hidden" name="handlerId" value="${user.id}" />
						<input id="updateHandlerName" type="hidden" name="handlerName" value="${user.username}" />
					  </div>
					</div>		
				</form>
				<button id="update" class="btn btn-primary"><i class="icon-save bigger-160"></i>修改</button>
			</div>
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
	
	<script src="${ctx}/js/application-list.js"></script>
</body>
</html>
