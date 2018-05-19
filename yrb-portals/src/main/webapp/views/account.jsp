<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="w" uri="http://com.lixiang/ssm/page"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String ctx = request.getServletContext().getContextPath();
	application.setAttribute("ctx", ctx);
%>
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
<style type="text/css">
.ui-fileupload-choose {
	background: none;
	width: 90px;
	height: 90px;
	border: 0px none;
}

.ui-fileupload-choose input {
	width: 100%;
	height: 100%;
}

.ui-icon {
	background: none;
	width: 0px;
	height: 0px;
}
</style>
</head>
<body>
	<!-- 引入头部 -->
	<jsp:include page="/top.jsp">
		<jsp:param value="index" name="menu" />
	</jsp:include>
	<!--个人中心-->
	<div class="wrapper wbgcolor">
		<div class="w1200 personal">
			<div class="credit-ad">
				<img src="${ctx }/images/clist1.jpg" width="1200" height="96" />
			</div>
			<!-- 引入账户总览 -->
			<%@ include file="/account-pandect.jsp"%>

			<script type="text/javascript">
				//<![CDATA[
				function showSpan(op) {
					$("#updateMonbileForm\\:updateMonbileFormauthCode").val("");
					if (op == 'alert-updateEmail') {
						var bool = $("#authenticationMobile").val();
						if (bool == 'true') {
							$("#alert-main").css("display", "none");
							$("#alert-main2").css("display", "block");
						}
					}
					$("body").append("<div id='mask'></div>");
					$("#mask").addClass("mask").css("display", "block");

					$("#" + op).css("display", "block");
				}

				function displaySpan(op) {
					clearInputValue();
					$("#mask").css("display", "none");
					$("#" + op).css("display", "none");
				}

				function displaySpan2() {
					$("#mask").css("display", "none");
					$("#alert-updateEmail").css("display", "none");

					$("body").append("<div id='mask'></div>");
					$("#mask").addClass("mask").css("display", "block");

					$("#alert-checkMobile").css("display", "block");
				}
				var flag = false;
				//验证码发送消息提示
				function sCode(xhr, status, args, args2) {
					if (!args.validationFailed) {
						$("#sendCode").hide();
						$("#sendCodeGrey").show();
						/* if(flag && $("#sendCode").is(":hidden")){
							return;
						} */
						flag = true;
						var mobileNumber = $("#checkMonbileForm\\:mobileNumber")
								.val().replace(/(^\s*)|(\s*$)/g, "");
						if ("dx" == args2) {
							$("#mobileMsg7").html(
									mobileNumber.substring(0, 3) + "****"
											+ mobileNumber.substring(7, 11));
							$("#authCodeMsg7").css({
								"display" : ""
							});
							$("#authCodeMsg8").css({
								"display" : "none"
							});
						} else if ("yy" == args2) {
							$("#mobileMsg8").html(
									mobileNumber.substring(0, 3) + "****"
											+ mobileNumber.substring(7, 11));
							$("#authCodeMsg7").css({
								"display" : "none"
							});
							$("#authCodeMsg8").css({
								"display" : ""
							});
						}
						timer("sendAuthCodeBtn1", {
							"count" : 60,
							"animate" : true,
							initTextBefore : "后可重新操作",
							initTextAfter : "秒",
							callback : function() {
								$("#sendCode").show();
								$("#sendCodeGrey").hide();
								flag = false;
								$("#authCodeMsg7").css({
									"display" : "none"
								});
								$("#authCodeMsg8").css({
									"display" : "none"
								});
							}
						}).begin();
					}
				}
				//验证码发送消息提示
				function s2Code(xhr, status, args, args2) {
					if (!args.validationFailed) {
						$("#sendCode1").hide();
						$("#sendCodeGrey1").show();
						/* if(flag && $("#sendCode1").is(":hidden")){
							return;
						} */
						flag = true;
						var mobileNumber = $(
								"#updateMonbileForm\\:mobileNumber2").val()
								.replace(/(^\s*)|(\s*$)/g, "");
						if ("dx" == args2) {
							$("#mobileMsg3").html(
									mobileNumber.substring(0, 3) + "****"
											+ mobileNumber.substring(7, 11));
							$("#authCodeMsg3").css({
								"display" : ""
							});
							$("#authCodeMsg4").css({
								"display" : "none"
							});
						} else if ("yy" == args2) {
							$("#mobileMsg4").html(
									mobileNumber.substring(0, 3) + "****"
											+ mobileNumber.substring(7, 11));
							$("#authCodeMsg3").css({
								"display" : "none"
							});
							$("#authCodeMsg4").css({
								"display" : ""
							});
						}
						timer("sendAuthCodeBtn2", {
							"count" : 60,
							"animate" : true,
							initTextBefore : "后可重新操作",
							initTextAfter : "秒",
							callback : function() {
								$("#sendCode1").show();
								$("#sendCodeGrey1").hide();
								flag = false;
								$("#authCodeMsg3").css({
									"display" : "none"
								});
								$("#authCodeMsg4").css({
									"display" : "none"
								});
							}
						}).begin();
					}
				}

				//验证码发送消息提示
				function s3Code(xhr, status, args, args2) {
					if (!args.validationFailed) {
						$("#sendCode2").hide();
						$("#sendCodeGrey2").show();
						/* if(flag && $("#sendCode2").is(":hidden")){
							return;
						} */
						flag = true;
						var mobileNumber = $("#mobile").val();
						if ("dx" == args2) {
							$("#mobileMsg5").html(
									mobileNumber.substring(0, 3) + "****"
											+ mobileNumber.substring(7, 11));
							$("#authCodeMsg5").css({
								"display" : ""
							});
							$("#authCodeMsg6").css({
								"display" : "none"
							});
						} else if ("yy" == args2) {
							$("#mobileMsg6").html(
									mobileNumber.substring(0, 3) + "****"
											+ mobileNumber.substring(7, 11));
							$("#authCodeMsg5").css({
								"display" : "none"
							});
							$("#authCodeMsg6").css({
								"display" : ""
							});
						}
						timer("sendAuthCodeBtn3", {
							"count" : 60,
							"animate" : true,
							initTextBefore : "后可重新操作",
							initTextAfter : "秒",
							callback : function() {
								$("#sendCode2").show();
								$("#sendCodeGrey2").hide();
								flag = false;
								$("#authCodeMsg5").css({
									"display" : "none"
								});
								$("#authCodeMsg6").css({
									"display" : "none"
								});
							}
						}).begin();
					}
				}
				//清空验证码
				function clearValue(element) {
					$(element).val("");
				}

				function getUrlParam() {
					/* var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");	 
					var r = window.location.search.substr(1).match(reg);	 
					if (r!=null) return unescape(r[2]); 
					return null; */
					var type = ""
					return type;
				}
				function clearInputValue() {
					$("#checkMonbileForm\\:mobileNumber").val("");
					$("#checkMonbileForm\\:authCode").val("");
					$("#checkMonbileForm\\:mobileNumber_message").remove();
					$("#checkMonbileForm\\:authCode_message").remove();

					//修改手机号-验证原手机号
					$(
							"#checkOldMobileForm\\:checkOldMobileFormauthCode_message")
							.remove();
					$("#checkOldMobileForm\\:checkOldMobileFormauthCode").val(
							"");

					$("#updateMonbileForm\\:mobileNumber2").val("");
					$("#updateMonbileForm\\:updateMonbileFormauthCode").val("");
					$("#updateMonbileForm\\:mobileNumber2_message").remove();
					$("#updateMonbileForm\\:updateMonbileFormauthCode_message")
							.remove();

					$("#changeEmailForm\\:newEmail").val("");
					$("#changeEmailForm\\:changeEmailFormauthCode").val("");
					$("#changeEmailForm\\:newEmail_message").remove();
					$("#changeEmailForm\\:changeEmailFormauthCode_message")
							.remove();

					//修改密码提示消息
					$("#updatePassForm\\:oldPassword").val("");
					$("#updatePassForm\\:password").val("");
					$("#updatePassForm\\:repassword").val("");

					$("#updatePassForm\\:oldPassword_message").remove();
					$("#updatePassForm\\:password_message").remove();
					$("#repassword_message").remove();
				}
				//]]>
			</script>
			<style type="text/css">
.txt235 {
	height: 38px;
	border: 1px solid #ccc;
}
</style>
			<script type="text/javascript">
				//<![CDATA[
				$(function() {
					var type = getUrlParam();
					if (type == '2') {
						showSpan('alert-updateMobile');//绑定手机号
					} else if (type == '3') {
						showSpan('alert-activeEmail');//激活邮箱
					} else if (type == '4') {
						showSpan('alert-activeEmailMsg');//激活邮箱后提醒
					} else if (type == '5') {
						showSpan('alert-checkOldMobile');
					} else if (type == '6') {
						showSpan('alert-updateEmail');
					}
					//修改手机时，不显示原手机号
					document.getElementById("updateMonbileForm:mobileNumber2").value = '';
					//进度条样式
					if ($.browser.mozilla) {
						$("i[class='grzxbg level3']").css({
							backgroundPosition : "0px -550px",
							border : "none",
							margin : "37px 0px 0px 20px",
							height : "17px"
						});
					} else {
						$("i[class='grzxbg level3']").css({
							border : "none",
							margin : "37px 0px 0px 20px",
							height : "17px"
						});
						$("i[class='grzxbg level3']").css({
							"background-position-x" : "0px",
							"background-position-y" : "-550px"
						});
					}
					//$("#activeEmail\\:activeEmailemail").attr({"readOnly":"true"});
					"";
				});
				//]]>
			</script>
			<div class="personal-main">
				<div class="personal-zhsz">
					<h3>
						<i>账户设置</i>
					</h3>
					<div class="personal-level">
						<span class="wzd">您的账户完整度</span><i class="grzxbg level3"
							style="border: none; margin: 37px 0px 0px 20px; height: 17px; background-position: 0px -550px;"></i><span
							class="state">[中]</span> <i id="zhwzd" class="markicon fl mt35"></i><span
							class="arrow-personal">请尽快完成账户安全设置，以确保您的账户安全</span><span
							class="grzxbg icon-personal"></span>
					</div>
					<ul>
						<li><i class="grzxbg p-right"></i><span class="zhsz-span1">手机号</span><span
							class="zhsz-span2">${userInfo.phoneNum }</span><span
							class="zhsz-span3"><a href="javascript:void(0)"
								onclick="showSpan('alert-checkOldMobile')">更改</a></span></li>


						<c:if test="${userInfo.authStatus==1 }">
							<li><i class="grzxbg p-right"></i> <span class="zhsz-span1">身份认证</span>
								<span class="zhsz-span1">已认证</span></li>
						</c:if>

						<c:if test="${userInfo.authStatus!=1 }">
							<li><i class="grzxbg p-danger"></i> <span class="zhsz-span1">身份认证</span>
								<span class="zhsz-span2">未认证</span><span class="zhsz-span3"><a
									href="#" onclick="showSpan('alert-authentication')">认证</a></span></li>

						</c:if>

						<li><i class="grzxbg p-danger"></i><span class="zhsz-span1">第三方支付</span><span
							class="zhsz-span2">未开通</span><span class="zhsz-span3"><a
								href="#">开通</a></span></li>

						<li><i class="grzxbg p-right"></i> <span class="zhsz-span1">电子邮箱</span>
							<span class="zhsz-span2">${userInfo.email }</span> <span
							class="zhsz-span3"> <a href="#"
								onclick="showSpan('alert-updateEmail')">更改</a>
						</span></li>

						<li><i class="grzxbg p-right"></i><span class="zhsz-span1">登录密码</span><span
							class="zhsz-span2"></span><span class="zhsz-span3"><a
								href="javascript:void(0)" onclick="showSpan('alert-updatePass')">更改</a></span></li>
					</ul>
				</div>
			</div>
			<script type="text/javascript">
				//<![CDATA[
				//验证手机号是否为空
				function checkCheckMobileFormMoible() {
					var mobile = $("#checkMonbileForm\\:mobileNumber").val();
					var nullFlag = (mobile == "");
					if (nullFlag) {
						$("#checkMonbileForm\\:mobileNumber_message").remove();
						var $span = $("<span id=checkMonbileForm\:mobileNumber_message class=error>请输入手机号</span>");
						$("#mobileNumberErrorDiv").append($span);
						return false;
					} else {
						var mobileError = $("#mobileNumberErrorDiv").text();
						if (mobileError == '请输入手机号') {
							$("#checkMonbileForm\\:mobileNumber_message")
									.remove();
						}
					}
					return true;
				}
				//验证验证码是否为空
				function checkCheckMobileFormAuthCode() {
					var authCodeRegex = "^[0-9]{4,4}$";
					var authCode = $("#checkMonbileForm\\:authCode").val();
					var nullFlag = (authCode == "");
					if (nullFlag) {
						$("#checkMonbileForm\\:authCode_message").remove();
						var $span = $("<span id=checkMonbileForm\:authCode_message class=error>请输入验证码</span>");
						$("#authCodeErrorDiv").append($span);
						return false;
					} else {
						var authCodeError = $("#authCodeErrorDiv").text();
						if (authCodeError == '请输入验证码') {
							$("#checkMonbileForm\\:authCode_message").remove();
						}
					}
					var authCodePattern = new RegExp(authCodeRegex);
					var legalFlag = authCodePattern.test(authCode);
					if (!legalFlag) {
						$("#checkMonbileForm\\:authCode_message").remove();
						var $span = $("<span id=checkMonbileForm\:authCode_message class=error>验证码错误，请重新输入!</span>");
						$("#authCodeErrorDiv").append($span);
						return false;
					} else {
						var authCodeError = $("#authCodeErrorDiv").text();
						if (authCodeError == '请输入验证码') {
							$("#checkMonbileForm\\:authCode_message").remove();
						}
					}
					return true;
				}
				function checkMobileAll() {
					checkCheckMobileFormMoible();
					checkCheckMobileFormAuthCode();
					var mobileErrorFlag = ($("#mobileNumberErrorDiv").text().length == 0);
					var authCodeErrorFlag = ($("#authCodeErrorDiv").text().length == 0);
					return mobileErrorFlag && authCodeErrorFlag;
				}
				$(document)
						.ready(
								function() {
									var bdsjValiCodeError = $(
											"#bdsjValiCodeError").val();
									if (bdsjValiCodeError.length > 0) {
										$("#authCodeErrorDiv").html("");
										$("#updateMonbileFormauthCodeErrorDiv")
												.html("");
										var $span = $("<span id=checkMonbileForm\:authCode_message class=error>"
												+ bdsjValiCodeError + "</span>");
										if (!$("#authCodeErrorDiv").is(
												":hidden")) {
											$("#authCodeErrorDiv")
													.append($span);
										} else {
											$(
													"#updateMonbileFormauthCodeErrorDiv")
													.append($span);
										}
									}
								});
				//]]>
			</script>
			<div class="alert-450" id="alert-checkMobile" style="display: none;">
				<div class="alert-title">
					<h3>绑定手机</h3>
					<span class="alert-close"
						onclick="displaySpan('alert-checkMobile')"></span>
				</div>
				<div class="alert-main">
					<form id="checkMonbileForm" name="checkMonbileForm" method="post"
						action="#" enctype="application/x-www-form-urlencoded">
						<input type="hidden" name="checkMonbileForm"
							value="checkMonbileForm" />
						<ul>
							<li><label class="txt-name">手机号</label> <span class="txt240">
									<input id="checkMonbileForm:mobileNumber" type="text"
									name="checkMonbileForm:mobileNumber" autocomplete="off"
									value="15055100139" class="txt240" maxlength="35"
									onblur="jsf.util.chain(this,event,'return checkCheckMobileFormMoible()','mojarra.ab(this,event,\'blur\',0,0)')"
									placeholder="请输入手机号" />
							</span>
								<div id="mobileNumberErrorDiv" class="alert-error120"></div></li>
							<li><label class="txt-name">验证码</label> <input
								id="checkMonbileForm:authCode" type="text"
								name="checkMonbileForm:authCode" class="txt110" maxlength="8"
								onblur="jsf.util.chain(this,event,'return checkCheckMobileFormAuthCode()','mojarra.ab(this,event,\'blur\',0,\'@this\')')"
								placeholder="请输入验证码" /> <span id="sendCode"><a
									id="checkMonbileForm:sendAuthCodeBtn" href="#"
									onclick="jsf.util.chain(this,event,'return validateBindPhoneSMS();','PrimeFaces.ab({source:this,event:\'action\',process:\'checkMonbileForm:sendAuthCodeBtn checkMonbileForm:mobileNumber\',oncomplete:function(xhr,status,args){sCode(xhr, status, args, \'dx\');}}, arguments[1]);');return false"
									class="btn-code">免费获取校验码</a><a
									id="checkMonbileForm:sendAuthCodeBtn4" href="#"
									style="display: none;"
									onclick="mojarra.ab(this,event,'action','@this checkMonbileForm:mobileNumber',0,{'onevent':sCode2});return false"
									class="btn-code">免费获取校验码</a> </span> <span id="sendCodeGrey"
								style="display: none;"> <a href="#" id="sendAuthCodeBtn1"
									class="btn-codeAfter" style="cursor: default;">免费获取校验码</a>
							</span></li>
							<li>
								<div id="authCodeErrorDiv" class="errorplace"></div>
								<div id="authCodeMsg7" style="display: none;" class="yzmplace">
									验证码已发送到您手机<span id="mobileMsg7"></span>，如果收不到短信，请 <a
										id="checkMonbileForm:sendAuthCodeBtn11" href="#"
										style="color: blue;"
										onclick="PrimeFaces.ab({source:this,event:'action',process:'checkMonbileForm:sendAuthCodeBtn11 checkMonbileForm:mobileNumber',oncomplete:function(xhr,status,args){sCode(xhr, status, args, 'yy');}}, arguments[1]);;return false">语音获取</a>
								</div>
								<div id="authCodeMsg8" style="display: none;" class="yzmplace">
									您的手机<span id="mobileMsg8"></span>将在60秒内收到语音电话，请接听！
								</div> <input type="submit" name="checkMonbileForm:j_idt119"
								value="确　认" class="btn-ok txt-right"
								onclick="return checkMobileAll()">
							</li>
						</ul>
					</form>
				</div>
			</div>
			<script type="text/javascript">
				//<![CDATA[
			</script>
			<input id="valiCodeError" type="hidden" name="valiCodeError" />
			<div class="alert-450" id="alert-checkOldMobile"
				style="display: none;">
				<div class="alert-title">
					<h3>修改手机</h3>
					<span class="alert-close"
						onclick="displaySpan('alert-checkOldMobile')"></span>
				</div>
				<div class="alert-main">
					<form id="checkOldMobileForm" name="checkOldMobileForm"
						method="post" action="${ctx }/account/udpatePhone"
						enctype="application/x-www-form-urlencoded">
						<ul>
							<li><label class="txt-name">原手机号</label> <label
								id="checkOldMobileForm:oldMobileNumber" class="txt240">
									${userInfo.phoneNum }</label></li>
							<li><label class="txt-name">新手机号</label> <input
								id="newPhone" type="text" name="phoneNum" class="txt120"
								maxlength="11" placeholder="请输入新手机号码" /> <span id="phoneTips"></span>
								<input type="submit" name="checkOldMobileForm:j_idt129"
								value="确 认" class="btn-ok txt-right"
								onclick="return checkNewPhone()" /></li>
						</ul>


					</form>
				</div>
			</div>
			<script type="text/javascript">
				//检查手机号码
				function checkNewPhone() {

					var newPhone = $("#newPhone").val();

					var reg = /^1[35789]\d{9}$/

					if (reg.test(newPhone)) {
						return true;
					}
					$("#phoneTips").html(
							"<span style='color:red;'>号码有问题</span>");
					return false;
				}
				//获取焦点清空提示
				$("#newPhone").focus(function() {
					$("#phoneTips").html("");
				})
			</script>
			<div class="alert-450" id="alert-updateMobile" style="display: none;">
				<div class="alert-title">
					<h3>修改手机</h3>
					<span class="alert-close"
						onclick="displaySpan('alert-updateMobile')"></span>
				</div>
				<div class="alert-main">
					<form id="updateMonbileForm" name="updateMonbileForm" method="post"
						action="/user/managemyInfo"
						enctype="application/x-www-form-urlencoded">
						<input type="hidden" name="updateMonbileForm"
							value="updateMonbileForm">
						<ul>
							<li><label class="txt-name">新手机号</label> <input
								id="updateMonbileForm:mobileNumber2" type="text"
								name="updateMonbileForm:mobileNumber2" autocomplete="off"
								value="15055100139" class="txt240" maxlength="35"
								onblur="jsf.util.chain(this,event,'return checkUpdateMobileFormMoible()','mojarra.ab(this,event,\'blur\',0,0)')"
								placeholder="请输入手机号">
								<div id="mobileNumber2ErrorDiv" class="alert-error120"></div></li>
							<li><label class="txt-name">验证码</label> <input
								id="updateMonbileForm:updateMonbileFormauthCode" type="text"
								name="updateMonbileForm:updateMonbileFormauthCode"
								class="txt110" maxlength="8"
								onblur="jsf.util.chain(this,event,'return checkUpdateMonbileFormAuthCode()','mojarra.ab(this,event,\'blur\',0,\'@this\')')"
								onfocus="clearValue(this)" placeholder="请输入验证码"> <span
								id="sendCode1"><a id="updateMonbileForm:sendAuthCodeBtn"
									href="#"
									onclick="PrimeFaces.ab({source:this,event:'action',process:'updateMonbileForm:sendAuthCodeBtn updateMonbileForm:mobileNumber2',oncomplete:function(xhr,status,args){s2Code(xhr, status, args, 'dx');}}, arguments[1]);;return false"
									class="btn-code">免费获取校验码</a><a
									id="updateMonbileForm:sendAuthCodeBtn5" href="#"
									style="display: none;"
									onclick="mojarra.ab(this,event,'action','updateMonbileForm:mobileNumber2',0,{'onevent':sCode4()});return false"
									class="btn-code">免费获取校验码</a> </span> <span id="sendCodeGrey1"
								style="display: none;"> <a href="#" id="sendAuthCodeBtn2"
									class="btn-codeAfter" style="cursor: default;">免费获取校验码</a>
							</span>
								<div id="updateMonbileFormauthCodeErrorDiv"
									class="alert-error120"></div>
								<div id="authCodeMsg3" style="display: none;" class="yzmplace">
									验证码已发送到您手机<span id="mobileMsg3"></span>，如果收不到短信，请 <a
										id="updateMonbileForm:sendAuthCodeBtn9" href="#"
										style="color: blue;"
										onclick="PrimeFaces.ab({source:this,event:'action',process:'updateMonbileForm:sendAuthCodeBtn9 updateMonbileForm:mobileNumber2',oncomplete:function(xhr,status,args){s2Code(xhr, status, args, 'yy');}}, arguments[1]);;return false">语音获取</a>
								</div>
								<div id="authCodeMsg4" style="display: none;" class="yzmplace">
									您的手机<span id="mobileMsg4"></span>将在60秒内收到语音电话，请接听！
								</div></li>
							<li><span class="txt-right" style="display: none;"><i
									class="error-icon"></i><i class="error-tip">验证码错误请重新输入</i></span> <input
								type="submit" name="updateMonbileForm:j_idt139" value="确 认"
								class="btn-ok txt-right" onclick="return updateMobileAll()"></li>
						</ul>
						<input type="hidden" name="javax.faces.ViewState"
							id="javax.faces.ViewState"
							value="6247899183375709698:8256389782682127070"
							autocomplete="off">
					</form>
				</div>
			</div>
			<script type="text/javascript">
				//<![CDATA[
				//验证手机号是否为空
				function checkchangeEmailFormNewEmail() {
					var email = $("#changeEmailForm\\:newEmail").val();
					var nullFlag = (email == "");
					if (nullFlag) {
						$("#changeEmailForm\\:newEmail_message").remove();
						var $span = $("<span id=changeEmailForm\:newEmail_message class=error>请输入新邮箱</span>");
						$("#newEmailErrorDiv").append($span);
						return false;
					} else {
						var emailError = $("#newEmailErrorDiv").text();
						if (emailError == '请输入新邮箱') {
							$("#changeEmailForm\\:newEmail_message").remove();
						}
					}
					return true;
				}
				//验证验证码是否为空
				function checkchangeEmailFormAuthCode() {
					var mobile = $("#changeEmailForm\\:changeEmailFormauthCode")
							.val();
					var nullFlag = (mobile == "");
					if (nullFlag) {
						$("#changeEmailForm\\:changeEmailFormauthCode_message")
								.remove();
						var $span = $("<span id=changeEmailForm\:changeEmailFormauthCode_message class=error>请输入验证码</span>");
						$("#changeEmailFormauthCodeErrorDiv").append($span);
						return false;
					} else {
						var mobileError = $("#changeEmailFormauthCodeErrorDiv")
								.text();
						if (mobileError == '请输入验证码') {
							$(
									"#changeEmailForm\\:changeEmailFormauthCode_message")
									.remove();
						}
					}
					return true;
				}
				//验证所有
				function changeEmailFormAll() {
					checkchangeEmailFormNewEmail();
					checkchangeEmailFormAuthCode();
					var emailErrorFlag = $("#newEmailErrorDiv").text() == "";
					var authCodeErrorFlag = $(
							"#changeEmailFormauthCodeErrorDiv").text() == "";
					return emailErrorFlag && authCodeErrorFlag;
				}
				$(document)
						.ready(
								function() {
									var valiChangeEamilError = $(
											"#valiChangeEamilError").val();
									if (valiChangeEamilError.length > 0) {
										$(
												"#changeEmailForm\\:changeEmailFormauthCode_message")
												.remove();
										var $span = $("<span id=changeEmailForm\:changeEmailFormauthCode_message class=error>"
												+ valiChangeEamilError
												+ "</span>");
										$("#changeEmailFormauthCodeErrorDiv")
												.append($span);
									}
								});
				//]]>
			</script>
			<input id="valiChangCardError" type="hidden"
				name="valiChangeCardError">
			<div class="alert-500" id="alert-authentication"
				style="display: none;">
				<div class="alert-title">
					<h3>身份认证</h3>
					<span class="alert-close"
						onclick="displaySpan('alert-authentication')"></span>
				</div>
				<div class="alert-main" id="alert-main">
					<form id="changeEmailForm" name="changeEmailForm" method="post"
						action="${ctx }/account/idcardAuth"
						enctype="application/x-www-form-urlencoded">
						<input type="hidden" name="changeEmailForm"
							value="changeEmailForm" />
						<ul>


							<li><label class="txt-name">请输入手机号码</label> <input
								type="hidden" value="15055100139" id="mobile" /> <input
								id="odlPhone" type="text" name="odlPhone" class="txt235"
								maxlength="11"
								onblur="jsf.util.chain(this,event,'return checkchangeEmailFormNewEmail()','mojarra.ab(this,event,\'blur\',0,0)')"
								placeholder="请输入手机号码" /><span id="PhoneNunTips"></span></li>

							<li><label class="txt-name">请输入真实姓名</label> <input
								type="hidden" value="15055100139" id="mobile" /> <input
								id="newName" type="text" name="newName" class="txt235"
								onblur="jsf.util.chain(this,event,'return checkchangeEmailFormNewEmail()','mojarra.ab(this,event,\'blur\',0,0)')"
								placeholder="请输入真实姓名" /><span id="nameTips"></span></li>

							<li><label class="txt-name">请输入身份证号码</label> <input
								type="hidden" value="15055100139" id="mobile" /> <input
								id="newCard" type="text" name="newCard" class="txt235"
								maxlength="18"
								onblur="jsf.util.chain(this,event,'return checkchangeEmailFormNewEmail()','mojarra.ab(this,event,\'blur\',0,0)')"
								placeholder="请输入身份证号码" /><span id="cardTips"></span> <input
								type="submit" name="changeEmailForm:j_idt150" value="确　认"
								class="btn-ok txt-right" onclick="return checkIdCard();" /></li>
						</ul>
						<input type="hidden" name="javax.faces.ViewState"
							id="javax.faces.ViewState"
							value="6247899183375709698:8256389782682127070"
							autocomplete="off" />
					</form>
				</div>
				<script type="text/javascript">
					//检查手身份证
					function checkIdCard() {
						var result = true;
						//1.校验手机号码
						var odlPhone = $("#odlPhone").val();
						var reg = /^1[35789]\d{9}$/
						if (!reg.test(odlPhone)) {
							$("#PhoneNunTips").html(
									"<span style='color:red;'>手机号码有误</span>");
							result = false;
						}

						//2,校验姓名

						var newName = $("#newName").val();
						var reg = /^[\u4E00-\u9FA5A-Za-z]+$/
						if (!reg.test(newName)) {
							$("#nameTips").html(
									"<span style='color:red;'>真实姓名有误</span>");
							result = false;
						}

						//3.校验身份证

						var newCard = $("#newCard").val();
						var reg = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/
						if (!reg.test(newCard)) {
							$("#cardTips").html(
									"<span style='color:red;'>身份证号码有误</span>");
							result = false;
						}

						return result;
					}
					//获取焦点清空提示
					$("#odlPhone").focus(function() {
						$("#phoneNumTips").html("");
					})

					//]]>
				</script>
				<div class="alert-main" id="alert-main2"
					style="display: none; text-align: center;">
					<div class="about-con">
						<ul>
							<li><br> <span style="margin-left: 80px;">请您先完成手机绑定，再进行邮箱更改！</span></li>
							<li><input type="submit" name="j_idt153" value="确认"
								style="margin: 20px 0 20px 80px;" class="btn-ok txt-right2"
								onclick="displaySpan2()"></li>
						</ul>
					</div>
				</div>
			</div>
			<input id="valiChangeEamilError" type="hidden"
				name="valiChangeEamilError" />


			<div class="alert-450" id="alert-updateEmail" style="display: none;">
				<div class="alert-title">
					<h3>修改邮箱</h3>
					<span class="alert-close"
						onclick="displaySpan('alert-updateEmail')"></span>
				</div>
				<%-- method="post" action="${ctx }/account/udpatePhone" --%>
				<div class="alert-main" id="alert-main">
					<form id="changeEmailForm" name="changeEmailForm" method="post"
						action="${ctx }/account/emailAddress"
						enctype="application/x-www-form-urlencoded">
						<ul>
							<li><label class="txt-name">请输入旧邮箱地址</label> <label
								id="changeEmailForm:newEmail" class="txt235">
									${userInfo.email }</label></li>
							<li><label class="txt-name">请输入新邮箱</label> <input
								id="newEmail" type="text" name="newEmail" class="txt235"
								placeholder="请输入新邮箱" /> <span id="emailTips"></span> <input
								type="submit" name="changeEmailForm:j_idt150" value="确　认"
								class="btn-ok txt-right" onclick="return checkNewEmail();" /></li>
						</ul>
					</form>
				</div>
				<div class="alert-main" id="alert-main2"
					style="display: none; text-align: center;">
					<div class="about-con">
						<ul>
							<li><br> <span style="margin-left: 80px;">请您先完成手机绑定，再进行邮箱更改！</span></li>
							<li><input type="submit" name="j_idt153" value="确认"
								style="margin: 20px 0 20px 80px;" class="btn-ok txt-right2"
								onclick="displaySpan2()"></li>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				//检查email邮箱
				function checkNewEmail() {
					var newEmail = $("#newEmail").val();
					//email正则格式

					var reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
					//email没有错直接返回true
					if (reg.test(newEmail)) {
						return true;

					}
					//有错返回false并且请示email有问题
					$("#emailTips").html(
							"<span style='color:red;'>Email有问题</spen>")
					return false;
				}
				//获取焦点清空提示
				$("#newEmail").focus(function() {
					$("#emailTips").html("");

				})
				
				//]]>
			</script>
			<div class="alert-450" id="alert-bandingEmail" style="display: none;">
				<div class="alert-title">
					<h3>绑定邮箱</h3>
					<span class="alert-close"
						onclick="displaySpan('alert-bandingEmail')"></span>
				</div>
				<div class="alert-main">
					<form id="bandingEmail" name="bandingEmail" method="post" action=""
						enctype="application/x-www-form-urlencoded">
						<ul>
							<li><label class="txt-name">绑定邮箱</label> <input
								id="bandingEmail:bandingEmailemail" type="text"
								name="bandingEmail:bandingEmailemail" value="348705622@qq.com"
								class="txt235"
								onblur="jsf.util.chain(this,event,'return checkbandingEmailFormEmail()','mojarra.ab(this,event,\'blur\',0,0)')"
								placeholder="请输入邮箱">
								<div id="bandingEmailemailErrorDiv" class="alert-error120"></div></li>
							<input type="submit" name="bandingEmail:j_idt158" value="确认并激活邮箱"
								class="btn-ok txt-right" onclick="return bandingEmailAll()">
						</ul>
					</form>
				</div>
			</div>
			<div class="alert-450" id="alert-activeEmail" style="display: none;">
				<div class="alert-title">
					<h3>激活邮箱</h3>
					<span class="alert-close"
						onclick="displaySpan('alert-activeEmail')"></span>
				</div>
				<div class="alert-main">
					<form id="activeEmail" name="activeEmail" method="post" action=""
						enctype="application/x-www-form-urlencoded">
						<ul>
							<li><label class="txt-name">邮箱</label> <input
								id="activeEmail:activeEmailemail" type="text"
								name="activeEmail:activeEmailemail" value="${userInfo }"
								class="txt235"
								onblur="jsf.util.chain(this,event,'return checkactiveEmailFormEmail()','mojarra.ab(this,event,\'blur\',0,0)')">
								<div id="activeEmailemailErrorDiv" class="alert-error120"></div></li>
							<input type="submit" name="activeEmail:j_idt163" value="立即激活邮箱"
								class="btn-ok txt-right" onclick="return checkActiveEmailAll()">
						</ul>
					</form>
				</div>
			</div>
			<div class="alert-450 alert-h220" id="alert-activeEmailMsg"
				style="display: none;">
				<div class="alert-title">
					<h3>激活邮箱</h3>
					<span class="alert-close"
						onclick="displaySpan('alert-activeEmailMsg')"></span>
				</div>
				<div class="alert-main">
					<form id="activeEmailMsg" name="activeEmailMsg" method="post"
						action="" enctype="application/x-www-form-urlencoded"
						target="_blank">
						<input type="hidden" name="activeEmailMsg" value="activeEmailMsg">
						<p class="msg5" style="margin-top: 0;">
							我们已经向您的注册邮箱发送了一封验证邮件<br> 验证邮件有效期为<i class="c-red">24小时</i>，请及时查收。
						</p>
						<p class="msg-a">
							<input type="submit" name="activeEmailMsg:j_idt167" value="立即验证"
								class="btn-ok btn-145">
						</p>
					</form>
				</div>
			</div>
					
			<div class="alert-450" id="alert-updatePass" style="display: none;">
				<div class="alert-title">
					<h3>修改密码</h3>
					<span class="alert-close" onclick="displaySpan('alert-updatePass')"></span>
				</div>
				<div class="alert-main">
					<form id="updatePassForm" name="updatePassForm" method="post"
						action="${ctx }/account/passwordAuth"
						enctype="application/x-www-form-urlencoded">
						<input type="hidden" name="updatePassForm" value="updatePassForm">
						<ul>
							<li><label class="txt-name">请输入原密码</label> <input
								id="laoPassword" type="password" name="laoPassword" value=""
								maxlength="20"
								onblur="jsf.util.chain(this,event,'return checkupdatePassFormOldPassword()','mojarra.ab(this,event,\'blur\',0,0)')"
								class="txt235" placeholder="请输入原密码" /><span id="passwordTips"></span>
								<div id="oldPasswordErrorDiv" class="alert-error120"></div></li>
							<li><label class="txt-name">请输入新密码</label> <input
								id="newPassword" type="password" name="newPassword" value=""
								maxlength="20"
								onblur="jsf.util.chain(this,event,'return checkPassword()','mojarra.ab(this,event,\'blur\',0,0)')"
								class="txt235" placeholder="请输入新密码" /><span
								id="newpasswordTips"></span>
								<div id="passwordErrorDiv" class="alert-error120"></div></li>
							<li><label class="txt-name">请确认新密码</label> <input
								id="rePassword" type="password" name="password" value=""
								maxlength="20" onblur="return checkRepassword()" class="txt235"
								placeholder="请输入新密码" /><span id="repasswordTips"></span>
								<div id="repasswordErrorDiv" class="alert-error120"></div></li>
							<li><input type="submit" name="updatePassForm:j_idt174"
								value="确 认" class="btn-ok btn-235 txt-right"
								onclick="return checkNewPassword()" /></li>
						</ul>
					</form>
				</div>
				<script type="text/javascript">
					function checkNewPassword() {
						var result = true;
						//1.校验原始密码
						var laoPassword = $("#laoPassword").val();
						var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{4,21}$/
						if (!reg.test(laoPassword)) {
							$("#passwordTips").html(
									"<span style='color:red;'>密码输入有误</span>");
							result = false;
						}
						//2,校验新密码
						var newPassword = $("#newPassword").val();
						var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,21}$/
						if (!reg.test(newPassword)) {
							$("#newpasswordTips").html(
									"<span style='color:red;'>密码输入有误</span>");
							result = false;
						}

						//3.校验与新密码是否一致

						var rePassword = $("#rePassword").val();
						var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,21}$/
						if (newPassword != rePassword) {
							$("#repasswordTips")(
									"<span style='color:red;'>密码不一致</span>");
							result = false;
						}

						return result;
					}
					//获取焦点清空提示
					$("#laoPassword").focus(function() {
						$("#passwordTips").html("");
					})
					//获取焦点清空提示
					$("#newPassword").focus(function() {
						$("#newpasswordTips").html("");
					})
					//获取焦点清空提示
					$("#rePassword").focus(function() {
						$("#repasswordTips").html("");
					})
				</script>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- 引入底部 -->
	<%@ include file="/buttom.jsp"%>
	<%@ include file="/tip.jsp"%>

</body>
</html>
