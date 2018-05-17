<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form action="insert" method="POST" id="test">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">添加用户</h4>
			</div>
			<div class="modal-body">
				<p>
					账号： <input id="username" name="username" maxlength="20"> <span
						id="usernameTip" style="color: red;"></span>
				</p>
				<!-- <p>
			用户名：<input name="realName" type="realName">
		</p> -->
				<p>
					用户名：<input name="realName" type="text">
				</p>
				<p>
					密码: <input name="password" type="password" maxlength="20">

				</p>
				<p>
					性别：<label><input name="sex" type="radio" value="1">男
					</label> <label><input name="sex" type="radio" value="0">女
					</label>
				</p>

				<p>
					出生年月：<input name="birthday" type="date">

				</p>


			</div>
			<div class="modal-footer">
				<button type="reset" class="btn btn-default btn-sm"
					data-dismiss="modal">重置</button>
				<button type="button" onclick="checkform()"
					class="btn btn-primary btn-sm">保存</button>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript">
		
		$("#username").on("change",function(){
			var val =$(this).val();
			console.log(val);
			var reg = /^[a-zA-Z][a-zA-Z0-9_]{4,11}$/
			if(!reg.test(val)){
				console.log('内容错误');
				$("#usernameTip").text("账号只能以字母开头,又字母，数字，下划线组成,长度5-12位");
				$("#usernameTip").css("color","red");
			}else{
				
				$.post('${ctx}/user/checkUserExist',{'username':val},function(data){
					console.log(data);
					if(data==true){
						$("#usernameTip").text('该用户已存在');
						$("#usernameTip").css("color","red");
					}else{
						$("#usernameTip").text('该用户可注册');
						$("#usernameTip").css("color","blue");
					}
				});
			}
		})
		
	function checkform(){
			if($("#username").val()==''){
				console.log("账号不能为空");
				$("#username").focus();
				return false;
			}
			var pwd=$("#password").val();
			if(pwd==''){
				console.log("密码不能为空");
				$("#password").focus();
				return false;
			}
		 if (pwd.length<5||pwd.length>20) {
			 console.log("密码超出了范围（5~20）。");
			 $("#password").focus();
		      return false;
		   }
		 $("#test").submit();
	}
		
	</script>
