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
    <div id="loginbox" style="margin-bottom: 125px;">
        <form name="user_form" action="${pageContext.request.contextPath}/user/signup" method="post" m="" id="loginform" class="form-vertical" onsubmit="return chkform(this);">
            <div class="control-group normal_text"> <h3>注册91网盘帐号</h3></div>
            <div class="alert alert-error">
                ${msg}
                <%--<strong>错误</strong> 用户名已存在，请重新修改。--%>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg"><i class="icon-user"></i></span><input placeholder="请输入您要注册的账号" class="u_input" tabindex="1" type="text" name="username" id="username" value="" maxlength="20" onblur="chk_username();">
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_ly"><i class="icon-lock"></i></span><input placeholder="请输入您的密码" class="u_input" tabindex="2" type="password" name="password" maxlength="20" id="password">
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_ly"><i class="icon-lock"></i></span><input placeholder="请确认您输入的密码" class="u_input" tabindex="3" type="password" name="confirm_password" maxlength="20" id="confirm_password">
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_dy"><i class="icon-envelope"></i></span><input placeholder="请输入电子邮箱地址" class="u_input" tabindex="4" type="text" name="email" id="r_email" value="" maxlength="50">
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lo"><i class=" icon-warning-sign"></i></span><input class="verycode" tabindex="5" type="text" name="vcode" value="" size="12" maxlength="6" placeholder="请输入验证码">
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <img id="vimg"  src="${pageContext.request.contextPath}/validation/one" />
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <span class="pull-left"><a href="http://www.colafile.com/#" class="flip-link btn btn-info" id="to-recover">已有帐号?</a></span>
                    <span class="pull-right">
					<button type="submit" class="btn btn-success"> 注册</button></span>
            </div>
        </form>
    </div>




    <script type="text/javascript">


    </script>

    <script language="javascript">
        function chk_username(){
            var r_username = getId('r_username').value.strtrim();
            $('#e_username').removeClass();
//            $.ajax({
//                type : 'post',
//                url : 'ajax.php',
//                data : 'action=chk_username&r_username='+r_username+'&t='+Math.random(),
//                dataType : 'text',
//                success:function(msg){
//                    var arr = msg.split('|');
//                    if(arr[0]=='true'){
//                        $('#e_username').html(arr[1]);
//                        $('#e_username').addClass('txtgreen');
//                    }else{
//                        $('#e_username').html(msg);
//                        $('#e_username').addClass('txtred');
//                    }
//                },
//                error:function(){
//                }
//
//            });
        }
        function chk_email(){
            var r_email = getId('r_email').value.strtrim();
            $('#e_email').removeClass();
            $.ajax({
                type : 'post',
                url : 'ajax.php',
                data : 'action=chk_email&r_email='+r_email+'&t='+Math.random(),
                dataType : 'text',
                success:function(msg){
                    var arr = msg.split('|');
                    if(arr[0]=='true'){
                        $('#e_email').addClass('txtgreen');
                        $('#e_email').html(arr[1]);
                    }else{
                        $('#e_email').addClass('txtred');
                        $('#e_email').html(msg);
                    }
                },
                error:function(){
                }

            });
        }

        document.user_form.username.focus();
        function chkform(o){
            if(o.username.value.strtrim().length <2){
                alert("您注册的用户名过短，请重新输入。");
                o.username.focus();
                return false;
            }
            if(o.password.value.strtrim().length <6){
                alert("您输入的密码过短，请重新输入");
                o.password.focus();
                return false;
            }
            if(o.confirm_password.value.strtrim() != o.password.value.strtrim()){
                alert("确认密码不正确，请重新输入。");
                o.password.focus();
                return false;
            }
            if(o.email.value.strtrim().length <6 || o.email.value.strtrim().indexOf('@') ==-1 || o.email.value.strtrim().indexOf('.') ==-1){
                alert("Email不正确，请重新输入。");
                o.email.focus();
                return false;
            }
//            if(o.verycode.value.strtrim().length <4){
//                alert("验证码不正确，请重新输入。");
//                o.verycode.focus();
//                return false;
//            }

        }
    </script>
</div>
<!--尾部-->
<%@ include file="footer.jsp" %>
</body>
</html>