<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>OA系统</title>
<%
	String ctx = request.getServletContext().getContextPath();
	application.setAttribute("ctx", ctx);
%>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- basic styles -->

<link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctx}/assets/css/font-awesome.min.css" />

<!-- ace styles -->

<link rel="stylesheet" href="${ctx}/assets/css/ace.min.css" />
<link rel="stylesheet" href="${ctx}/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="${ctx}/assets/css/ace-skins.min.css" />

<script src="${ctx}/assets/js/ace-extra.min.js"></script>
<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
</head>
<body>

	<script type="text/javascript">
		try {
			ace.settings.check('main-container', 'fixed')
		} catch (e) {
		}
	</script>

	<div class="main-container-inner">
		<a class="menu-toggler" id="menu-toggler" href="#"> <span
			class="menu-text"></span>
		</a>

		<div class="sidebar" id="sidebar">
			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'fixed')
				} catch (e) {
				}
			</script>

			<div class="sidebar-shortcuts" id="sidebar-shortcuts">
				<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					<button class="btn btn-success">
						<i class="icon-signal"></i>
					</button>

					<button class="btn btn-info">
						<i class="icon-pencil"></i>
					</button>

					<button class="btn btn-warning">
						<i class="icon-group"></i>
					</button>

					<button class="btn btn-danger">
						<i class="icon-cogs"></i>
					</button>
				</div>

				<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					<span class="btn btn-success"></span> <span class="btn btn-info"></span>

					<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
				</div>
			</div>
			<!-- #sidebar-shortcuts -->
			<ul class="nav nav-list">
				<li class="" id="user">
					<a href="#" class="dropdown-toggle">
						<i class="icon-group"></i> <span class="menu-text"> 用户管理 </span> <b
						class="arrow icon-angle-down"></b>
					</a>
					<ul class="submenu">
						<li class="" id="list"><a href="${ctx }/user/list"> <i
								class="icon-double-angle-right"></i> 用户列表
						</a></li>
					</ul>
				</li>

				<li class="" id="auth">
					<a href="#" class="dropdown-toggle">
						<i class="icon-list"></i> <span class="menu-text"> 权限管理 </span> <b
						class="arrow icon-angle-down"></b>
					</a>

					<ul class="submenu">
						<li id="resources">
							<a href="${ctx }/resources/pageList"> <i
								class="icon-double-angle-right"></i> 资源管理
							</a>
						</li>
						<li id="role">
							<a  href="${ctx }/getRolesList"> <i
								class="icon-double-angle-right"></i> 角色管理
							</a>
						</li>
						<li id="ugroup">
							<a  href="${ctx }/ugroup/list"> <i
								class="icon-double-angle-right"></i> 用户组管理
							</a>
						</li>

					</ul>
			   </li>
				<li class="" id="inv">
					<a href="#" class="dropdown-toggle">
						<i class="icon-list"></i> <span class="menu-text">投资管理 </span> <b
						class="arrow icon-angle-down"></b>
					</a>
					<ul class="submenu">
						<li id="invpro">
							<a href="${ctx }/investManage/pageList"> <i
								class="icon-double-angle-right"></i> 投资项目
							</a>
						</li>
						<li id="role">
							<a  href="${ctx }/getRolesList"> <i
								class="icon-double-angle-right"></i> 审批投资项目
							</a>
						</li>
					</ul>
				</li>

			</ul>
			<!-- /.nav-list -->

		</div>
	</div>
	
	<script type="text/javascript">
		//获取菜单的参数
		var menu = '${param.menu}';
		console.log(menu);
		if(menu!=null && menu!=''){
			var str=menu.split("-");
			
			if(str.length>=2){
				var menuId="#"+str[0];
				$(menuId).addClass("open");
				$(menuId).addClass("active");
				$("#"+str[1]).addClass("active");
			}
		}
		
	
	</script>

</body>

</html>