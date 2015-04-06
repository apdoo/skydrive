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
        <li class="active">安全中心</li>
    </ul><!-- .breadcrumb -->

</div>

<div class="page-content">
<div class="page-header">
    <h1>
        安全中心
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
        <div class="col-sm-5">
            <div class="widget-box">
                <div class="widget-header">
                    <h4>修改登录密码</h4>
                </div>

                <div class="widget-body">
                    <div class="widget-main no-padding">
                        <form id="form_pwd">
                            <!-- <legend>Form</legend> -->
                            <fieldset>
                                <label>登录密码:</label>
                                <input id="pwd_old_password" name="oldpassword" type="password" placeholder="请输入当前密码...">
                                <span id="pwd_old_password_tips" style="color: #d16e6c"></span>
                            </fieldset>
                            <fieldset>
                                <label>新的密码:</label>
                                <input id="pwd_new_password" name="newpassword" type="password" placeholder="请输入新的密码...">
                            </fieldset>
                            <fieldset>
                                <label>确认密码:</label>
                                <input id="pwd_password_en"  type="password" placeholder="请确认新的密码...">
                                <span id="pwd_password_en_tips" style="color: #d16e6c"></span>
                            </fieldset>
                            <fieldset>
                                <label>二级密码:</label>
                                <input id="pwd_opassword"  name="opassowrd" type="password" placeholder="请输入二级密码...">
                                <span id="pwd_opassword_tips" style="color: #d16e6c"></span>
                            </fieldset>
                            <div class="form-actions left">
                                <button type="button" class="btn btn-info btn-sm" onclick="s_submit_pwd()">
                                    <i class="icon-key bigger-110"></i>
                                    提交
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="widget-box">
                <div class="widget-header">
                    <h4>安全邮箱</h4>
                </div>

                <div class="widget-body">
                    <div class="widget-main no-padding">
                        <form id="form_email">
                            <!-- <legend>Form</legend> -->
                            <fieldset>
                                <label>当前邮箱:</label>
                                <input type="text" readonly="readonly" value="${userinfo.email}">
                            </fieldset>
                            <fieldset>
                                <label>新的邮箱:</label>
                                <input id="email_email" type="text" placeholder="请输入新的邮箱地址...">
                                <span id="email_email_tips" style="color: #d16e6c"></span>
                            </fieldset>
                            <fieldset>
                                <label>登录密码:</label>
                                <input id="email_password" type="password" placeholder="请输入登录密码...">
                                <span id="email_password_tips" style="color: #d16e6c"></span>
                            </fieldset>
                            <fieldset>
                                <label>二级密码:</label>
                                <input id="email_opassword"  type="password" placeholder="请输入二级密码...">
                                <span id="email_opassword_tips" style="color: #d16e6c"></span>
                            </fieldset>
                            <div class="form-actions left">
                                <button type="button" class="btn btn-info btn-sm" onclick="s_submit_email()">
                                    <i class="icon-key bigger-110"></i>
                                    提交
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-5">
            <div class="widget-box">
                <div class="widget-header">
                    <h4>二级密码</h4>
                </div>

                <div class="widget-body">
                    <div class="widget-main no-padding">
                        <form id="form_opwd">
                            <!-- <legend>Form</legend> -->
                            <fieldset>
                                <label>二级密码:</label>
                                <input id="opwd_opassowrd" type="password" name="opassowrd" placeholder="请输入二级密码...">
                            </fieldset>
                            <fieldset>
                                <label>确认密码:</label>
                                <input id="opwd_opassowrd_en" type="password" placeholder="请确认二级密码...">
                                <span id="opwd_opwd_tips" style="color: #d16e6c"></span>
                            </fieldset>
                            <div class="form-actions left">
                                <button type="button" class="btn btn-info btn-sm" onclick="s_submit_opwd()">
                                    <i class="icon-key bigger-110"></i>
                                    提交
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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

    });
    //修改密码
    function s_submit_pwd(){
      var oldp=$("#pwd_old_password").val();
      var newp=$("#pwd_new_password").val();
      var password_en=$("#pwd_password_en").val();
      var opwd=$("#pwd_opassword").val();
      if(newp!=password_en) {
          $("#pwd_password_en_tips").text("两次输入的密码不一致!");
      }else{
          $.ajax({
              type : "POST",
              url : "${pageContext.request.contextPath}/user/modifyPwd",
              dataType:"json",
              data : {
                  oldpassword:oldp,
                  newpassword:newp,
                  opassowrd : opwd
              },
              success : function(data) {
                  if(data.success){
                      successTips("修改成功!");
                  }else{
                      $("#pwd_old_password_tips").text(data.msg);
                      $("#pwd_opassword_tips").text(data.msg);
                  }
              },
              error:function(){
              }
          });
      }

    }
    //修改邮箱
    function s_submit_email (){
        var email=$("#email_email").val();
        var pwd=$("#email_password").val();
        var opwd=$("#email_opassword").val();
        //检查email是否符合
//       if(!checkEmail(email)){
//           $("#email_email_tips").text("email格式不正确!");
//       } else{
           $("#email_email_tips").text("");
           $.ajax({
               type : "POST",
               url : "${pageContext.request.contextPath}/user/modifyEmail",
               dataType:"json",
               data : {
                   email:email,
                   password:pwd,
                   opassowrd : opwd
               },
               success : function(data) {
                   if(data.success){
                       successTips("修改成功!");
                   }else{
                      $("#email_password_tips").text(data.msg);
                      $("#email_opassword_tips").text(data.msg);
                   }
               },
               error:function(){
               }
           });
//       }


    }
    //修改二级密码
    function s_submit_opwd(){
        var opwd_en=$("#opwd_opassowrd_en").val();
        var opwd=$("#opwd_opassowrd").val();
        if(opwd!=opwd_en) {
           //两次输入不一样
            $("#opwd_opwd_tips").text("两次输入的密码不一致!");
        }else{
            $("#opwd_opwd_tips").text("");
            $.ajax({
                type : "POST",
                url : "${pageContext.request.contextPath}/user/modifyOPwd",
                dataType:"json",
                data : {
                    opassowrd : opwd
                },
                success : function(data) {
                    if(data.success){
                        successTips("修改成功!");
                    }
                },
                error:function(){
                }
            });
        }
    }
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

