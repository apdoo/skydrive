<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>91搜索</title>
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
    <script type="text/javascript">

    </script>
</head>

<body style="margin:0; padding:0;">
<div id="wp">
    <div id="ua" ss_c="xin81"><a href="http://www.colafile.com/">91网盘</a></div>
    <h1>
        91搜索
        <%--<img src="${pageContext.request.contextPath}/resources/img/search_logo.png" width="280" height="49" alt="91网盘资源搜索" title="91网盘资源搜索">--%>
    </h1>
    <div id="sc">
        <div id="s">
            <form action="${pageContext.request.contextPath}/search/doSearch" id="flpage" name="flpage">
                <input type="hidden" name="s" value="12563315054232519588">
                <input type="text" value="" id="s_input" name="fileName" autocomplete="off" name="q" x-webkit-speech="" onwebkitspeechchange="st_get('input','speech.i',1)" class="s_input" onmouseover="this.className='s_input s_input_h'" onmouseout="this.className='s_input'">
                <input type="submit" id="s_button" value="搜索" class="s_btn" onmouseover="this.className='s_btn s_btn_h'" onmousedown="this.className='s_btn s_btn_d'" onmouseout="this.className='s_btn'">
            </form>
            <div id="smart_pop" style="display: none;"></div>
        </div>
    </div>
</div>
</body>
</html>