<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="c" value="${pageContext.request.contextPath}"
	scope="application"></c:set>
<!-- 配置文件 -->
<script type="text/javascript" src="${c}/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${c}/ueditor/ueditor.all.js"></script>
<link rel="stylesheet"
	href="${c}/ueditor/themes/default/css/ueditor.css">
<script type="text/javascript" src="${c}/ueditor/lang/zh-cn/zh-cn.js"></script>

<form action="${ctx }/news/insert" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>增加新闻</strong>
				</h4>
			</div>

			<div class="modal-body">
				<div class="row">
					<div style="text-align: center; margin: 0 auto; width: 80%;">
						<p>
							标题:<input id="title" name="title" placeholder="请输入标题" maxlength="12">
							<form:errors path="title"></form:errors>
						</p>
						<p>
							新闻类型：<select name="classify">
								<option value="1">新闻公告</option>
								<option value="2">媒体知识</option>
								<option value="3">理财知识</option>
							</select>
						</p>
						<p>
							<TEXTAREA id="content" name="content"></TEXTAREA>
							<form:errors path="content"></form:errors>
						</p>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm"
					data-dismiss="modal">取消</button>
				<button id="submit1" disabled="disabled" type="submit"
					class="btn btn-primary btn-sm">提交</button>
			</div>
		</div>
	</div>
</form>
<SCRIPT type=text/javascript>
	//var editor = new UE.ui.Editor();  
	//editor.render("myEditor");  
	UE.getEditor('content', {
		toolbars : [ [ 'undo', 'redo', '|', 'bold', 'italic', 'underline',
				'fontborder', 'strikethrough', 'superscript', 'subscript',
				'removeformat', '|', 'forecolor', 'backcolor',
				'insertorderedlist', 'insertunorderedlist', '|', 'paragraph',
				'fontfamily', 'fontsize', 'indent', '|', 'justifyleft',
				'justifycenter', 'justifyright', 'justifyjustify', '|',
				'touppercase', 'tolowercase', '|', 'link', 'unlink', '|',
				'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
				'simpleupload', 'insertimage', 'emotion', '|', 'horizontal',
				'time', 'spechars', '|', 'preview', 'help' ] ],
		autoHeightEnabled : true,
		autoFloatEnabled : true
	});
	$("#title").on("blur", function() {
		if ($("#title").val() != null && $("#title").val() != ''&&$("#content").val() != null && $("#content").val() != '') {
			$("#submit1").attr("disabled", true);
		} else {
			$("#submit1").attr("disabled", false);

		}
	});
</SCRIPT>
