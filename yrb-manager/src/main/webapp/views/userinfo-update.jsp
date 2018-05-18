<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/updateSaveUserInfo" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h3 class="modal-title">
					<strong>初始化密码</strong>
				</h3>
				
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" value="${userinfos.id}">
				<table class="table">
					<thead>
						<tr>
							<td align="center">账号:</td>
							<td><input type="text" name="account" class="form-control"
								value="${userinfos.account}" maxlength="8"></td>
						</tr>
						<!-- <tr>
							<td align="center">修改密码</td>
							<td><input type="password" name="password" placeholder="默认123456"
								class="form-control" value="123456"
								maxlength="12">
						</td>
						</tr> -->
						<tr>
							<td align="center">修改密码</td>
							<td><input id="password" name="password" class="form-control" 
								type="password" placeholder="默认123456" value="123456"
								 maxlength="12">
								<p class="tcp">密码不能为空</p></td>
						</tr>
						<tr>
							<td align="center">确认密码:</td>
							<td><input id="password2" name="password2" class="form-control" 
								type="password" placeholder="请再输入密码" value="123456"
								 maxlength="12">
								<p class="tcp">请再次输入密码,确保密码一致</p></td>
						</tr>
					</thead>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm"
					data-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary btn-sm">保存</button>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
	$("#password").on("blur", function() {
		if($(this).val()!=null&&$(this).val()!=''){
			$(this).next().css("color","#C5C5C5");
			$(this).next().hide();
			}else{
			$(this).next().css("color","red");	
			$(this).next().show();
		}
	});
	$("#password2").on("blur", function() {
		if($("#password").val()!=null&&$("#password").val()!=''){
			if($(this).val()!=$("#password").val()){
				$(this).next().css("color","red");	
				$(this).next().show();
				$("#submit1").attr("disabled", true);
				}else{
				$(this).next().css("color","#C5C5C5");
				$(this).next().hide();
				$("#submit1").attr("disabled", false);
			}
		}
	});
</script>
