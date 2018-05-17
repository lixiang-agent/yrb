$(function() 
{
	$("td .btn").click(function() 
	{
		console.log(123);
		var tds = $(this).parent().parent().children();
		alert(tds.eq(0).html())
	})
})