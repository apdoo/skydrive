<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style type="text/css">
        .p_bar a {
            display:inline-block;
            color:#333;
            height:28px;
            line-height:28px;
            vertical-align:top;
            padding:0 10px;
            border:1px solid #CDCDCD;
            margin:0 3px;
        }
        .p_redirect {
            display:inline-block;
            color:#333;
            height:28px;
            line-height:28px;
            vertical-align:top;
            padding:0 10px;
            border:1px solid #CDCDCD;
            margin:0 3px;
        }
        .p_num {
            display:inline-block;
            color:#333;
            height:28px;
            line-height:28px;
            vertical-align:top;
            padding:0 10px;
            border:1px solid #CDCDCD;
            margin:0 3px;
        }
        .p_curpage {
            font-weight:700;
            background-color:#1584D9;
            color:#fff;
            border-color:#1584D9;
        }
    </style>
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
            <h1>历史公告</h1>
            <c:forEach items="${list}" var="p">
                <div style="height:50px;"><a href="${pageContext.request.contextPath}/announce/detail?aid=${p.id}">
                    <h2 style="float:left">${p.title}</h2>
                    <div style="float:right">${p.updateTime}</div></a>
                </div>
            </c:forEach>
            <!--分页-->
            <br>
                <div align="center" class="clear"><div class="p_bar">
                    <c:forEach begin="1" end="${count}" var="i">
                        <c:if test="${current_page eq i}">
                              <!--当前页样式改变-->
                             <span class="p_curpage p_num">  ${i} </span>
                        </c:if>
                        <c:if test="${current_page !=i}">
                            <a href="${pageContext.request.contextPath}/announce/history?page=${i}" class="p_num">${i}</a>
                        </c:if>
                    </c:forEach>
                </div></div>
            <br>
        </div>
    </div>
</div>
</body>
</html>