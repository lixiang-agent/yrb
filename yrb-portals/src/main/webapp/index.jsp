<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/common.css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<style>
/*上下滚动*/
#scrollDiv {
	width: 400px;
	height: 30px;
	line-height: 30px;
	overflow: hidden;
}
#scrollDiv li {
	height: 30px;
	padding-left: 10px;
}
</style>
<script type="text/javascript">
// 上下滚动
function AutoScroll(obj) {
    $(obj).find("ul:first").animate({
        marginTop: "-25px"
    },
    500,
    function() {
        $(this).css({
            marginTop: "0px"
        }).find("li:first").appendTo(this);
    });
}
$(document).ready(function() {
    var myar = setInterval('AutoScroll("#scrollDiv")', 3000);
    $("#scrollDiv").hover(function() {
        clearInterval(myar);
    },
    function() {
        myar = setInterval('AutoScroll("#scrollDiv")', 3000)
    }); //当鼠标放上去的时候，滚动停止，鼠标离开的时候滚动开始
});


</script>
</head>
<body>
<!-- 引入头部 -->
<jsp:include page="/top.jsp">
	<jsp:param value="index" name="menu"/>
</jsp:include>
<!--banner-->
<div class="flexslider">
  <ul class="slides">
    <li style="background-image: url(images/banner.jpg); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="#" target="_blank"></a></li>
    <li style="background-image: url(images/banner.jpg); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="#" target="_blank"></a></li>
    <li style="background-image: url(images/banner.jpg); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="#" target="_blank"></a></li>
    <li style="background-image: url(images/banner.jpg); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="# " target="_blank"></a></li>
    <li style="background-image: url(images/banner.jpg); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="#" target="_blank"></a></li>
  </ul>
</div>
<script src="script/jquery.flexslider-min.js"></script>
<script>
$(function(){
    $('.flexslider').flexslider({
        directionNav: true,
        pauseOnAction: false
    });
    //产品列表滚动
    var pLength = $('.pListContentBox > li').length;
    var cishu = pLength-4;
    var n = 0;
    $('.pListContentBox').css({'width':pLength*245+'px'});
    if(pLength>4){
        $('.pListRight').addClass('curr');
    }
    $('.pListRight').on('click',function(){
        if(cishu>0){
            //alert('1');
            n++;
            cishu--;
            $('.pListContentBox').animate({'left':'-'+n*244+'px'},500);
            if(cishu==0){
                $('.pListRight').removeClass('curr');
            }
            if(n>0){
                $('.pListLeft').addClass('curr');
            }
        }
    });
    $('.pListLeft').on('click',function(){
        if(n>0){
            n--;
            cishu++;
            $('.pListContentBox').animate({'left':'-'+n*244+'px'},500);
            if(n==0){
                $('.pListLeft').removeClass('curr');
            }
            if(cishu>0){
                $('.pListRight').addClass('curr');
            }
        }
    });
    //alert(pLength);
});
</script>
<!--注册登陆模块-->
<!--<div class="login_float">
  <div class="index_login">
    <div class="login_name">亿人宝年化收益率</div>
    <div class="login_num">10<font>%</font>~17<font>%</font></div>
    <div class="login_info"> <span class="login_info1"><font>3~4倍</font>定期存款收益</span> <span class="login_info2"><font>30倍</font>活期存款收益</span> </div>
    <div class="clear"></div>
    <div class="login_btn"><a href="register.html">立即注册</a></div>
    <p class="login_reg">已有账号，<a href="login.html">立即登录</a></p>
  </div>
</div>-->
<script type="text/javascript">
var gaintop;
$(function(){
	gaintop = $(".login_float").css("top");
	$(".login_float").css("top",-695);
	$(".login_float").show();
	$(".login_float").animate({top: gaintop,opacity:1},800);
    $(".login_float").animate({top: '-=12px',opacity:1},200);
    $(".login_float").animate({top: gaintop,opacity:1},200);
    $(".login_float").animate({top: '-=6px',opacity:1},200);
    $(".login_float").animate({top: gaintop,opacity:1},200);
    $(".login_float").animate({top: '-=2px',opacity:1},100);
    $(".login_float").animate({top: gaintop,opacity:1},100);
});

</script>
<div class="new-announcement">
  <div class="new-announcement-title">最新公告</div>
  <div class="new-announcement-content">
    <div id="scrollDiv">
      <ul style="margin-top: 0px;">
      <c:forEach items="${newsMap}" var="news">
      	<li><a class="black-link" href="公司公告详细.html" target="_blank"> ${news.value.title}</a></li>
      </c:forEach>
      </ul>
    </div>
  </div>
  <a class="more" href="#">更多</a> </div>
<div class="ipubs"><span class="o1">累计投资金额:<strong>1,047,288,128.79</strong>元</span> <span class="o2">已还本息:<strong>400,507,750.81</strong>元</span><span class="o2">余额:<strong>677,679,983.07</strong>元</span><span class="o4">注册人数:<strong>20649</strong>人</span></div>
<div class="feature"> <a class="fea1" href="#"> <i></i>
  <h3>高收益</h3>
  <span>年化收益率最高达“20%<br>
  50元起投，助您轻松获收益</span> </a> <a class="fea2" href="#"> <i></i>
  <h3>安全理财</h3>
  <span>100%本息保障<br>
  实物质押，多重风控审核</span> </a> <a class="fea3" href="#"> <i></i>
  <h3>随时赎回</h3>
  <span>两步赎回您的资金<br>
  最快当日到账</span> </a> <a class="fea4" href="#"> <i></i>
  <h3>随时随地理财</h3>
  <span>下载手机客户端<br>
  随时随地轻松理财</span> </a> </div>
<!--中间内容-->
<div class="main clearfix mrt30" data-target="sideMenu">
  <div class="wrap">
    <div class="page-left fn-left">
      <div class="mod-borrow">
        <div class="hd">
          <h2 class="pngbg"><i class="icon icon-ttyx"></i>推荐项目</h2>
          <div class="fn-right f14 c-888">常规发标时间每天<span class="c-555">10:00，13:00和20:00</span>，其余时间根据需要随机发</div>
        </div>
        <div class="bd">
          <div class="des"><span class="fn-left">期限1-29天，期限短，收益见效快</span><a href="${ctx}/invProject/list" class="fn-right">查看更多&gt;&gt;</a></div>
          <div class="borrow-list">
            <ul>
            <c:forEach items="${projectsMap}" var="projects" begin="1" end="2">
            	<li>
      			<div class="title"><a href="infor.html" target="_blank"><i class="icon icon-zhai" title="债权贷"></i></a><a href="infor.html" class="f18" title="${projects.projectName}" target="_blank">${projects.projectName}</a></div>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="260">借款金额<span class="f24 c-333">${projects.invTotbalance}</span>元</td>
                      <td width="165">年利率<span class="f24 c-333">${projects.rate}</span></td>
                      <td width="180" align="center">期限<span class="f24 c-orange">${projects.paybackTime}</span>天</td>
                      <td><div class="circle">
                          <div class="left progress-bar">
                            <div class="progress-bgPic progress-bfb5">
                              <div class="show-bar"><fmt:formatNumber value="0.56" type="number" pattern="0.0%" /></div>
                            </div>
                          </div>
                        </div></td>
                      <td align="right"><a class="ui-btn btn-gray" href="#">去投资</a> </td>
                    </tr>
                  </tbody>
                </table>
                </li>
      		</c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod-borrow mrt20">
        <div class="hd">
          <h2 class="pngbg"><i class="icon icon-yyyz"></i>车易贷</h2>
          <div class="fn-right f14 c-888">参与人次：<span class="c-555">61.37万次</span>&nbsp;&nbsp;&nbsp;平均满标时间：<span class="c-555">1小时24分11秒</span> </div>
        </div>
        <div class="bd">
          <div class="des"><span class="fn-left">期限1-12月，收益更高</span><a href="${ctx}/invProject/list" class="fn-right">查看更多&gt;&gt;</a></div>
          <div class="borrow-list">
            <ul>
            <c:forEach items="${projectsMap}" var="projectCar" begin="3" end="4">
            <li>
                <div class="title"><a href="#" target="_blank"><i class="icon icon-che" title="车易贷"></i></a><a href="infor.html" class="f18" title="${projectCar.projectName}" target="_blank">${projectCar.projectName}</a></div>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="260">借款金额<span class="f24 c-333">${projectCar.invTotbalance}</span>元</td>
                      <td width="165">年利率<span class="f24 c-orange relative">${projectCar.rate}</span></td>
                      <td width="180" align="center">期限<span class="f24 c-333">${projectCar.paybackTime}</span>个月</td>
                      <td><div class="circle">
                          <div class="left progress-bar">
                            <div class="progress-bgPic progress-bfb10">
                              <div class="show-bar"> 100% </div>
                            </div>
                          </div>
                        </div></td>
                      <td align="right"><a class="ui-btn btn-gray" href="#">去投资</a> </td>
                    </tr>
                  </tbody>
                </table>
              </li>
      		</c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod-borrow mrt20">
        <div class="hd">
          <h2 class="pngbg"><i class="icon icon-nnyy"></i>房易贷</h2>
          <div class="fn-right f14 c-888">参与人次：<span class="c-555">8.35万次</span>&nbsp;&nbsp;&nbsp;平均满标时间：<span class="c-555">1小时41分19秒</span> </div>
        </div>
        <div class="bd">
          <div class="des"> <span class="fn-left">期限12-60月，打理更加容易</span><a href="${ctx}/invProject/list" class="fn-right">查看更多&gt;&gt;</a></div>
          <div class="borrow-list">
            <ul>
            <c:forEach items="${projectsMap}" var="projectHouse" begin="5" end="6">
            <li>
                <div class="title"><a href="#" target="_blank"><i class="icon icon-fang" title="房易贷"></i></a><a href="infor.html" class="f18" title="${projectHouse.projectName}" target="_blank">${projectHouse.projectName}</a></div>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="260">借款金额<span class="f24 c-333">${projectHouse.invTotbalance}</span>元</td>
                      <td width="165">年利率<span class="f24 c-orange relative">${projectHouse.rate}</span></td>
                      <td width="180" align="center">期限<span class="f24 c-333">${projectHouse.paybackTime}</span>个月</td>
                      <td><div class="circle">
                          <div class="left progress-bar">
                            <div class="progress-bgPic progress-bfb10">
                              <div class="show-bar"> 100% </div>
                            </div>
                          </div>
                        </div></td>
                      <td align="right"><a class="ui-btn btn-gray" href="#">去投资</a> </td>
                    </tr>
                  </tbody>
                </table>
              </li>
      		</c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod-borrow mrt20">
        <div class="hd">
          <h2 class="pngbg"><i class="icon icon-ssbx"></i>债权转让</h2>
          <div class="fn-right f14 c-888">参与人次：<span class="c-555">8.06万次</span> &nbsp;&nbsp;&nbsp;平均转让用时：<span class="c-555">03小时06分22秒</span> </div>
        </div>
        <div class="bd">
          <div class="des"><span class="fl">其他投资人折价转让，转让项目会随时更新，惊喜不断</span><a href="${ctx}/invProject/list" class="fn-right">查看更多&gt;&gt;</a></div>
          <div class="borrow-list">
            <ul>
            <c:forEach items="${projectsMap}" var="projectObligation" begin="7" end="8">
            <li>
            <div class="title"><a href="infor.html" target="_blank"><i class="icon icon-zhai" title="债权转让"></i></a><a href="infor.html" title="${projectObligation.projectName}" class="f18" target="_blank">${projectObligation.projectName}</a></div>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="260">借款金额<span class="f24 c-333">${projectObligation.invTotbalance}</span>元</td>
                      <td width="200">预期收益率<span class="f24"><a href="javascript:;" class="tx-line c-orange" onClick="showCalculator(this,12.42,84890,10068.17)" title="点击查看纯收益率">${projectObligation.rate}</a></span></td>
                      <td width="180" align="center">期限<span class="f24 c-333">${projectObligation.paybackTime}</span>个月</td>
                      <td><div class="circle">
                          <div class="left progress-bar">
                            <div class="progress-bgPic progress-bfb10">
                              <div class="show-bar"> 100% </div>
                            </div>
                          </div>
                        </div></td>
                      <td align="right"><a class="ui-btn btn-gray" href="#">去投资</a> </td>
                    </tr>
                  </tbody>
                </table>
              </li>
      		</c:forEach>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="page-right fn-right" style="top: 0px;">
      <div class="mod-risk-tip"><i class="icon icon-tip"></i><a href="/bxbz/index.html" class="c-orange">收益与风险并存，请理性选择平台</a></div>
      <div class="mod mod-notice mrt20">
        <div class="hd">
          <h3>网站公告</h3>
          <a href="/gonggao/news/index.html" class="fn-right">更多&gt;</a></div>
        <div class="bd">
          <div class="article-list clearfix">
            <ul>
            <c:forEach items="${newsMap}" var="news">
      			<li><a href="#" title="${news.value.title}">${news.value.title}</a><span class="date"><fmt:formatDate value="${news.value.publishDate}" pattern="MM-dd"/></span></li>
      		</c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod mod-rank clearfix ui-tab mrt20">
        <div class="hd">
          <h3>排行榜</h3>
          <div class="ui-tab-nav"> <i class="icon icon-cur"></i>
            <ul>
              <li class="active"><a href="#">收益</a></li>
              <li><a href="#">投资</a></li>
            </ul>
            <a href="#" class="fn-right">更多&gt;</a> </div>
        </div>
        <div class="bd">
          <div class="ui-tab-cont">
            <div class="ui-tab-item active">
              <ul class="rank-list">
                <li><span class="fl"><em class="n1">01</em>gz******</span><span class="fr">￥1,115,461.07</span></li>
                <li><span class="fl"><em class="n2">02</em>米克******</span><span class="fr">￥1,003,890.04</span></li>
                <li><span class="fl"><em class="n3">03</em>灵儿******</span><span class="fr">￥895,618.71</span></li>
                <li><span class="fl"><em class="n4">04</em>li******</span><span class="fr">￥795,154.06</span></li>
                <li><span class="fl"><em class="n5">05</em>豆芽******</span><span class="fr">￥747,154.44</span></li>
              </ul>
            </div>
            <div class="ui-tab-item">
              <ul class="rank-list">
                <li><span class="fl"><em class="n1">01</em>黄世******</span><span class="fr">￥78,714,974.00</span></li>
                <li><span class="fl"><em class="n2">02</em>一诺******</span><span class="fr">￥58,428,720.00</span></li>
                <li><span class="fl"><em class="n3">03</em>hj******</span><span class="fr">￥57,844,191.00</span></li>
                <li><span class="fl"><em class="n4">04</em>老马******</span><span class="fr">￥38,808,064.00</span></li>
                <li><span class="fl"><em class="n5">05</em>写意******</span><span class="fr">￥31,341,159.00</span></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="mod mod-report ui-tab clearfix mrt20">
        <div class="hd">
          <div class="ui-tab-nav"> <i class="icon icon-cur"></i>
            <ul>
              <li class="active"><a href="javascript:;">媒体报道</a></li>
              <li class=""><a href="javascript:;">理财知识</a></li>
            </ul>
          </div>
        </div>
        <div class="bd">
          <div class="ui-tab-cont">
            <div class="ui-tab-item active">
                <ul>
                  <c:forEach items="${newsMap}" var="news">
      				 <li><a href="#" title="${news.value.title}" target="_blank">${news.value.title}</a></li>
      			</c:forEach>
                </ul>
              </div>
            </div>
            <div class="ui-tab-item">
              <div class="article-list">
                <ul>
                <c:forEach items="${newsMap}" var="news">
      				 <li><a href="#" title="${news.value.title}" target="_blank">${news.value.title}</a></li>
      			</c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="mrt20 mod"> <a href="#"><img src="images/pic_home_js.jpg" width="300" height="80" alt="收益计算器" class="pic"></a></div>
    </div>
  </div>
</div>
<script src="script/index.js"></script>
<div class="partners wrap clearfix mrb30">
  <div class="partners-inner ui-tab">
    <div class="hd">
      <div class="ui-tab-nav"> <i class="icon icon-cur" style="left: 151px;"></i>
        <ul>
          <li class=""><a href="#">合作机构</a></li>
          <li class="active"><a href="#">友情链接</a></li>
        </ul>
      </div>
    </div>
    <div class="bd">
      <div class="ui-tab-cont">
        <div class="ui-tab-item active">
          <div class="img-scroll">
            <div class="container">
              <ul>
                <li><img src="images/logo_sbcvc.png" width="152" height="52" alt="软银"></li>
                <li><img src="images/logo_abc.png" width="152" height="52" alt="农业银行"></li>
                <li><img src="images/logo_wdzj.png" width="152" height="52" alt="网贷之家"></li>
                <li><img src="images/logo_baidu.png" width="152" height="52" alt="百度"></li>
                <li><img src="images/logo_aqb.png" width="152" height="52" alt="安全宝"></li>
                <li><img src="images/logo_gds.png" width="152" height="52" alt="万国数据"></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="ui-tab-item">
          <div class="links"> <a target="_blank" href="http://www.wd361.com">网贷互联</a> <a target="_blank" href="http://www.bjzq.com.cn">北京证券网</a> <a target="_blank" href="http://v.yidai.com/">易贷微理财</a> <a target="_blank" href="http://www.wangdaicaifu.com">P2P</a> <a target="_blank" href="http://www.p2pchina.com">网贷中国</a> <a target="_blank" href="http://www.wangdaibangshou.com">网贷帮手</a> <a target="_blank" href="https://www.okcoin.cn">比特币网</a> <a target="_blank" href="http://www.p2p110.com">网贷110</a> <a target="_blank" href="http://www.zcmall.com">招财猫理财</a> </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 引入底部 -->
<%@ include file="/buttom.jsp" %>
</body>
</html>
