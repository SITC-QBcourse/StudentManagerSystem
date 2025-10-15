<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="ja">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
        </head>
        <body>
            <c:set var="useremail" scope="request">
                <spring:message code='login.useremail' />
            </c:set>
            <c:set var="password" scope="request">
                <spring:message code='login.password' />
            </c:set>
            <c:set var="vcode" scope="request">
                <spring:message code='login.vcode' />
            </c:set>
            <c:set var="vcodeChange" scope="request">
                <spring:message code='login.vcode.change' />
            </c:set>
            <c:set var="btnSubmit" scope="request">
                <spring:message code='login.btn.submit' />
            </c:set>
            <c:set var="btnReset" scope="request">
                <spring:message code='login.btn.reset' />
            </c:set>
        </body>
        </html>
            