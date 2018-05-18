<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <form action="${ctx }/news/list" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>新闻内容</strong>
				</h4>
			</div>

			<div class="modal-body">
				<div class="row">
				<div style="text-align: center;margin: 0 auto;width:80%;">
						<h1>${news.title}</h1>
						<span>创建时间：<fmt:formatDate value="${news.createDate}" pattern="yyyy-MM-dd"/> |</span>
						<span>新闻类型：${news.classify==1?'新闻公告':(news.classify==2?'媒体知识':'理财知识')}</span>
						<div  style="text-indent:2em;">
							${news.content}
						</div>
				</div>	
				</div>
			</div>
		</div>
	</div>
	</form>