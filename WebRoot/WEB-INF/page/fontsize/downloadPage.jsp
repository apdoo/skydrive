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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/download-page/mybox.css">
    <link href="${pageContext.request.contextPath}/resources/css/download-page/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/download-page/newpersonal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/download-page/comheader.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/download-page/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/download-page/viewincome.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/download-page/oldincome.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/download-page/style.2.9.10.css" id="gt_css">
    <script type="text/javascript">

    </script>
</head>

<body >
<!--头部-->
<div id="wrap">
<div id="container">
<div id="header">
    <div class="header">
        <h1> <a title="1024网盘" href="#" id="logo">1024网盘 - 分享，从1024网盘开始。</a> </h1>
        <ul id="nav" style="font-size:13px;">
            <li><a href="${pageContext.request.contextPath}/person/home">个人中心</a></li>
            <li><a href="${pageContext.request.contextPath}/search/home">资源搜索</a></li>
        </ul>
    </div>
</div>
<div id="public_main" style="font-size:12px;margin-bottom: 150px;">
<div class="container">
<style>
    #breadcrumbs {
        position: relative;
        border-bottom: 1px solid #e5e5e5;
        background-color: #f5f5f5;
        min-height: 40px;
        line-height: 39px;
        padding: 0 12px 0 0;
        display: block;
    }.breadcrumb {
         background-color: transparent;
         display: inline-block;
         margin: 0 22px 0 12px;
         padding: 0;
         font-size: 13px;
         color: #333;
         border-radius: 0;
     }.breadcrumb>li, .breadcrumb>.active {
          color: #555;
      }.breadcrumb>li {
           display: inline-block;
           text-shadow: 0 1px 0 #fff;
       }li {
            line-height: 20px;
        }
    #nav-search {
        margin: 5px;
        line-height: 24px;
    }.pull-right {
         float: right;
     }#nav-search .form-search {
          margin-top: 1px;
      }.form-search {
           margin: 0;
       }span.input-icon {
            display: inline-block;
        }.input-icon {
             position: relative;
         }#nav-search {
              line-height: 24px;
          }#nav-search-icon {
               left: auto;
               right: 3px;
           }#nav-search-icon {
                color: #6fb3e0;
                font-size: 14px;
                line-height: 24px;
            }.input-icon>[class*="icon-"] {
                 padding: 0 3px;
                 z-index: 2;
                 position: absolute;
                 top: 1px;
                 bottom: 1px;
                 left: 3px;
                 line-height: 28px;
                 display: inline-block;
                 color: #909090;
                 font-size: 16px;
             }[class^="icon-"], [class*=" icon-"] {
                  display: inline;
                  width: auto;
                  height: auto;
                  line-height: normal;
                  vertical-align: baseline;
                  background-image: none;
                  background-position: 0 0;
                  background-repeat: repeat;
                  margin-top: 0;
              }[class^="icon-"], [class*=" icon-"] {
                   font-family: FontAwesome;
                   font-weight: normal;
                   font-style: normal;
                   text-decoration: inherit;
                   -webkit-font-smoothing: antialiased;
               }#nav-search-input {
                    padding-left: 10px;
                    width: 160px;
                }
    .icon-home{margin-left:4px;margin-right:2px;position:relative;top:2px;}
    .icon-home:before{content:url('${pageContext.request.contextPath}/resources/img/home.png')}
</style>
<div id="breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            目录导航

							<span class="divider">
								&gt;
							</span>
        </li>
        <li>
            <a href="#">1024网盘</a>
							<span class="divider">
								&gt;
							</span>
        </li>
        <li>
            <a >${file.userName} </a>
													<span class="divider">
							</span>
        </li>
    </ul>
</div>
<div class="col-main" style="width:900px;">
    <div class="owner-box" id="js_user_info_box">
        <div class="owner-head">
            <img src="${pageContext.request.contextPath}/resources/img/nologo.png" alt="" style="border-radius: 5px;">
        </div>
        <div class="owner-nickname">
            ${file.userName}       </div>
        <ul class="owner-social">
        </ul>
    </div>
    <div class="file-box" style="width:760px;">
        <h3>
            <img src=" ${pageContext.request.contextPath}/resources/img/file.png" align="absmiddle" border="0">        <span>
         <a href="">${file.fileName}</a>
        </span>
        </h3>
        <div class="file-info">
            <em>
                大小：${file.fileSize} Mb      </em>
            <em>
                上传日期：${file.uploadTime} </em>
            <em>	  <img style="margin: 5px;" src="${pageContext.request.contextPath}/resources/img/safe.png" width="20" title="文件经过检验" height="15" align="absmiddle" border="0">此文件已通过安全检测；1024网盘已使用 <a href="http://j.union.ijinshan.com/jump.php?u_key=289737" target="_blank">金山毒霸</a> 进行扫描，结果为无毒安全。
            </em></div>
        <div class="main-pic-show" align="center">
            广告位，待租
        </div>
        <div class="download-box">
            <div id="down_link">
                <div id="down_verify_box" style="">
                    <li style="margin-left:15px;width:300px;">
                        <a id="submit-button"  href="${pageContext.request.contextPath}/file/download?userId=${file.userId}&fileName=${file.fileName}" class="button btn-green" style="width:300px;cursor: pointer;">
                            <i class="icon ico-udown"></i>
                            <em>点击获取文件下载地址</em>
                        </a>
                    </li>
                </div>
            </div>
        </div>
    </div>
    <div class="main-pic-show" style="height:420px;margin: 0 135px 0;">
        <!-- 广告位：1024网盘普通网赚File|728*90|中 -->
        <div style="width:728px;margin-top:5px;">
            <!--cola tui-->
            <style type="text/css">
                .tui{width:726px;height:168px;background:#ffffff;border-color:#cccccc;overflow:hidden;border-width:1px;border-style:solid;position:relative}
                .title{background-color:#797CBE;height:30px;line-height:30px;font-size:12px;font-weight:700;font-family:Microsoth YaHei;color:#FFFFFF;overlow:hidden;position:relative}.logo{float:left;}
                .logo span{float:left;padding-left:33px}
                .logo a {display: block;width: 18px;height: 12px;overflow: hidden;text-indent: -999em;cursor: pointer;position: absolute;left: 10px;top: 50%;margin-top: -6px;}
                .a_1{background: url(http://tui.cnzz.net/templates/images/logo_pink.png) 0 0 no-repeat;}
                .content{overflow:hidden;margin:0 10px;width:706px;}
                .box{overflow: hidden;height:120px;}
                .txt {width: 720px;overflow: hidden;padding-top: 10px;}
                .txt ul {float:left;margin-left:25px;width:706px;list-style: none;}
                .txt li {width:343px;height: 20px;line-height: 20px;font-size: 12px;font-weight: 400;font-family: Microsoft YaHei;padding-right: 10px;display: inline;float: left;overflow: hidden;}
                .txt li:before {content:"▪ ";}
                .txt a{text-decoration: none;}
                .txt a:hover {color: #ff7f24;text-decoration: underline;}
                .foot{float:right;font-size:12px;font-weight:300;font-family:Microsoth YaHei;color:#222222;overlow:hidden;position:relative}
                .foot a{text-decoration: none;}
                .red{text-decoration: none;color:red;}
                .blue{text-decoration: none;color:blue;}
                .green{text-decoration: none;color:green;}
                .violet{text-decoration: none;color:#e031e6;}
                .pink{text-decoration: none;color:#ffcccc;}
            </style>

            <div class="tui">
                <div class="title">
                    <div class="logo">
                        <a href="#"   title="1024网盘推荐" class="a_1">1024网盘推荐</a>
                        <span>1024网盘竞价推荐</span></div>
                </div>
                <div class="box">
                    <div class="txt">
                        <ul>
                        </ul>
                    </div>
                </div>
                <div class="foot">
                    <span style="margin-right:200px;color:#bbbbbb">〖以上为1024网盘竞价推荐位〗</span>
                </div>
            </div>
            <!--cola tui-->
        </div>
        <%--<div style="width:728px;margin-top:5px;">--%>
            <%--<!-- 广告位：1024网盘普通网赚File|728*90|下 -->--%>
        <%--</div>--%>
    </div>
</div>
<div class="main-pic-show-3">
</div>
</div>
<div class="bottom-hint">
    <i class="icon">
    </i>
    1024网盘严禁上传包括反动、暴力、色情、违法及侵权内容的文件，如发现有以上形式的文件，我们鼓励用户对其进行举报！对于涉嫌上传违法作品的用户，将被取消用户资格，并若涉及法律纠纷的条件下保留对该用户行使配合相关部门进行取证的权益。
</div>
</div></div>
</div>
</div>
</body>
</html>