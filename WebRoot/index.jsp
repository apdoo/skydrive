<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>1024网盘</title>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/tree.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.mybox.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cssreset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pricing.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
    <style>
        .product_name {float: right;color: #FFF;position: absolute;right: 10px;}
        .qie_0 {position:absolute;margin-left:155px;margin-top:-62px;z-index:0;line-height: normal;}
        .qie_1 {
            display: block;
            width: 60px;
            height: 60px;
            position: relative;
            left:3px;
            text-align: center;
        }
    </style>
    <script type="text/javascript">
         $(function(){
             init();
         });
        function init(){
            $.ajax({
                type : "POST",
                url : "${pageContext.request.contextPath}/announce/getAnns",
                dataType:"json",
                success : function(data) {
                    var content="";
                    $.each(data.list, function(key, val) {
                        if(val.title.indexOf("置顶")>=0){
                            content= content+"<li><a style=\"color:green\" target=\"_blank\" href=\"${pageContext.request.contextPath}/announce/detail?aid="+val.id+"\"><em>"+val.updateTime+"</em> "+val.title+".</a></li>" ;
                        } else{
                            content=content+"<li><a target=\"_blank\" href=\"${pageContext.request.contextPath}/announce/detail?aid="+val.id+"\"><em>"+val.updateTime+"</em> "+val.title+".</a></li>" ;
                        }
                    });
                    $("#anns").html(content);
                },
                error:function(){
                }
            });

        }
    </script>
</head>

<body style="margin:0; padding:0;">
<!--头部-->
<div id="main" style="overflow:hidden">
    <%@ include file="WEB-INF/page/fontsize/header.jsp" %>
    <div class="main_area">
        <div class="public_con" id="con_product_slide">
            <ul class="btn_list" id="scroll_btn_list">
                <li class="on"><a href="javascript:void(0)" title=""></a></li>
                <li class=""><a href="javascript:void(0)" title="">&nbsp;</a></li>
                <li class=""><a href="javascript:void(0)" title="">&nbsp;</a></li>
            </ul>
        </div>
        <ul class="product_list" id="scroll_product_list">
            <li class="xl on" style="opacity: 1;">
                <div class="main_con">
                    <img width="1000px" height="300px" src="${pageContext.request.contextPath}/resources/img/index_1.png">
                </div>
            </li>
            </ul>
    </div>
    <div id="content">
        <div id="feature">
            <dl>
                <dt><img width="180px" height="136px" src="${pageContext.request.contextPath}/resources/img/feature5.png"></dt>
                <dd>淘汰眼花缭乱的下载节点，1024网盘智能下载技术全面应用，更加简单、更加高速。</dd>
            </dl>
            <img class="seperate" width="1px" height="208px" src="${pageContext.request.contextPath}/resources/img/feature_seperate.png">
            <dl>
                <dt><img width="180px" height="136px" src="${pageContext.request.contextPath}/resources/img/feature1.png"></dt>
                <dd>启用全新HTML5界面引擎，重塑了1024网盘的每一个角落，流畅与轻快更进一步。</dd>
            </dl>
            <img class="seperate" width="1px" height="208px" src="${pageContext.request.contextPath}/resources/img/feature_seperate.png">
            <dl>
                <dt><img width="180px" height="136px" src="${pageContext.request.contextPath}/resources/img/feature3.png"></dt>
                <dd>由内至外的全面升级和优化，大幅降低HTTP响应时间，响应迅速，智能新奇。</dd>
            </dl>
            <img class="seperate" width="1px" height="208px" src="${pageContext.request.contextPath}/resources/img/feature_seperate.png">
            <dl>
                <dt><img width="180px" height="136px" src="${pageContext.request.contextPath}/resources/img/feature4.png"></dt>
                <dd>超过50项全新改变，熟悉而又新奇，专注云储存服务，依然简洁，更不简单。</dd>
            </dl>
        </div>
        <div id="function">
            <div class="middle-content clearfix">
                <div class="left">
                    <img id="func_title" width="100px" height="23px" src="${pageContext.request.contextPath}/resources/img/func_title.png">
                    <ul class="feature">
                        <li>
                            <i class="hd feature-dns"></i>
                            <h4>最强网盘模式</h4>
                            <p>在1024网盘您可以体会到可操作性最强的网盘模式，个人模式、网赚模式随时自由切换；除此之外您还可以为您网盘的某一个指定的文件夹设置单独的模式，再也不用因为在不同网站推广资源而使用多个帐号。</p>
                        </li>
                        <li>
                            <i class="hd feature-cdn"></i>
                            <h4>最佳下载体验</h4>
                            <p>1024网盘使用真正的云技术，全球6个数据中心，宽带预存高达60Gbps；独有的1024网盘智能下载技术，完全淘汰下载需要选择节点的落后文件下载方式，无论菜鸟有多菜，在1024网盘都可以高速的下载文件。</p>
                        </li>
                        <li>
                            <i class="hd feature-defence"></i>
                            <h4>收益分析系统</h4>
                            <p>在网赚模式下提供实时报表的服务商，1024网盘是第一家，这不仅是技术实力的体现，更是诚信的体现；来路，下载，所有数据一个不漏，方便您能够更详细的了解到您的网赚现状，优化自身网赚方案。</p>
                        </li>
                        <li>
                            <i class="hd feature-traffic"></i>
                            <h4>VIP纯净模式</h4>
                            <p>1024网盘VIP用户比率是行业中最高的，业界最佳的vip体验，纯净模式更是1024网盘VIP的专属标志，一旦加入1024网盘高级会员，下载文件将自动激活纯净模式，智能接入最佳VIP极速节点，享受下载。</p>
                        </li>
                        <li>
                            <i class="hd feature-seo"></i>
                            <h4>最诚信服务商</h4>
                            <p>绝不用任何隐形政策干扰用户收益，绝对0扣量，1024网盘技术部根本就没有也不打算开发扣量的系统；我们运营的任务是竭尽全力为用户争取更多的收益，我们技术的任务是为用户带来更好的体验。</p>
                        </li>
                    </ul>
                </div>
                <div class="right">
                    <a target="_blank" href="${pageContext.request.contextPath}/announce/history?page=1">
                        <img id="func_title" width="100px" height="23px" src="${pageContext.request.contextPath}/resources/img/func_title1.png">
                    </a>
                     <div class="news">
                        <ul id="anns">

                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
 </div>
<%@ include file="WEB-INF/page/fontsize/footer.jsp" %>
</body>
</html>