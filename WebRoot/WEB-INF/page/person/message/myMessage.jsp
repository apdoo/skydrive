<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <title>1024网盘-个人中心</title>
    <!-- basic styles -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
    <%--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />--%>
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->

    <!--注释 by hex
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" /> -->

    <!-- ace styles -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css" />

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-ie.min.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/assets/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .navbar{
            height: 45px;
        }
        .breadcrumb>li.active {
             color: #555;
            padding-top: 10px;
            }
    </style>
</head>

<body>

<!--中部-->
<div class="main-container" id="main-container">
<script type="text/javascript">
    try{ace.settings.check('main-container' , 'fixed')}catch(e){}
</script>

<div class="main-container-inner">
<a class="menu-toggler" id="menu-toggler" href="#">
    <span class="menu-text"></span>
</a>
<!--顶部菜单-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<!--左侧菜单-->
    <%@ include file="../../common/leftmenu.jsp" %>
<div class="main-content">
<div class="breadcrumbs" id="breadcrumbs">
    <script type="text/javascript">
        try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
    </script>

    <ul class="breadcrumb">
        <li>
            <i class="icon-home home-icon"></i>
            <a href="#">首页</a>
        </li>
        <li class="active">我的消息</li>
    </ul><!-- .breadcrumb -->

</div>

<div class="page-content">
<div class="page-header">
    <h1>
        我的消息
        <small>
            <i class="icon-double-angle-right"></i>
            查看
        </small>
    </h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
<!-- PAGE CONTENT BEGINS -->

<div class="alert alert-block alert-success">
    <button type="button" class="close" data-dismiss="alert">
        <i class="icon-remove"></i>
    </button>

    <i class="icon-ok green"></i>

    欢迎使用
    <strong class="green">
        1024网盘
        <small>(v1.0)</small>
    </strong>
</div>
<div class="row">
<div class="col-xs-12">
<div class="tabbable">
<ul id="inbox-tabs" class="inbox-tabs nav nav-tabs padding-16 tab-size-bigger tab-space-1">

    <li class="active">
        <a data-toggle="tab" href="#inbox" data-target="inbox">
            <i class="blue icon-inbox bigger-130"></i>
            <span class="bigger-110">收件箱</span>
        </a>
    </li>
</ul>

<div class="tab-content no-border no-padding">
<div class="tab-pane in active">
<div class="message-container">
<div id="id-message-list-navbar" class="message-navbar align-center clearfix">
</div>
<div class="message-list-container">
<div class="message-list" id="message-list">
<c:forEach items="${mymessagelist}" var="my">
    <c:if test="${my.flag eq '0'}">
        <div class="message-item message-unread">
     </c:if>

    <c:if  test="${my.flag eq '1'}">
         <div class="message-item">
    </c:if>
            <label class="inline">
                <input type="checkbox" class="ace">
                <span class="lbl"></span>
            </label>
            <span class="sender" title="${my.fromName}">${my.fromName}</span>
            <span class="time" style="width: 129px;">${my.sendTime}</span>

                                                                            <span onclick="show_content('${my.id}','${my.flag}')" class="summary">
                                                                                <span  class="text" onclick="" style="width: 200px;">
                                                                                        ${my.messageTitle}
                                                                                </span>
                                                                            </span>
        <div id="mess_${my.id}" name="mess_" class="message-content " >
            <div class="message-header clearfix">
                <div class="pull-left">
                    <span class="blue bigger-125">   ${my.messageTitle} </span>
                    <div class="space-4"></div>
                    &nbsp;
                    <img class="middle" src="${pageContext.request.contextPath}/resources/img/admin.jpg" width="32">
                    &nbsp;
                    <span class="sender">${my.fromName}</span>
                    &nbsp;
                    <i class="icon-time bigger-110 orange middle"></i>
                    <span class="time">${my.sendTime}</span>
                </div>
            </div>
            <div class="hr hr-double"></div>
            <div class="slimScrollDiv" style="position: relative; width: auto; height: auto;">
                <div class="message-body" style=" width: auto; height: auto;">
                    <p>
                            ${my.messageContent}
                    </p>
                </div>
            </div>
            <div class="hr hr-double"></div>
        </div>
        </div>
</c:forEach>
<div class="message-item message-unread"></div>

</div><!-- /.message-container -->
</div><!-- /.tab-pane -->
</div><!-- /.tab-content -->
</div><!-- /.tabbable -->
</div><!-- /.col -->
</div>
<!-- PAGE CONTENT ENDS -->
</div><!-- /.col -->
</div><!-- /.row -->
</div><!-- /.page-content -->
</div><!-- /.main-content -->

</div><!-- /.main-container-inner -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="icon-double-angle-up icon-only bigger-110"></i>
</a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
</script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath}/assets/js/excanvas.min.js"></script>
<![endif]-->

<script src="${pageContext.request.contextPath}/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/flot/jquery.flot.resize.min.js"></script>

<!-- ace scripts -->

<script src="${pageContext.request.contextPath}/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/js/myCommon.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {
         $("div[name=mess_]").hide();
    });
    /**
    *更改可见参数
     */
    function show_content(id,flag){
        if($("#mess_"+id).is(':hidden')) {
            $("#mess_"+id).show();
        } else{
            $("#mess_"+id).hide();
        }
        //判断当前阅读标志,如果是未读的则发送已经
        if(flag=='0'){
            $.ajax({
               type:"post",
                url:"${pageContext.request.contextPath}/message/myMessageRead",
                data:{id:id},
                dataType:"json",
                success : function(data) {
                }
            });
        }
    }
</script>
</body>
</html>

