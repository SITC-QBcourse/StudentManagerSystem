<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
				<%@ include file="common/common.jsp" %>
					<!DOCTYPE html>
					<html lang="zh">

					<head>
						<meta charset="UTF-8">
						<title>
							<spring:message code="project.title" />
						</title>
					</head>
					<body>
						<c:set var="privilegeKey" value="userPrivilege.${loginUser.userPrivilege}" />
						<header class="navbar-wrapper">
							<div class="navbar navbar-fixed-top">
								<div class="container-fluid cl">
									<a href="${pageContext.request.contextPath}/main"
										class="logo navbar-logo f-l mr-10 hidden-xs">
										<spring:message code="project.title" />
									</a>
									<a href="${pageContext.request.contextPath}/main"
										class="logo navbar-logo-m f-l mr-10 visible-xs">YMH</a>
									<span class="logo navbar-slogan f-l mr-10 hidden-xs">V1.0</span>
									<a aria-hidden="false" href="javascript:;" class="nav-toggle visible-xs"><i
											class="hui-iconfont">&#xe667;</i></a>
									<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
										<ul class="cl" id="user_privilege_name">
											<li>
												<spring:message code="${privilegeKey}" />
											</li>
											<li class="dropDown dropDown_hover">
												<a href="javascript:;" class="dropDown_A">
													<c:if test="${loginUser.userPrivilege == 0}">
														<c:out value="${loginUser.userName}" /><i
															class="Hui-iconfont">&#xe6d5;</i>
													</c:if>
												</a>
												<a href="javascript:;" class="dropDown_A">
													<c:if test="${loginUser.userPrivilege == 1}">
														<c:out value="${loginUser.userName}" /><i
															class="Hui-iconfont">&#xe6d5;</i>
													</c:if>
												</a>
												<a href="javascript:;" class="dropDown_A">
													<c:if test="${loginUser.userPrivilege == 2}">
														<c:out value="${loginUser.userName}" /><i
															class="Hui-iconfont">&#xe6d5;</i>
													</c:if>
												</a>
												<a href="javascript:;" class="dropDown_A">
													<c:if test="${loginUser.userPrivilege == 3}">
														<c:out value="${loginUser.userName}" /><i
															class="Hui-iconfont">&#xe6d5;</i>
													</c:if>
												</a>
												<ul class="dropDown-menu menu radius box-shadow">
													<li><a href="${pageContext.request.contextPath}/logout"
															onclick="window.location.reload();">
															<spring:message code="main.logout" />
														</a></li>
												</ul>
											<li id="Hui-msg"><a href="#" title="消息"><span
														class="badge badge-danger">8</span><i class="Hui-iconfont"
														style="font-size:18px">&#xe68a;</i></a></li>
											<li id="Hui-skin" class="dropDown right dropDown_hover"><a
													href="javascript:;" class="dropDown_A" title="换肤"><i
														class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
												<ul class="dropDown-menu menu radius box-shadow">
													<li><a href="javascript:;" data-val="default"
															title="默认（黑色）">默认（黑色）</a></li>
													<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
													</li>
													<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
													<li><a href="javascript:;" data-val="red" title="红色">红色</a>
													</li>
													<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
													<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
												</ul>
											</li>
											</li>
										</ul>
									</nav>
								</div>
							</div>

						</header>
						<aside class="Hui-aside">
							<div class="menu_dropdown bk_2">
								<dl id="menu-article">
									<dt><i class="Hui-iconfont">&#xe616;</i> 教室管理<i
											class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
									<dd>
										<ul>
											<li><a data-href="#" data-title="教室列表" href="javascript:void(0)">教室列表</a></li>
										</ul>
									</dd>
								</dl>
							</div>

						</aside>
					</body>

					</html>