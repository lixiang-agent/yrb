<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String ctx = request.getServletContext().getContextPath();
	application.setAttribute("ctx", ctx);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${ctx}/css/common.css" rel="stylesheet" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/css/detail.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx}/script/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/script/common.js"></script>
		<script type="text/javascript" src="${ctx}/script/invProject.js"></script>
</head>
<script type="text/javascript">
$().ready(function() {
	//格式化数字
	function fnumber(s, n) {
	    /*
	     * 参数说明：
	     * s：要格式化的数字
	     * n：保留几位小数
	     * */
	    n = n > 0 && n <= 20 ? n : 2;
	    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
	    var l = s.split(".")[0].split("").reverse(),
	        r = s.split(".")[1];
	    t = "";
	    for (i = 0; i < l.length; i++) {
	        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
	    }
	    return t.split("").reverse().join("") + "." + r;
	}
	
	//创建一个map来保存条件
	var invCondition={};
	$("#projectType li a").click(function() {
		$("#projectType li a").removeClass("active");
		$(this).addClass("active");
		invCondition["projectType"]=$(this).attr("name");
		queryList();
	});

	$("#rate li a").click(function() {
		$("#rate li a").removeClass("active");
		$(this).addClass("active");
		var rate=new Array(2);
		if($(this).attr("name")!=undefined){
			rate=$(this).attr("name").split(",");
			invCondition["minRate"]=rate[0];
			invCondition["maxRate"]=rate[1];
		}else{
			invCondition["minRate"]=undefined;
			invCondition["maxRate"]=undefined;
		}
		queryList();
	});
	$("#term li a").click(function() {
		$("#term li a").removeClass("active");
		$(this).addClass("active");
		var term=new Array(2);
		if($(this).attr("name")!=undefined){
		rate=$(this).attr("name").split(",");
		invCondition["minMonth"]=rate[0];
		invCondition["maxMonth"]=rate[1];
		}else{
			invCondition["minMonth"]=undefined;
			invCondition["maxMonth"]=undefined;
		}
		queryList();
	});
	$("#paybackWay li a").click(function() {
		$("#paybackWay li a").removeClass("active");
		$(this).addClass("active");
		invCondition["paybackWay"]=$(this).attr("name");
		queryList();
	});

	$("#termSort a").click(function(){
		invCondition["orderBy"]="payback_time";
		invCondition["orderMethod"]=$(this).attr("name")
		queryList();
	});
	$("#balanceSort a").click(function(){
		invCondition["orderBy"]="inv_totbalance";
		invCondition["orderMethod"]=$(this).attr("name")
		queryList();
	});
	$("#rateSort a").click(function(){
		invCondition["orderBy"]="rate";
		invCondition["orderMethod"]=$(this).attr("name")
		queryList();
	});
	$("#scheduleSort a").click(function(){
		invCondition["orderBy"]="schedule";
		invCondition["orderMethod"]=$(this).attr("name")
		queryList();
	});
	function queryList(){
		var url="${ctx}/invProject/listByInvProject";
		if(invCondition["minMonth"]!=null){
			url=url+"?minMonth="+invCondition["minMonth"];
		}else{
			url=url+"?minMonth=0";
		}
		if(invCondition["maxMonth"]!=null){
			url=url+"&maxMonth="+invCondition["maxMonth"];
		}
		if(invCondition["projectType"]!=null){
			url=url+"&projectType="+invCondition["projectType"];
		}
		if(invCondition["minRate"]!=null){
			url=url+"&minRate="+invCondition["minRate"];
		}
		if(invCondition["maxRate"]!=null){
			url=url+"&maxRate="+invCondition["maxRate"];
		}
		if(invCondition["paybackWay"]!=null){
			url=url+"&paybackWay="+invCondition["paybackWay"];
		}
		if(invCondition["orderBy"]!=null){
			url=url+"&orderBy="+invCondition["orderBy"]+"&orderMethod="+invCondition["orderMethod"];
		}
		$.ajax({
			url:url,
			dataType:"json",
			type:"post",
			success:function(data){
				$("#projectItem").empty();
		 	for(var i=0;data.length;i++){
		 		
		 		var item='<ul>'
		 		+'<li id="invProjectId" style="display: none">'+data[i].id+'</li>'
				+'<li class="col-330 col-t"><a href="infor.html"'
				+'	target="_blank"><i class="icon ';
				
					if(data[i].projectType==1){
						item+="icon-che";
					}
					if(data[i].projectType==2){
						item+="icon-fang";
					}
					if(data[i].projectType==3){
						item+="icon-shu";
					}
					if(data[i].projectType==4){
						item+="icon-zhai";
					}
				item+=' " title="车易贷"></i></a><a'
				+'	class="f18" href="infor.html"'
				+' <input  name="invProjectId" type="hidden" value="'+data[i].id+'"/>'
				+'		'+data[i].projectName+'</a></li>'
				+'<li class="col-180"><span class="f20 c-333">'+data[i].invTotbalance+'.00</span>元</li>'
				+'	<li class="col-110 relative"><span class="f20 c-orange">'+data[i].rate
				+'.00	</span>%</li>'
				+'	<li class="col-150"><span class="f20 c-333">'+data[i].paybackTime +'</span>个月'
				+'	</li>'
				+'	<li class="col-150">';
				if(data[i].paybackWay==0){
					item+="到期还本还息";
				}
				if(data[i].paybackWay==1){
					item+="按月付息，到期还本";
				}
				if(data[i].paybackWay==2){
					item+="等额本息";
				}
				item+='</li>'
				+'	<li class="col-120">'
				+'		<div class="circle">'
				+'				<div class="progress-bgPic progress-bfb10">'
				+'					<div class="show-bar">'
				+'					'+fnumber((data[i].invBalance/data[i].invTotbalance).toFixed(2)*100,2)+'%</div>'
				+'			</div>'
				+'		</div>'
				+'	</div>'
				+'	</li>'
				+'<li class="col-120-2"><a class="ui-btn btn-gray"'
				+'	href="${ctx }/invProject/invProject?id="'+data[i].id+'">投资</a></li>'
				+'</ul>'
				$("#projectItem").append(item);
			} 
			
			
			}
		}); 
	}
});
</script>
<body>
	<header> <!-- 头部 --> <jsp:include page="/top.jsp">
		<jsp:param value="inv" name="menu" />
	</jsp:include> <!--列表-->
	<div class="page-filter wrap">
		<div class="breadcrumbs">
			<a href="index.html">首页</a>&gt;<span class="cur">散标投资列表</span>
		</div>
		<div class="invest-filter" data-target="sideMenu">
			<div class="filter-inner clearfix">
				<div class="filter-item">
					<div class="hd">
						<h3>筛选投资项目</h3>
						<label> <input id="filterMulti" name="multiple_choice"
							type="checkbox"> 多选</label>
					</div>
					<div class="bd">
						<dl>
							<dt>项目类型</dt>
							<dd>
								<ul id="projectType">
									<li class="n1"><a href="javascript:void(0);"
										id="post_type_" class="active">不限</a></li>
									<li class="n2"><a
										href="javascript:url('post_type','car');" id="post_type_car"
										name="1">车易贷</a></li>
									<li class="n3"><a
										href="javascript:url('post_type','house');"
										id="post_type_house" name="2">房易贷</a></li>
									<li class="n4"><a
										href="javascript:url('post_type','bridge');"
										id="post_type_bridge" name="3">赎楼贷</a></li>
									<li class="n5"><a
										href="javascript:url('post_type','worth');"
										id="post_type_worth" name="4">债权贷</a></li>
								</ul>
							</dd>
						</dl>
						<dl>
							<dt>年利率</dt>
							<dd>
								<ul id="rate">
									<li class="n1"><a href="javascript:void(0);"
										id="post_type_" class="active">不限</a></li>
									<li class="n2"><a id="borrow_interestrate_1"
										href="javascript:url('borrow_interestrate','1');" name="0,12">12%以下</a>
									</li>
									<li class="n3"><a id="borrow_interestrate_2"
										href="javascript:url('borrow_interestrate','2');" name="12,14">12%-14%</a>
									</li>
									<li class="n4"><a id="borrow_interestrate_3"
										href="javascript:url('borrow_interestrate','3');" name="14,16">14%-16%</a>
									</li>
									<li class="n5"><a id="borrow_interestrate_4"
										href="javascript:url('borrow_interestrate','4');"
										name="16,200">16%及以上</a></li>
								</ul>
							</dd>
						</dl>
						<dl>
							<dt>期限</dt>
							<dd>
								<ul id="term">
									<li class="n1"><a
										href="javascript:url('spread_month','');" id="spread_month_"
										class="active">不限</a></li>
									<li class="n2"><a id="spread_month_1"
										href="javascript:url('spread_month','1');" name="0,1">1月以下</a>
									</li>
									<li class="n3"><a id="spread_month_2"
										href="javascript:url('spread_month','2');" name="1,3">1-3月</a>
									</li>
									<li class="n4"><a id="spread_month_3"
										href="javascript:url('spread_month','3');" name="3,6">3-6月</a>
									</li>
									<li class="n5"><a id="spread_month_4"
										href="javascript:url('spread_month','4');" name="6,12">6-12月</a>
									</li>
									<li class="n6"><a id="spread_month_5"
										href="javascript:url('spread_month','5');" name="12,999">12月及以上</a>
									</li>
								</ul>
							</dd>
						</dl>
						<dl class="repayment">
							<dt>还款方式</dt>
							<dd>
								<ul id="paybackWay">
									<li class="n1"><a href="javascript:url('repay_style','');"
										id="repay_style_" class="active">不限</a></li>
									<li class="n2"><a id="repay_style_end"
										href="javascript:url('repay_style','end');" name="0">到期还本付息</a></li>
									<li class="n2"><a id="repay_style_endmonth"
										href="javascript:url('repay_style','endmonth');" name="1">按月付息,到期还本</a>
									</li>
									<li class="n2"><a id="repay_style_month"
										href="javascript:url('repay_style','month');" name="2">等额本息</a></li>
								</ul>
							</dd>
						</dl>
					</div>
				</div>
				<div class="common-problem">
					<h3>常见问题</h3>
					<ul>
						<li><a href="#">什么是债权贷？</a></li>
						<li><a href="#">关于"债权贷"产品的说明</a></li>
						<li><a href="#">易贷网P2P理财收费标准</a></li>
						<li><a href="#">债权贷和房易贷、车易贷有什么区别？</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="invest-list mrt30 clearfix">
			<div class="hd">
				<h3>投资列表</h3>
				<div class="count">
					<ul>
						<li class="line">散标投资交易金额&nbsp;&nbsp;<span class="f20 bold">73.54亿元</span></li>
						<li>累计赚取收益&nbsp;&nbsp;<span class="f20 bold">2.52亿元</span></li>
					</ul>
				</div>
			</div>
			<div class="bd">
				<div class="invest-table clearfix">
					<div class="title clearfix">
						<ul>
							<li class="col-330">借款标题</li>
							<li class="col-180" id="balanceSort">借款金额
								<a href="javascript:void(0)" style="background-image:url('${ctx }/images/arrow_up.png'); cursor:pointer" title="升序" name="0"></a>
								<a href="javascript:void(0)" style="background-image:url('${ctx }/images/arrow_down.png'); cursor:pointer" title="降序" name="1"></a>
							</li>
							<li class="col-110" id="rateSort">利率
								<a href="javascript:void(0)" style="background-image:url('${ctx }/images/arrow_up.png'); cursor:pointer" title="升序" name="0"></a>
								<a href="javascript:void(0)" style="background-image:url('${ctx }/images/arrow_down.png'); cursor:pointer" title="降序" name="1"></a>
							</li>
							<li class="col-150" id="termSort">借款期限
								<a href="javascript:void(0)" style="background-image:url('${ctx }/images/arrow_up.png'); cursor:pointer" title="升序" name="0"></a>
								<a href="javascript:void(0)" style="background-image:url('${ctx }/images/arrow_down.png'); cursor:pointer" title="降序" name="1"></a>
							</li>
							<li class="col-150">还款方式</li>
							<li class="col-120" id="scheduleSort">借款进度
								<a href="javascript:void(0)" style="background-image:url('${ctx }/images/arrow_up.png'); cursor:pointer" title="升序" name="0"></a>
								<a href="javascript:void(0)" style="background-image:url('${ctx }/images/arrow_down.png'); cursor:pointer" title="降序" name="1"></a>
							</li>
							<li class="col-120-t">操作</li>
						</ul>
					</div>
					<!------------投资列表-------------->
					<div class="item" id="projectItem">
						<c:if test="${not empty listInvProject}">
							<c:forEach items="${listInvProject }" var="invProject">
								<input  name="invProjectId" type="hidden" value="${invProject.id }"/>
								<ul>
									<li class="col-330 col-t"><a href="infor.html"
										target="_blank"><i class="icon
										<c:choose>
											<c:when test="${invProject.projectType ==1 }">icon-che</c:when>
											<c:when test="${invProject.projectType ==2 }">icon-fang</c:when>
											<c:when test="${invProject.projectType ==3 }">icon-shu</c:when>
											<c:when test="${invProject.projectType ==4 }">icon-zhai</c:when>
										</c:choose></li>
										  " ></i></a><a
										class="f18" href="infor.html"
										title="${invProject.projectName }" target="_blank">
											${invProject.projectName }</a></li>
									<li class="col-180"><span class="f20 c-333"><br/>
									<fmt:formatNumber value="${invProject.invTotbalance }" type="currency" pattern="#0.00"/>
									</span>元</li>
									<li class="col-110 relative"><span class="f20 c-orange">${invProject.rate }
									</span>%</li>
									<li class="col-150"><span class="f20 c-333">${invProject.paybackTime }</span>个月
									</li>
									<li class="col-150">
									<c:choose>
											<c:when test="${invProject.paybackWay ==0 }">到期还本还息</c:when>
											<c:when test="${invProject.paybackWay ==1 }">按月付息，到期还本</c:when>
											<c:when test="${invProject.paybackWay ==2 }">等额本息</c:when>
										</c:choose></li>
									<li class="col-120">
										<div class="circle">
											<div class="left progress-bar">
												<div class="progress-bgPic progress-bfb10">
													<div class="show-bar">
													<fmt:formatNumber value="${(invProject.invBalance/invProject.invTotbalance)*100 }" pattern="#0.00" />%
														</div>
												</div>
											</div>
										</div>
									</li>
									<li class="col-120-2"><a class="ui-btn btn-gray"
										href="${ctx }/invProject/invProject?id=${invProject.id }">投资</a></li>
								</ul>
							</c:forEach>
						</c:if>
					</div>

					<!------------投资列表-------------->
				</div>
				<div class="pagination clearfix mrt30">
					<span class="page"><a href="javascript:void(0);" onclick="">首页</a><a
						href="javascript:void(0);" onclick="">上一页</a>&nbsp;<a class="curr"
						href="javascript:;">1</a> <a href="#">2</a> <a href="#">3</a> <a
						href="#">4</a> <a href="#">5</a> <a href="javascript:void(0);"
						onclick="#">下一页</a><a href="javascript:void(0);" onclick="#">尾页</a>&nbsp;<em>共2297页&nbsp;</em></span>
					<dl class="page-select">
						<dt>
							<span>1</span><i class="icon icon-down"></i>
						</dt>
						<dd style="display: none;">
							<ul name="nump" id="jsnump">
								<li><a href="##" onclick="page_jump(&quot;this&quot;,1)">1</a></li>
								<li><a href="##" onclick="page_jump(&quot;this&quot;,2)">2</a></li>
								<li><a href="##" onclick="page_jump(&quot;this&quot;,3)">3</a></li>
							</ul>
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入底部 --> <%@ include file="/buttom.jsp"%>
</body>
</html>
