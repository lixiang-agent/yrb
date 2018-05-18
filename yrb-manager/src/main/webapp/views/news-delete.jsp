<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <form action="${ctx }/news/delete?id=${news}" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>删除新闻</strong>
				</h4>
			</div>

			<div class="modal-body">
				<div class="row">
				<div style="text-align: center;margin: 0 auto;width:50%;">
					<span style="color: c5c5c5;">${tip}</span>
				</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm"
					data-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary btn-sm">确定</button>
			</div>
		</div>
	</div>
	</form>