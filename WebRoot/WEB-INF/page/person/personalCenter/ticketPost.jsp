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
                    <li class="active">创建工单</li>
                </ul><!-- .breadcrumb -->

            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        创建工单
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
                                <small>(v1.2)</small>
                            </strong>
                        </div>
                        <form id="id-ticket-form" class="form-horizontal message-form  col-xs-12">
                            <div class="">
                                <div class="hr hr-18 dotted"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="title">工单标题:</label>
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="input-icon block col-xs-12 no-padding">
                                            <input maxlength="100" type="text" class="col-xs-12" name="messageTitle" id="title" placeholder="工单标题">
                                            <i class="icon-comment-alt"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr hr-18 dotted"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">
                                        <span class="inline space-24 hidden-480"></span>
                                        工单内容:
                                    </label>
                                    <div class="col-sm-9">
                                        <div class="wysiwyg-toolbar btn-toolbar center wysiwyg-style1"> <div class="btn-group">  <a class="btn btn-sm" data-edit="bold" title="" data-original-title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>  <a class="btn btn-sm" data-edit="italic" title="" data-original-title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>  <a class="btn btn-sm" data-edit="strikethrough" title="" data-original-title="Strikethrough"><i class="icon-strikethrough"></i></a>  <a class="btn btn-sm" data-edit="underline" title="" data-original-title="Underline"><i class="icon-underline"></i></a>  </div> <div class="btn-group">  <a class="btn btn-sm active" data-edit="justifyleft" title="" data-original-title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>  <a class="btn btn-sm" data-edit="justifycenter" title="" data-original-title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>  <a class="btn btn-sm" data-edit="justifyright" title="" data-original-title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>  </div> <div class="btn-group">  <div class="inline position-relative"> <a class="btn btn-sm  dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Hyperlink"><i class="icon-link"></i></a>  <div class="dropdown-menu dropdown-caret pull-right">							<div class="input-group">								<input class="form-control" placeholder="URL" type="text" data-edit="createLink">								<span class="input-group-btn">									<button class="btn btn-sm btn-primary" type="button">Add</button>								</span>							</div>						</div> </div> <a class="btn btn-sm" data-edit="unlink" title="" data-original-title="Remove Hyperlink"><i class="icon-unlink"></i></a>  </div> <div class="btn-group">  <a class="btn btn-sm" data-edit="undo" title="" data-original-title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>  <a class="btn btn-sm" data-edit="redo" title="" data-original-title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>  </div> </div> <div class="wysiwyg-editor" id="content" contenteditable="true"></div>
                                    </div>
                                </div>

                                <div class="hr hr-18 dotted"></div>

                                <div class="align-right">
                                    <button onclick="submita()" type="button" class="btn btn-sm btn-primary no-border">
                                        <span class="bigger-110">发送</span>
                                        <i class="icon-arrow-right icon-on-right"></i>
                                    </button>
                                </div>

                                <div class="space"></div>
                            </div>
                        </form>
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
<!-- inline scripts related to this page -->
  <script type="text/javascript">
      //发布工单
      function submita(){
          var title=$("#title").val();
          var content=$("#content").html();
          if(title==""){
              successTips("请输入工单标题");
              return false;
          }   if(content==""){
              successTips("请输入工单内容");
              return false;
          }
          $.ajax({
              type : "POST",
              url : "${pageContext.request.contextPath}/ticket/ticketCreate",
              dataType:"json",
              data :{
                  title:title,
                  content:content
              },
              success : function(data) {
                  if(data.success){
                      $("#title").val("");
                      $("#content").text("");
                      successTips("发布成功!");
                  }
              }

          });
      }
      /**
      *取消
       */
      function cancela(){

      }
      //提示信息
      function successTips(tips){
          bootbox.dialog({
              message:tips ,
              buttons: {
                  "success" : {
                      "label" : "OK",
                      "className" : "btn-sm btn-primary"
                  }
              }
          });
      }
  </script>
</body>
</html>

