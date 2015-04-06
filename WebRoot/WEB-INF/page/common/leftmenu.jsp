<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<div class="sidebar" id="sidebar">
<script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript">
    $(function(){
        //左侧菜单选择样式
        var name=window.location.pathname;
        $("ul[class=submenu] a").each(function(){
            $(this).parent().removeClass("active");
            $(this).parent().parent().parent().removeClass("open");
//            $(this).parent().parent().css("display","none");
            if( $(this).attr("href")==name){
//                console.info(  $(this).parent().parent().parent());
                $(this).parent().addClass("active");
                $(this).parent().parent().css("display","block");
                $(this).parent().parent().parent().addClass("open");
            }
            //父菜单打开

        });
//        $('li').bind('click',function(){
//            $("li").each(function (){
//                $(this).removeClass("active");
//            });
//            $(this).addClass("active");
//        });
    });
</script>

<div class="sidebar-shortcuts" id="sidebar-shortcuts">
    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
        <button class="btn btn-success">
            <i class="icon-signal"></i>
        </button>

        <button class="btn btn-info">
            <i class="icon-pencil"></i>
        </button>

        <button class="btn btn-warning">
            <i class="icon-group"></i>
        </button>

        <button class="btn btn-danger">
            <i class="icon-cogs"></i>
        </button>
    </div>

    <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
        <span class="btn btn-success"></span>

        <span class="btn btn-info"></span>

        <span class="btn btn-warning"></span>

        <span class="btn btn-danger"></span>
    </div>
</div><!-- #sidebar-shortcuts -->

<ul id="left_menu_ul" class="nav-list">
    <li  >
    <a href="#" class="dropdown-toggle">
        <i class="icon-dashboard"></i>
        <span class="menu-text"> 个人中心 </span>
        <b class="arrow icon-angle-down"></b>
    </a>

    <ul class="submenu"  >
        <li  >
            <a href="${pageContext.request.contextPath}/person/home" >
                <i class="icon-double-angle-right"></i>
                个人概况
            </a>
        </li>
        <li >
            <a href="${pageContext.request.contextPath}/person/safe" >
                <i class="icon-double-angle-right"></i>
                安全中心
            </a>
        </li>
        <li >
            <a href="${pageContext.request.contextPath}/person/ticketPost" >
                <i class="icon-double-angle-right"></i>
                创建工单
            </a>
        </li>
        <li >
            <a href="${pageContext.request.contextPath}/person/myTickets" >
                <i class="icon-double-angle-right"></i>
                我的工单
            </a>
        </li>
    </ul>
</li>
<li >
    <a href="#" class="dropdown-toggle">
        <i class="icon-text-width"></i>
        <span class="menu-text"> 分析系统 </span>
        <b class="arrow icon-angle-down"></b>
    </a>
    <ul class="submenu" >
        <li >
            <a href="${pageContext.request.contextPath}/person/downloadsAnalysisPage" >
                <i class="icon-double-angle-right"></i>
                下载分析
            </a>
        </li>
        <li >
            <a href="${pageContext.request.contextPath}/person/incomeAnalysisPage" >
                <i class="icon-double-angle-right"></i>
                收入慨况
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="#" class="dropdown-toggle">
        <i class="icon-desktop"></i>
        <span class="menu-text"> 空间管理 </span>
        <b class="arrow icon-angle-down"></b>
    </a>

    <ul class="submenu">
        <li >
            <a href="${pageContext.request.contextPath}/person/uploadPage" >
                <i class="icon-double-angle-right"></i>
                上传文件
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/person/fileManagerPage">
                <i class="icon-double-angle-right"></i>
                文件管理
            </a>
        </li>
        <%--<li>--%>
            <%--<a href="${pageContext.request.contextPath}/person/fileSearchPage">--%>
                <%--<i class="icon-double-angle-right"></i>--%>
                <%--文件搜索--%>
            <%--</a>--%>
        <%--</li>--%>
        <li>
            <a href="${pageContext.request.contextPath}/person/filerecyclingPage">
                <i class="icon-double-angle-right"></i>
                文件回收站
            </a>
        </li>
    </ul>
</li>
    <c:if test="${userinfo.type eq '1'}">
        <li>
            <a href="#" class="dropdown-toggle">
                <i class="icon-tag"></i>
                <span class="menu-text"> 管理员功能 </span>
                <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
                <li >
                    <a href="${pageContext.request.contextPath}/person/userManager" >
                        <i class="icon-double-angle-right"></i>
                        用户管理
                    </a>
                </li>
                <li >
                    <a href="${pageContext.request.contextPath}/person/ticketManager" >
                        <i class="icon-double-angle-right"></i>
                        工单管理
                    </a>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-double-angle-right"></i>
                        公告管理
                        <b class="arrow icon-angle-down"></b>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a  href="${pageContext.request.contextPath}/person/announcePost">
                                <i class="icon-leaf"></i>
                                发布公告
                            </a>
                        </li>
                        <li>
                            <a  href="${pageContext.request.contextPath}/person/announceManager">
                                <i class="icon-eye-open"></i>
                                公告管理
                            </a>
                        </li>
                    </ul>
                </li>
                    <%--<li>--%>
                    <%--<a href="${pageContext.request.contextPath}/person/fileSearchPage">--%>
                    <%--<i class="icon-double-angle-right"></i>--%>
                    <%--文件搜索--%>
                    <%--</a>--%>
                    <%--</li>--%>
                <li>
                        <a href="#" class="dropdown-toggle">
                            <i class="icon-double-angle-right"></i>
                            消息管理
                            <b class="arrow icon-angle-down"></b>
                        </a>
                        <ul class="submenu">
                            <li>
                                <a  href="${pageContext.request.contextPath}/person/messageSend">
                                    <i class="icon-leaf"></i>
                                    发送消息
                                </a>
                            </li>
                            <li>
                                <a  href="${pageContext.request.contextPath}/person/messageManager">
                                    <i class="icon-eye-open"></i>
                                    消息查看
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            </ul>
        </li>
    </c:if>
</ul><!-- /.nav-list -->

<%--收缩按钮<div class="sidebar-collapse" id="sidebar-collapse">--%>
    <%--<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>--%>
<%--</div>--%>

<script type="text/javascript">
    try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
</script>
    <div class="text-warning bigger-110 orange">	<i class="icon-circle green"></i>
        网盘已用空间${used}Mb/500GB
    </div>
</div>

