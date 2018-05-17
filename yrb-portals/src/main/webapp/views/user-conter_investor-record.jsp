<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${ctx }/css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/user.css" />
<script type="text/javascript" src="${ctx }/script/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/script/common.js"></script>
<script src="${ctx }/script/user.js" type="text/javascript"></script>
</head>
<body>
<!-- 引入头部 -->
<jsp:include page="/top.jsp">
	<jsp:param value="index" name="menu"/>
</jsp:include>
<!--个人中心-->
<div class="wrapper wbgcolor">
  <div class="w1200 personal">
    <div class="credit-ad"><img src="images/clist1.jpg" width="1200" height="96"></div>
    <!-- 引入账户总览 -->
	<%@ include file="/account-pandect.jsp" %>
    <style type="text/css">
		.invest-tab .on  a{color:#fff;}
	</style>
    <div class="personal-main">
      <div class="personal-investnote">
        <h3><i>投资记录</i></h3>
        <div class="investnote-money"> <span><b class="fb">累计投资</b><br>
          <i>0.00</i> 元 </span> <span><b class="fb">累计收益</b><br>
          <i class="c-pink">0.00</i> 元 </span> <span><b class="fb">待收本金</b><br>
          <i>0.00</i> 元 </span> <span class="none"><b class="fb">待收收益</b><br>
          <i>0.00</i> 元 </span> </div>
        <form id="form" name="form" method="post" action="">
          <script type="text/javascript">clearPage = function() {PrimeFaces.ab({source:'form:j_idt82',formId:'form',process:'form:j_idt82',params:arguments[0]});}</script>
          <span id="form:dataTable">
          <div class="invest-tab">
            <ul>
              <li class="on"><span><a href="#" title="投标中">投标中 </a> </span> </li>
              <li><a href="#" title="回款中">回款中 </a> </li>
              <li><a href="#" title="已结束">已结束 </a> </li>
            </ul>
          </div>
          <div class="investnote-list">
            <div class="investnote-contitle"> <span class="investnote-w1 fb">交易时间</span> <span class="investnote-w2 fb">项目</span> <span class="investnote-w3 fb">状态</span> <span class="investnote-hbw4 fb">我的投资</span> <span class="investnote-hbw5 fb">我的收益</span> <span class="investnote-hbw6 fb">操作</span> </div>
            <ul>
              <li><span class="investnote-w1">2015-10-1</span><span class="investnote-w2">债权转让</span><span class="investnote-w3">已还款</span><span class="investnote-hbw4">12000.00</span> <span class="investnote-hbw5">12000.00</span> <span class="investnote-hbw6"><a href="#">删除</a></span></li>
              <li><span class="investnote-w1">2015-10-1</span><span class="investnote-w2">债权转让</span><span class="investnote-w3">已还款</span><span class="investnote-hbw4">12000.00</span> <span class="investnote-hbw5">12000.00</span> <span class="investnote-hbw6"><a href="#">删除</a></span></li>
              <li><span class="investnote-w1">2015-10-1</span><span class="investnote-w2">债权转让</span><span class="investnote-w3">已还款</span><span class="investnote-hbw4">12000.00</span> <span class="investnote-hbw5">12000.00</span> <span class="investnote-hbw6"><a href="#">删除</a></span></li>
              <li><span class="investnote-w1">2015-10-1</span><span class="investnote-w2">债权转让</span><span class="investnote-w3">已还款</span><span class="investnote-hbw4">12000.00</span> <span class="investnote-hbw5">12000.00</span> <span class="investnote-hbw6"><a href="#">删除</a></span></li>
              <!--<div style=" width:760px;height:200px;padding-top:100px; text-align:center;color:#d4d4d4; font-size:16px;">
								 <img src="images/nondata.png" width="60" height="60"><br><br>
								   暂无投资记录</div>-->
            </ul>
          </div>
          </span>
        </form>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>
<!-- 引入底部 -->
<%@ include file="/buttom.jsp" %>
</body>
</html>
