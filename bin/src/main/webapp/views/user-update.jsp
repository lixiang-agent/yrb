<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="${ctx }/user/updateUser" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>修改用户</strong>
				</h4>
			</div>

			<div class="modal-body">

				<input type="hidden" name="id" value="${user.id }">
				<div class="row">
				<div style="text-align: center;margin: 0 auto;width:50%;">
					<table>
						<tr>
							<td width="30%"><b>用户名:</b></td>
							<td width="70%"><input name="username"
								value="${user.username }" readonly="readonly"></td>
						</tr>
						<tr>
							<td width="30%"><b>密码:</b></td>
							<td width="70%"><input id="password1" name="password1"
								type="password" placeholder="请输入密码" value=""
								 oncopy="return false" oncut="return false" maxlength="12">
								<p class="tcp">密码不能为空</p></td>
						</tr>
						<tr>
							<td width="30%"><b>确认密码:</b></td>
							<td width="70%"><input id="password2" name="password2"
								type="password" placeholder="请再输入密码" value=""
								onpaste="return false" maxlength="12">
								<p class="tcp">请再次输入密码,确保密码一致</p></td>
						</tr>
						<tr>
							<td width="30%"><b>性别:</b></td>
							<td width="70%"><label><input name="sex"
									type="radio" value="1" ${user.sex=='1'?'checked="checked"':'' }>男
							</label> <label><input name="sex" type="radio" value="0"
									${user.sex=='0'?'checked="checked"':'' }>女 </label></td>
						</tr>
						<tr>
							<td width="30%"><b>出生年月:</b></td>
							<td width="70%"><input type="date" name="birthday"
								value="${user.birthday}"></td>
						</tr>
					</table>
						</div>
					<div style="color: red; text-align: center">${msg }</div>
					
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm"
					data-dismiss="modal">取消</button>
				<button id="submit1" disabled="disabled" type="submit" class="btn btn-primary btn-sm">提交</button>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
	$("#password1").on("blur", function() {
		if($(this).val()!=null&&$(this).val()!=''){
			$(this).next().css("color","#C5C5C5");
			$(this).next().hide();
			}else{
			$(this).next().css("color","red");	
			$(this).next().show();
		}
	});
	$("#password2").on("blur", function() {
		if($("#password1").val()!=null&&$("#password1").val()!=''){
			if($(this).val()!=$("#password1").val()){
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
