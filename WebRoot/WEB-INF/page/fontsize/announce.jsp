<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/tree.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.mybox.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cssreset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/about.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pricing.css">
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript">

    </script>
</head>

<body >
<!--头部-->
<%@ include file="header.jsp" %>
<div >
    <div class="menu">
    </div>
    <div class="menu" style="width: 100px;">
    </div>
    <div class="content">
        <div class="container">
            <h1>${announce.title}</h1>
            <div style="height:50px;"><a href="${pageContext.request.contextPath}/announce/history?page=1">
                <h2 style="float:left">返回公告列表</h2>
                <div style="float:right">${announce.updateTime}</div></a>
            </div>
            <div>
                ${announce.content}
                <p style="text-align:right;">
                    ${announce.userName}
                </p>
                <p style="text-align:right;">
                    ${announce.updateTime}
                </p>
                <span style="color:#333333;font-family:'Microsoft YaHei', 微软雅黑, 宋体, Tahoma, Helvetica, SimSun, sans-serif;font-size:14px;line-height:21px;background-color:#FFFFFF;"></span></div>
        </div>
    </div>
</div>
</body>
</html>