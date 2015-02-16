<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>91网盘</title>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/tree.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.mybox.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cssreset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pricing.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-login.css">
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript">
    </script>
</head>

<body style="margin:0; padding:0;">

<div id="main" style="overflow:hidden">
    <!--头部-->
    <%@ include file="header.jsp" %>
    <div id="loginbox" style="margin-bottom: 185px;margin-top: 175px;">

        <form name="user_form" action="${pageContext.request.contextPath}/user/tologin" method="post" m="" id="loginform" class="form-vertical" onsubmit="return chkform(this);">
            <div class="control-group normal_text"> <h3>登录91网盘</h3></div>
            <div class="alert alert-info">
                <%--<strong>提醒</strong> 测试提醒--%>
                ${msg}
            </div>

            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg"><i class="icon-user"></i></span><input name="username" type="text" placeholder="用户名 / 安全邮箱">
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_ly"><i class="icon-lock"></i></span><input name="password" type="password" placeholder="密码">
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lo"><i class=" icon-warning-sign"></i></span><input type="text" name="vcode" value="" size="12" maxlength="6" placeholder="请输入验证码">
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div id="vimg_div" class="main_input_box">
                        <img id="vimg"  src="${pageContext.request.contextPath}/validation/one" />
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <span class="pull-left"><a href="account.php?action=forget_pwd" class="flip-link btn btn-info" id="to-recover">忘记密码?</a></span>
                    <span class="pull-right">
					<button type="submit" class="btn btn-success"> 登录</button></span>
            </div>
        </form>
    </div>
    <!--尾部-->
    <%@ include file="footer.jsp" %>

 </div>
</body>
</html>