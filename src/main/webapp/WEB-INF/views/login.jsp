<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
				<%@ include file="variable/login_variable.jsp" %>
					<!DOCTYPE html>
					<html lang="zh">

					<head>
						<meta charset="UTF-8">
						<title>Insert title here</title>
					</head>
					<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
					<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
					<link href="h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
					<link href="h-ui/css/H-ui.login.css" rel="stylesheet" type="text/css" />
					<link href="h-ui/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
					<link href="h-ui/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
					<script type="text/javascript" src="./easyui/jquery.min.js"></script>
					<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
					<script type="text/javascript" src="h-ui/js/H-ui.js"></script>
					<script type="text/javascript" src="h-ui/lib/icheck/jquery.icheck.min.js"></script>

					<script>
						$(function () {
							//点击切换图片
							$('#vcodeImg').click(function () {
								this.src = '${pageContext.request.contextPath}/getGeneratorCoode?d=' + Math.random();
							})
						});

						$(document).ready(function () {
							$('input[type="submit"]').click(function (event) {
								console.log(event);
								
								event.preventDefault();//阻止表单默认提交
								$.ajax({
									type: 'post',
									url: '${pageContext.request.contextPath}/checkLogin',
									data: $('.form').serialize(),
									dataType: 'text',
									async: false,
									success: function (msg) {
										console.log(msg);
										
										if ('vcodeError' == msg) {
											$.messager.alert('错误', '验证码错误！', 'error');
											$('#vcodeImg').click();//切换验证码
											$('.vcode').val('');//清空验证码输入框
										} else if ('userError' == msg) {
											$.messager.alert('错误', '用户名或密码错误！', 'error');
											$('#vcodeImg').click();//切换验证码
											$('.vcode').val('');//清空验证码输入框
											$('.userPassword').val('');//清空密码输入框
											$('.userName').val('');//清空用户名输入框
										} else if ('success' == msg) {
											window.location.href = event.target.form.action;
										}
									},
									error:function(msg){
										$.messager.alert('错误', '系统异常，请稍后再试！', 'error');
										$('#vcodeImg').click();//切换验证码
										$('.vcode').val('');//清空验证码输入框
										$('.userPassword').val('');//清空密码输入框
										$('.userName').val('');//清空用户名输入框
									}
								});
							});
						});
					</script>

					<body>
						<div class="header" style="padding:0">
							<h2
								style="color:white;width:400px;height:60px;line-height: 60px;margin-left: 30px;padding: 0;">
								<spring:message code="login.title" />
							</h2>
						</div>

						<div class="loginWraper">
							<div id="loginform" class="loginBox">
								<form:form action="${pageContext.request.contextPath}/main" method="post"
									modelAttribute="user" class="form form-horizontal">
									<div class="row cl">
										<label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>
										<div class="formControls col-8">
											<form:input path="userEmail" class="input-text size-L userName"
												placeholder="${useremail}" value="" />
										</div>
									</div>
									<div class="row cl">
										<label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label>
										<div class="formControls col-8">
											<form:password path="userPassword" value=""
												class="input-text size-L userPassword" placeholder="${password}" />
										</div>
									</div>
									<div class="row cl">
										<label class="form-label col-3"><i class="Hui-iconfont">&#xe6ad;</i></label>
										<div class="formControls col-8">
											<form:input class="input-text size-L vcode" path="loginCode"
												style="width:240px;" placeholder="${vcode}" value="" />
											<img title="${vcodeChange}" id="vcodeImg"
												src="${pageContext.request.contextPath}/getGeneratorCoode" /><br>
										</div>
									</div>
									<div class="row cl">
										<div class="formControls col-8 col-offset-3">
											<input type="submit" style="width:150px;"
												class="btn btn-success radius size-L" value="${btnSubmit}">
											<input type="reset" style="width:150px; margin-left: 60px;"
												class="btn btn-danger radius size-L" value="${btnReset}">
										</div>
									</div>
								</form:form>
							</div>
						</div>
						<div class="footer">Copyright &nbsp; Koneko-consulting 2025</div>
					</body>

					</html>