<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="head">
    <%--<img width="157px" height="64px" src="${pageContext.request.contextPath}/resources/img/logo.png" id="logo">--%>
    <ul>
        <li><a href="${pageContext.request.contextPath}" target="_blank" style="color:red">91网盘</a><img width="1px" height="13px" src="${pageContext.request.contextPath}/resources/img/nav_seperate_line.png"></li>
        <li><a target="_blank" href="${pageContext.request.contextPath}/search/home">资源搜索</a><img width="1px" height="13px" src="${pageContext.request.contextPath}/resources/img/nav_seperate_line.png"></li>
        <%--<li><a href="http://www.colafile.com/vip">高级会员</a><img width="1px" height="13px" src="${pageContext.request.contextPath}/resources/img/nav_seperate_line.png"></li>--%>
        <span id="logininfo"><li>
            <c:if test="${!empty userinfo}">
                <a href="${pageContext.request.contextPath}/person/home">个人中心</a>
            </c:if>
            <c:if test="${empty userinfo}">
                <a href="${pageContext.request.contextPath}/user/login">登录</a>
            </c:if>
        <img width="1px" height="13px" src="${pageContext.request.contextPath}/resources/img/nav_seperate_line(1).png"></li><li><a href="${pageContext.request.contextPath}/user/reg">注册</a><img width="1px" height="13px" src="${pageContext.request.contextPath}/resources/img/nav_seperate_line(1).png"></li></span>
        <%--<li><a target="_blank" href="http://www.colafile.com/announce">官方公告</a><img width="1px" height="13px" src="${pageContext.request.contextPath}/resources/img/nav_seperate_line.png"></li>--%>
        <%--<li><a href="http://www.colafile.com/about/wzjh.html">网赚计划</a></li>--%>
    </ul>
</div>
