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
			<jsp:param value="user-list" name="menu" />
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
					<li class="active">新闻管理</li>
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
						<div class="table-header">新闻列表</div>
						<div class="breadcrumbs" id="breadcrumbs"
							style="margin-top: 5px; padding-bottom: 50px">
							<div class="nav-search" id="nav-search">
								<div class="col-lg-6" style="width: 100%;">
									<form class="form-search" action="${ctx}/news/list"
										method="get">
										<div class="input-group">
											<input type="text" name="title" class="input-group-input"
												placeholder="请输入您要查找的新闻标题" value="${news.title}"
												aria-describedby="basic-addon2" style="magin-right: 12px;">
											<select name="classify">
												<option value="">新闻类型</option>
												<option value="1">新闻公告</option>
												<option value="2">媒体知识</option>
												<option value="3">理财知识</option>
											</select> <span class="input-group-btn3">
												<button class="btn btn-primary btn-sm" type="submit">查询</button>
												<a class="btn btn-primary btn-sm" data-toggle="modal"
													data-target="#insertModal" type="button"
													href="${ctx}/news/to-insert">新增</a>
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
										<th>标题</th>
										<th>新闻类型</th>
										<th>发布状态</th>
										<th>发布人</th>
										<th class="hidden-480">发布时间</th>
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${page.list}" var="news">
										<tr>
											<td class="center"><label> <input id="pitchOn"
													type="checkbox" class="ace" value="${news.id }" /> <span
													class="lbl"></span>
											</label></td>
											<td><a href="${ctx}/news/getNewsById?id=${news.id}"
												data-toggle="modal" data-target="#newsModal" title="信息内容">${news.title}</a></td>
											<td>${news.classify==1?'新闻公告':(news.classify==2?'媒体知识':'理财知识')}</td>
											<td>${news.status?'已发布':'未发布'}</td>
											<td>${news.publisherName}</td>
											<td class="hidden-480"><fmt:formatDate
													value="${news.publishDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
											</td>
											<td>
												<div
													class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
													<a class="green"
														href="${ctx}/news/to-update?id=${news.id}"
														data-toggle="modal" data-target="#updateModal"
														title="修改信息"> <i class="icon-pencil bigger-130"></i>
													</a>

													<!-- 发送请求(删除) -->
													<a class="red" href="${ctx}/news/toDelete?id=${news.id}"
														data-toggle="modal" data-target="#deleteModal"
														title="删除信息"> <i class="icon-trash bigger-130"></i>
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
															<li><a href="javascript:void();" data-toggle="modal"
																data-target="#updateModal" class="tooltip-success"
																data-rel="tooltip" title="Edit"> <span class="green">
																		<i class="icon-edit  bigger-120"></i>
																</span>

															</a></li>
															<li><a href="javascript:void();"data-toggle="modal"
																data-target="#deleteModal"
																class="tooltip-error" data-rel="tooltip" title="Delete">
																	<span class="red"> <i
																		class="icon-trash bigger-120"></i>
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
								<w:pager pageSize="${page.pageSize }" url="${ctx}/news/list"
									recordCount="${page.total }" pageNum="${page.pageNum }" />
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 查看新闻的模态框 -->
	<div class="modal fade" id="newsModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	<!-- 增加新闻的模态框 -->
	<div class="modal fade" id="insertModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	<!-- 修改新闻的模态框 -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

	<!-- 删除的模态框 -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
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
		 $("#updateModal").on("hidden.bs.modal", function() {
			 $(this).removeData("bs.modal");
			}); 
	</script>

</body>
</html>
