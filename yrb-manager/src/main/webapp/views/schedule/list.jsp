<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />

<style type="text/css">
	.green{
		color:green;
	}
	
	.red{
	color:red;}

</style>
</head>

<body>
	<%@ include file="/top.jsp"%>
	<div class="main-container" id="main-container">
		<jsp:include page="/menu.jsp">
			<jsp:param value="schedule-schedulelist" name="menu" />
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
					<li class="active">定时任务管理</li>
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
						<div class="table-header">定时任务列表</div>
						<div class="breadcrumbs" id="breadcrumbs"
							style="margin-top: 5px; padding-bottom: 50px">
							<div class="nav-search" id="nav-search">
								<div class="col-lg-12" style="width: 100%;">
									<form class="form-search" action="${ctx}/schedule/list"
										method="get">
										<div class="input-group">
											任务名称：<input type="text" name="jobName"
												class="input-group-input" placeholder="请输入任务名称"
												value="${scheduleJob.jobName }" aria-describedby="basic-addon2"
												style="magin-right: 12px;"> 任务状态： <select
												name="jobStatus">
												<option value="">全部</option>
												<option value="1"
													${scheduleJob.jobStatus=='1'?'selected="selected"':'' }>进行中</option>
												<option value="2"
													${scheduleJob.jobStatus=='2'?'selected="selected"':'' }>已暂定</option>
											</select> <span class="input-group-btn3">
												<button class="btn btn-primary btn-sm" type="submit">查询</button>
												
												<span>
													<a href="${ctx }/schedule/edit" data-toggle="modal"
															data-target="#editModal" title="新增任务">新增</a>
												</span>
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
										<th>任务名称</th>
										<th>任务组</th>
										<th>任务状态</th>
										<th class="hidden-480">定时表达式</th>
										<th>任务描述</th>
										<th>任务执行类</th>
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${page.list }" var="job">
										<tr>
											<td class="center"><label> <input id="pitchOn"
													type="checkbox" class="ace" value="${job.jobId }" /> <span
													class="lbl"></span>
											</label></td>
											<td>${job.jobName }</td>
											<td>${job.jobGroup}</td>
											<td>${job.jobStatus==1?'<span class="green">进行中</span>':'<span class="red">已暂停</span>'}</td>
											<td>${job.cronExpression }</td>
											<td class="hidden-480">${job.jobDesc }</td>
											<td>${job.jobClass }</td>
											<td>
												<div
													class="">

													<c:if test="${job.jobStatus=='0' }">
														<a class="green"
															href="#"
															data-toggle="modal"
															data-target="#startModel${job.jobId }" title="开启任务">
															开启
														</a>
														<div class="modal fade" id="startModel${job.jobId }"
															tabindex="-1" role="dialog">
															<div class="modal-dialog" role="document">
																<form action="${ctx }/schedule/start" method="post">
																	<input type="hidden" name="jobId" value="${job.jobId }">
																	<div class="modal-content">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																			<h4 class="modal-title">操作提示</h4>
																		</div>
																		<div class="modal-body">
																			<p>确定要开启该任务吗?&hellip;</p>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-default"
																				data-dismiss="modal">取消</button>
																			<button type="submit" class="btn btn-primary">确定</button>
																		</div>
																	</div>
																</form>
																<!-- /.modal-content -->
															</div>
														</div>
													</c:if>
													<c:if test="${job.jobStatus=='1' }">
														<a class="orange" href="#" data-toggle="modal"
															data-target="#delModel${job.jobId }" title="暂定任务"> 
															暂停
														</a>

														<div class="modal fade" id="delModel${job.jobId }"
															tabindex="-1" role="dialog">
															<div class="modal-dialog" role="document">
																<form action="${ctx }/schedule/stop" method="post">
																	<input type="hidden" name="jobId" value="${job.jobId }">
																	<div class="modal-content">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																			<h4 class="modal-title">操作提示</h4>
																		</div>
																		<div class="modal-body">
																			<p>确定要暂定该任务吗?&hellip;</p>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-default"
																				data-dismiss="modal">取消</button>
																			<button type="submit" class="btn btn-primary">确定</button>
																		</div>
																	</div>
																</form>
																<!-- /.modal-content -->
															</div>
															<!-- /.modal-dialog -->
														</div>
													</c:if>
													|
													<a href="${ctx }/schedule/edit?jobId=${job.jobId}" data-toggle="modal"
															data-target="#editModal" title="修改任务">修改</a>
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
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
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
		$("#editModal").on("hidden.bs.modal", function() {
			$(this).removeData("bs.modal");
		});

	</script>
	
	<%@ include file="/tip.jsp" %>
</body>
</html>
