<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>

    <script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
    <script src="js/jquery.uploadify.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="resources/css/uploadify.css">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript">
        $(document).ready(
                function() {
                    $("#uploadify").uploadify( {//初始化函数
                        'swf'      : 'js/uploadify.swf',
                        'uploader' : 'servlet/Upload',
                        'multi' : true,
                        'buttonText' : '浏览',
                        'simUploadLimit' : 8
                    });
                });
    </script>
</head>

<body>
<div id="fileQueue"></div>
<input type="file" name="uploadify" id="uploadify" />
<p>
    <a href="javascript:jQuery('#uploadify').upload()">开始上传</a>
    <a href="javascript:jQuery('#uploadify').cancel()">取消所有上传</a>
</p>
</body>
</html>