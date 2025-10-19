<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
				<%@ include file="common/common.jsp" %>
					<!DOCTYPE html>
					<html lang="zh">

					<head>
						<meta charset="UTF-8">
						<title><spring:message code="project.title" /></title>
					</head>
					<body>
                        <header class="navbar-wrapper">
							<div class="navbar navbar-fixed-top">
								<div class="container-fluid cl">
									<a href="${pageContext.request.contextPath}/main" class="logo navbar-logo f-l mr-10 hidden-xs"><spring:message code="project.title" /></a>
									<a href="${pageContext.request.contextPath}/main" class="logo navbar-logo-m f-l mr-10 visible-xs">YMH</a>
									<span class="logo navbar-slogan f-l mr-10 hidden-xs">V1.0</span>
									<a aria-hidden="false" href="javascript:;" class="nav-toggle visible-xs"><i class="hui-iconfont">&#xe667;</i></a>
									<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
										<ul class="row cl">
											<li><c:if test="${loginUser.userPrivilege == 0}">学生</c:if></li>
											<li><c:if test="${loginUser.userPrivilege == 1}">管理员</c:if></li>
											<li><c:if test="${loginUser.userPrivilege == 2}">常勤老师</c:if></li>
											<li><c:if test="${loginUser.userPrivilege == 3}">非常勤老师</c:if></li>
											<li class="dropDown dropDown_hover">
												<a href="javascript:;" class="dropDown_A"><c:if test="${loginUser.userPrivilege == 0}"><c:out value="${loginUser.userName}"/>admin <i class="Hui-iconfont">&#xe6d5;</i></c:if></a>
												<a href="javascript:;" class="dropDown_A"><c:if test="${loginUser.userPrivilege == 1}"><c:out value="${loginUser.userName}"/>admin <i class="Hui-iconfont">&#xe6d5;</i></c:if></a>
												<a href="javascript:;" class="dropDown_A"><c:if test="${loginUser.userPrivilege == 2}"><c:out value="${loginUser.userName}"/>admin <i class="Hui-iconfont">&#xe6d5;</i></c:if></a>
												<a href="javascript:;" class="dropDown_A"><c:if test="${loginUser.userPrivilege == 3}"><c:out value="${loginUser.userName}"/>admin <i class="Hui-iconfont">&#xe6d5;</i></c:if></a>
											</li>
										</ul>
									</nav>
								</div>
							</div>
                            
                        </header>
					</body>
    				</html>