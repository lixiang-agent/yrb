$(function() 
{
	$("td .btn").click(function() 
	{
		var tds = $(this).parent().parent().children();
		$("#updateId").attr('value' , tds.eq(0).html());
		$("#updateUserId").attr('value' , tds.eq(1).html());
		$("#updateRealName").attr('value' , tds.eq(2).html());
		$("#updateContactNumber").attr('value' , tds.eq(3).html());
		$("#updateLoanBalance").attr('value' , tds.eq(4).html());
		$("#updateLoanTerm").attr('value' , tds.eq(5).html());
		$("#updateAddress").attr('value' , tds.eq(6).html());
	});
	
	$("#update").click(function()
	{
		var balanceReg = /^[0-9]{1,10}$/;
		var termReg = /^[0-9]{1,3}$/;
		
		if(balanceReg.test($("#updateLoanBalance").val())&&termReg.test($("#updateLoanTerm").val()))
			$.ajax({
	            type:"post",
	            url:"/yrb-manager/loanApplication/update",
	            data:$("#updateForm").serialize(),
	            dataType:"json",
	            success:function(msg)
	            {
	                if(msg.toString()=='true')
	                {
	                	window.location.href='/yrb-manager/loanApplication/list';
	                	alert("修改成功");
	                }
	                else
	                	alert("修改失败");
	                
	            }
	        });
	})
})