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
 						<table>
							<tr>
								<td>标题:<input name="title"> <form:errors
										path="title"></form:errors>
								</td>
							</tr>
							<tr>
							<TEXTAREA id="content" name="content"></TEXTAREA>
								<form:errors path="content"></form:errors>
							</tr>
						</table> 
								
						
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
		toolbars : [ [
			'fullscreen', 'source','|',
			'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|',
            'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|',
            'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|',
            'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', 'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
            'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
            'preview', 'help'
		] ],
		autoHeightEnabled : true,
		autoFloatEnabled : true
	});
</SCRIPT> 
