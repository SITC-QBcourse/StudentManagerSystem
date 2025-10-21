<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
				<%@ include file="variable/login_variable.jsp" %>
					<%@ include file="common/common.jsp" %>
						<!DOCTYPE html>
						<html lang="zh">
						<head>
							<meta charset="UTF-8">
							<title>
								<spring:message code="project.title" />
							</title>
							<link rel="Shortcut Icon" type="image/x-icon" href="<c:url value='/favicon_v2.ico' />">
						</head>
						<script>
							const i18n = {
								title: '<spring:message code="login.ajax.title" />',
								server_content: '<spring:message code="login.ajax.serverError.content" />',
								vcode_content: '<spring:message code="login.ajax.vcodeError.content" />',
								user_content: '<spring:message code="login.ajax.userError.content" />'
							}
							$(function () {
								//点击切换图片
								$('#vcodeImg').click(function () {
									$(this).attr('src','${pageContext.request.contextPath}/getGeneratorCoode?d=' + Math.random());
								})
							});
							$(document).ready(function () {
								$('input[type="submit"]').click(function (event) {
									event.preventDefault();//阻止表单默认提交
									if('' === $('.userEmail').val().trim()){
										$.messager.alert(i18n.title, i18n.user_content, 'error');
										return;
									}
									if('' === $('.vcode').val().trim()){
										$.messager.alert(i18n.title, i18n.vcode_content, 'error');
										return;
									}
									if('' === $('.userPassword').val().trim()){
										$.messager.alert(i18n.title, i18n.user_content, 'error');
										return;
									}
									$.ajax({
										type: 'post',
										url: '${pageContext.request.contextPath}/checkLogin',
										data: $('form').serialize(),
										dataType: 'text',
										async: false,
										success: function (msg) {
											if ('vcodeError' === msg) {
												$.messager.alert(i18n.title, i18n.vcode_content, 'error');
												$('#vcodeImg').click();//切换验证码
												$('.vcode').val('');//清空验证码输入框
											} else if ('userError' === msg) {
												$.messager.alert(i18n.title, i18n.user_content, 'error');
												$('#vcodeImg').click();//切换验证码
												$('.vcode').val('');//清空验证码输入框
												$('.userPassword').val('');//清空密码输入框
												$('.userName').val('');//清空用户名输入框
											} else if ('success' === msg) {
												window.location.href = '${pageContext.request.contextPath}/main';
											}
										},
										error: function (msg) {
											$.messager.alert(i18n.title, i18n.server_content, 'error');
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
									<spring:message code="project.title" />
								</h2>
							</div>

							<div class="loginWraper">
								<div id="loginform" class="loginBox">
									<form:form action="${pageContext.request.contextPath}/checkLogin" method="post"
										modelAttribute="user" class="form form-horizontal">
										<div class="row cl">
											<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
											<div class="formControls col-xs-8">
												<form:input path="userEmail" class="input-text radius size-L userEmail"
													placeholder="${useremail}" value="" />
											</div>
										</div>
										<div class="row cl">
											<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
											<div class="formControls col-xs-8">
												<form:password path="userPassword" value=""
													class="input-text radius size-L userPassword"
													placeholder="${password}" />
											</div>
										</div>
										<div class="row cl">
											<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe6ad;</i></label>
											<div class="formControls col-xs-8">
												<form:input class="input-text radius size-L vcode" path="loginCode"
													style="width:240px;" placeholder="${vcode}" value="" />
												<img title="${vcodeChange}" id="vcodeImg" class="radius"
													src="${pageContext.request.contextPath}/getGeneratorCoode" /><br>
											</div>
										</div>
										<div class="row cl">
											<div class="formControls col-xs-8 col-offset-3">
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