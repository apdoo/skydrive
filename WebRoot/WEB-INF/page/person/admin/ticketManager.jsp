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
                    <li class="active">工单管理</li>
                </ul><!-- .breadcrumb -->

            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        工单管理
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
                                <p>
                                    <button class="btn btn-info" id="bootbox-ticket-update">回复</button>
                                </p>
                                <table id="ticket-table"></table>
                                <div id="ticket-pager"></div>
                                <script type="text/javascript">
                                    var $path_base = ".";//in Ace demo this will be used for editurl parameter
                                </script>
                            </div>
                        </div>
                        <div id="iframe" align="center">
                        </div>
                        <p id="check_tips" align="center">
                            <%--<button class="btn btn-info">待添加</button>--%>
                            <%--<button class="btn btn-success">待添加</button>--%>
                        </p>

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
<script  src="${pageContext.request.contextPath}/assets/js/jqGrid/i18n/grid.locale-en.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/flot/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootbox.min.js"></script>

<!-- ace scripts -->

<script src="${pageContext.request.contextPath}/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {
        initTable();
        //修改按钮事件
        $("#bootbox-ticket-update").on(ace.click_event, function() {
            var id = $("#ticket-table").jqGrid('getGridParam','selrow');//获得选中id
            if (id != null){
                var data = $("#ticket-table").jqGrid('getRowData', id);  //获得选中数据
                var fcontent="<div style='color: #2828FF'>"+"工单描述:"+data.content+"</div>";
                //根据当前工单的id查询工单回复记录 追加工单内容
                $.ajax({
                    type: "post",
                    dataType: "json",
                    url: "${pageContext.request.contextPath}/ticket/getTicketReplays",
                    data: {
                        ticketId:id
                    },
                    success: function(mydata) {
                        if(mydata.success){
                            $.each(mydata.data,function(i,val){
                                fcontent=fcontent+"<div style='color: #FF0000'>"+val.replayUserName+"回复:"+val.content+"</div>";
                            });
                        }
                        //获得具体的某个属性值 方式1 data["username"] 方式2 rowDatas.username
                        bootbox.dialog({
                            title: "工单回复",
                            message:"<form class=\"form-horizontal\" role=\"form\" id=\"ticket_detail_from\"  >" +
                                    "<input type=\"hidden\" name=\"id\" id=\"id\"' value=\""+data.id+"\" />"+
                                    "<div class=\"form-group\"> <label class=\"col-sm-3 control-label no-padding-right\" for=\"userName\"> 发布者:</label><div class=\"col-sm-9\"><input type=\"text\" id=\"userName\" name=\"userName\"  readonly=\"readonly\"   value=\""+data.userName+"\" class=\"col-xs-10 col-sm-5\"></div></div>" +
                                    "<div class=\"form-group\"> <label class=\"col-sm-3 control-label no-padding-right\" for=\"title\"> 标题:</label><div class=\"col-sm-9\"><input type=\"text\" id=\"title\" name=\"title\" readonly=\"readonly\"    value=\""+data.title+"\" class=\"col-xs-10 col-sm-5\"></div></div>" +
                                    "<div class=\"form-group\"> <label class=\"col-sm-3 control-label no-padding-right\" for=\"content\"> 工单记录:</label><div class=\"col-sm-9\"><div>"+fcontent+"</div></div></div>" +
                                    "<div class=\"form-group\"> <label class=\"col-sm-3 control-label no-padding-right\" for=\"content\"> 回复:</label><div class=\"col-sm-9\"><div class=\"wysiwyg-editor\"id=\"content\" contenteditable=\"true\"></div></div></div>" +
                                    "</form>",
                            buttons:
                            {
                                "success" :
                                {
                                    "label" : "<i class='icon-ok'></i> 提交",
                                    "className" : "btn-sm btn-success",
                                    "callback": function() {
                                        var type = $("#type").val();
                                        var id = $("#id").val();
                                        $.ajax({
                                            type: "post",
                                            dataType: "json",
                                            url: "${pageContext.request.contextPath}/ticket/insertTicketReplay",
                                            data: {
                                                userName:data.userName,
                                                userId:data.userId,
                                                ticketId:data.id,
                                                content:$("#content").html()
                                            },

                                            success: function(data) {
                                                $("#ticket-table").trigger("reloadGrid");
                                            }
                                        });
                                    }
                                },
                                "button" :
                                {
                                    "label" : "取消",
                                    "className" : "btn-sm"
                                }
                            }
                        });
                    }
                });

            }
        });
    });
    function initTable(){
        var grid_selector = "#ticket-table";
        var pager_selector = "#ticket-pager";
        //resize to fit page size
        jQuery(grid_selector).jqGrid({
            datatype: 'json',
            url: '${pageContext.request.contextPath}/ticket/getAllTickets',//
            mtype: 'post',//请求方式
            height: 250,
            colNames: ['id','userId','发送工单的用户','工单标题','内容','status','工单状态','创建时间'],
            colModel: [
                {name:'id',index:'id', width:60,hidden:true},
                {name:'userId',index:'userId', width:60,hidden:true},
                {name:'userName',index:'userName', width:300},
                {name:'title',index:'title', width:400},
                {name:'content',index:'content', hidden:true},
                {name:'status',index:'status',  hidden:true},
                {name:'status',index:'status', formatter:statusFormatter,width:100},
                {name:'createTime',index:'createTime', width:200}
            ],
//            jsonReader:{ repeatitems: false },
            viewrecords : true,
            sortname: "id",
            sortorder: "asc",
            rowNum:8,
//            rowList:[10,20,30],
            rownumbers:true,
            pager : pager_selector,
            caption: "工单列表",
            multiselect: true,
            multiboxonly: true,
            loadComplete : function() {
                var table = this;
                setTimeout(function(){
                    updatePagerIcons(table);
                }, 0);
            },
            autowidth: true

        });
    }
    function statusFormatter(cellValue){
        if(cellValue=="0"){
            return "未解决";
        }
          return "已解决";

    }
    function updatePagerIcons(table) {
        var replacement =
        {
            'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
            'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
            'ui-icon-seek-next' : 'icon-angle-right bigger-140',
            'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
        };
        $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
            var icon = $(this);
            var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

            if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
        })
    }
</script>
</body>
</html>

