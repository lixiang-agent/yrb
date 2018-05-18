$().ready(function() {
	$("#submit").click(function() {
		$("#errorInfo").html("");
		var reg=/((^([1-9]\d*))|^0)(\.\d{1,2})?$|(^[-]0\.\d{1,2}$)/;
		if($("#investBalance").val()==""){
			$("#errorInfo").html("请输入金额");
			return false;
		}
		if($("#password").val()==""){
			$("#errorInfo").html("请输入密码");
			return false;
		}
		if(reg.test($("#investBalance").val())&&$("#investBalance").val()!=""&&$("#password").val()!=""){
			return true;
		}else{
			$("#errorInfo").html("请输入正确的金额");
			return false;
		}
		
	});
	
	
});