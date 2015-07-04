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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ui.jqgrid.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/datepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-timepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/daterangepicker.css" />

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
                    <li class="active">上传文件</li>
                </ul><!-- .breadcrumb -->

            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        上传文件
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
                        <%--<div class="row">--%>
                            <%--<div class="col-xs-12">--%>
                                <%--<table id="collectlogs_table"></table>--%>
                                <%--<div id="collectlogs_pager"></div>--%>
                                <%--<script type="text/javascript">--%>
                                    <%--var $path_base = ".";//in Ace demo this will be used for editurl parameter--%>
                                <%--</script>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                        <br/>
                        <div class="col-xs-12 col-sm-4">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4>选择网站</h4>
                                </div>
                                <div class="widget-body"><div class="widget-body-inner" style="display: block;">
                                    <div class="widget-main">
                                        <div>
                                            <label for="webSite">发帖站</label>
                                            <select class="form-control" id="webSite">
                                                <option value="新巴黎">新巴黎</option>
                                                <option value="MM公寓">MM公寓</option>
                                                <option value="御花王朝">御花王朝</option>
                                            </select>
                                        </div>
                                        <hr>
                                        <div>
                                            <label for="section">发帖版块</label>
                                            <select class="form-control" id="section" multiple="multiple">
                                            </select>
                                        </div>
                                        <hr>
                                        <label for="updatetime">选择采集时间:</label>
                                        <div class="input-group">
                                            <input class="form-control date-picker" id="updatetime" type="text" data-date-format="yyyy-mm-dd" />
                                                                <span class="input-group-addon">
                                                                    <i class="icon-calendar bigger-110"></i>
                                                                </span>
                                        </div>
                                        <hr>
                                        <div>
                                            <label for="collectlogs_section">采集类型</label>
                                            <select class="form-control" id="collectlogs_section">
                                                <option value="yazhouwuma">亚洲无码</option>
                                                <option value="oumeiwuma">欧美无码</option>
                                                <option value="ribenyouma">日本骑兵</option>
                                                <option value="sanjizipai">三级写真</option>
                                                <option value="heji">合集</option>
                                            </select>
                                        </div>
                                        <hr>
                                        <div>
                                            <label class="col-sm-3 control-label no-padding-right" for="withfile"> 是否上传附件 </label>
                                                <label>
                                                    <input id="withfile" name="switch-field-1" checked="checked" class="ace ace-switch ace-switch-5" type="checkbox">
                                                    <span class="lbl"></span>
                                                </label>
                                        </div>
                                        <hr>
                                        <div>
                                           <span class="input-group-btn">
                                                    <button id="start_search" onclick="start_search()" type="button" class="btn btn-purple btn-sm">
                                                        查看
                                                        <i class="icon-search icon-on-right bigger-110"></i>
                                                    </button>
                                                   <button onclick="start_post()" class="btn btn-info btn-sm" type="button">
                                                       <i class="icon-ok icon-on-right bigger-110"></i>
                                                       发布
                                                   </button>
								            </span>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 id="collectlogs_list_title">采集列表</h4>
                                </div>
                                <div class="widget-body">
                                    <div  class="widget-main">
                                        <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th class="center">
                                                    <label>
                                                        <%--<input type="checkbox" class="ace">--%>
                                                        <span class="lbl"></span>
                                                    </label>
                                                </th>
                                                <th>类型</th>
                                                <th>名字</th>
                                                <th>
                                                    <i class="icon-time bigger-110 hidden-480"></i>
                                                    时间
                                                </th>
                                            </tr>
                                            </thead>

                                            <tbody id="collectlogs_lists">

                                            </tbody>
                                        </table>
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

<script src="${pageContext.request.contextPath}/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jqGrid/i18n/grid.locale-en.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/date-time/bootstrap-timepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/date-time/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/date-time/daterangepicker.min.js"></script>
<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {
//        init_table();
        $( "#updatetime" ).datepicker( 'setDate' , new Date());//设置date-picker默认时间
        init_xinbali();
        $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
            $(this).prev().focus();
        });
        //选择网站绑定下拉框change
        $("#webSite").change(function(){
            var webSite=$(this).children('option:selected').val();//获得选中的版块
            if(webSite=="新巴黎"){
                init_xinbali();
            }else if(webSite=="MM公寓"){
                init_mm();
            } else if(webSite=="御花王朝"){
                init_wangchao();
            }
        });
    });
    /**
     * 调用发布程序开始发布
     * */
    function start_post(){
        var webSite=$("#webSite").val(); //发布站点
        var section=$("#section").val(); //发布版块
        var bischecked=$('#withfile').is(':checked');  //是否上传附件
        var ids="";
        $("input[checked=checked]").each(function(i,val){//遍历勾选的checkbox 获得采集的种子的id
            if($(val).is(':checked')) {//只有选中的才进行发布
//                console.info($(val).val());
                ids=ids+$(val).val()+",";
            }
        });
        //调用发布程序
        $.ajax({
            type:'post',
            dataType:'json',
            url:'${pageContext.request.contextPath}/website/startPost',
            data:{
                ids:ids,
                webSite:webSite,
                bischecked:bischecked,
                section:section[0]//此处section在var的时候认为是数组
            },
         success:function(data){
                alert(data.data);
         },
         error:function(){

         }
        });

    }

    /***
     * 根据查询条件查询存在的种子记录
     * */
    function start_search(){
        var updatetime=$("#updatetime").val();//采集时间
        var collectlogs_section=$("#collectlogs_section").val(); //采集类型
        //保证四个选项都有
        $("#collectlogs_list_title").text(updatetime+"|采集列表");
        $.ajax({
            type: "post",
            dataType: "json",
            url: "${pageContext.request.contextPath}/website/showCollectLogsByParam",
            data: {
                collectlogs_section:collectlogs_section,
                updatetime:updatetime
            },

            success: function(data) {
                var content="";
                $.each(data.data,function(i,val){
                    content=content+"<tr><td class=\"center\"><label><input type=\"checkbox\" checked=\"checked\" value=\""+val.id+"\" class=\"ace\"><span class=\"lbl\"></span></label></td>"+
                                    "<td>"+val.section+"</td>"+
                                    "<td>"+val.name+"</td>" +
                                    "<td>"+val.updatetime+"</td></tr>"
                                    ;
                });
                $("#collectlogs_lists").html(content);
            }
        });
    }

    /**
     *采集种子列表初始化
     */
    function init_table() {
        jQuery("#collectlogs_table").jqGrid({
            datatype: "json", //将这里改为使用JSON数据 website/getCollectLogs
            url:"${pageContext.request.contextPath}/website/getCollectLogs",
            mtype: 'POST',
            height: 250,
            colNames:['id','名字','类型'],
            colModel:[
                {name:'id',index:'id', width:60, hidden:true},
                {name:'name',index:'name', width:600},
                {name:'section',index:'section', width:200},
            ],
            pager: 'collectlogs_pager', //分页工具栏
            rowNum:10, //每页显示记录数
            viewrecords : true,
            multiboxonly: true,
            rowList:[10,20,30], //可调整每页显示的记录数
            multiselect: true, //是否支持多选
            caption: "种子列表",
            autowidth: true
        });
    }
    /**
    *新巴黎版块初始化
     */
    function init_xinbali(){
        $("#section").html(
                "<option selected=\"selected\" value=\"25|亚洲无码下载区\">25|亚洲无码下载区</option>" +
                "<option value=\"75|亚洲有码下载区\">75|亚洲有码下载区</option>"+
                "<option value=\"26|欧美无码下载区\">26|欧美无码下载区</option>"+
                "<option value=\"28|网盘下载区\">28|网盘下载区</option>"+
                "<option value=\"29|迅雷/电驴下载区\">29|迅雷/电驴下载区</option>"+
                "<option value=\"30|情色三级转帖区\">30|情色三级转帖区</option>"+
                "<option value=\"27|动漫无码转贴区\">27|动漫无码转贴区</option>"+
                "<option value=\"15|新人试贴区\">15|新人试贴区</option>"+
                "<option value=\"22|明星图片区\">22|明星图片区</option>"+
                "<option value=\"18|亚洲图片区\">18|亚洲图片区</option>"+
                "<option value=\"19|欧美图片区\">19|欧美图片区</option>"+
                "<option value=\"20|自拍偷拍区\">20|自拍偷拍区</option>"+
                "<option value=\"21|卡通漫画区\">21|卡通漫画区</option>"+
                "<option value=\"39|精品套图区\">39|精品套图区</option>"+
        "");
    }
    /**
    * 初始化MM公寓
     */
    function init_mm(){
        $("#section").html(
                "<option selected=\"selected\" value=\"117|P 2 P 亞 視\">117|P 2 P 亞 視</option>" +
                "<option value=\"430|电 驴 下 载\">430|电 驴 下 载</option>"+
                "<option value=\"118|P 2 P 歐 美\">118|P 2 P 歐 美</option>"+
                "<option value=\"396|网 盘 免 空\">396|网 盘 免 空</option>"+
                "<option value=\"116|迅 雷 影 視\">116|迅 雷 影 視</option>"+
                "<option value=\"397|P 2 P 三 级\">397|P 2 P 三 级</option>"+
                "<option value=\"232|P 2 P 动 漫\">232|P 2 P 动 漫</option>"+
                "<option value=\"492|〓 新 人 图 片 试 帖 〓\">492|〓 新 人 图 片 试 帖 〓</option>"+
                "<option value=\"369|〓 會 員 自 拍 〓\">369|〓 會 員 自 拍 〓</option>"+
                "<option value=\"74|〓 套 圖 下 載 〓\">74|〓 套 圖 下 載 〓</option>"+
                "<option value=\"34|〓 東 方 美 眉 〓\">34|〓 東 方 美 眉 〓</option>"+
                "<option value=\"35|〓 西 方 美 女 〓\">35|〓 西 方 美 女 〓</option>"+
                "<option value=\"36|〓 自 拍 偷 拍 〓\">36|〓 自 拍 偷 拍 〓</option>"+
                "<option value=\"73|〓 卡 通 動 漫 〓\">73|〓 卡 通 動 漫 〓</option>"+
                "<option value=\"75|〓 泳 装 絲 襪 〓\">75|〓 泳 装 絲 襪 〓</option>"+
                "<option value=\"72|〓 明 星 貼 圖 〓\">72|〓 明 星 貼 圖 〓</option>"+
                "<option value=\"76|〓 唯 美 貼 圖 〓\">76|〓 唯 美 貼 圖 〓</option>"+
                "<option value=\"491|〓 新 人 小 说 试 帖 〓\">491|〓 新 人 小 说 试 帖 〓</option>"+
                "<option value=\"389|〓 Ebook 小說 〓\">389|〓 Ebook 小說 〓</option>"+
                "<option value=\"236|〓 有 声 有 色 〓\">236|〓 有 声 有 色 〓</option>"+
                "<option value=\"77|〓 现 代 迷 情 〓\">77|〓 现 代 迷 情 〓</option>"+
                "<option value=\"44|〓 乱 伦 人 妻 〓\">44|〓 乱 伦 人 妻 〓</option>"+
                "<option value=\"47|〓 武 侠 玄 幻 〓\">47|〓 武 侠 玄 幻 〓</option>"+
                "");
    }
    /**
    *初始化御花王朝
     */
    function init_wangchao(){
        $("#section").html(
                "<option selected=\"selected\" value=\"26|王朝亚洲影视专区\">26|王朝亚洲影视专区</option>" +
                "<option value=\"27|王朝欧美影视专区\">27|王朝欧美影视专区</option>"+
                "<option value=\"224|王朝网盘下载专区\">224|王朝网盘下载专区</option>"+
                "<option value=\"29|王朝迅雷影视专区\">29|王朝迅雷影视专区</option>"+
                "<option value=\"64|王朝三级影视专区\">64|王朝三级影视专区</option>"+
                "<option value=\"65|亚洲有码专区\">65|亚洲有码专区</option>"+
                "<option value=\"66|亚洲无码专区\">66|亚洲无码专区</option>"+
                "<option value=\"28|王朝动漫影视专区\">28|王朝动漫影视专区</option>"+
                "<option value=\"220|王朝自拍偷拍區\">220|王朝自拍偷拍區</option>"+
                "<option value=\"18|王朝日韩貼圖區\">18|王朝日韩貼圖區</option>"+
                "<option value=\"19|王朝欧洲貼圖區\">19|王朝欧洲貼圖區</option>"+
                "<option value=\"20|王朝写真丝袜區\">20|王朝写真丝袜區</option>"+
                "<option value=\"21|王朝卡通成人區\">21|王朝卡通成人區</option>"+
                "<option value=\"23|王朝明星合成區\">23|王朝明星合成區</option>"+
                "<option value=\"302|王朝同性贴图區\">302|王朝同性贴图區</option>"+
                "<option value=\"16|王朝激情乱伦區\">16|王朝激情乱伦區</option>"+
                "<option value=\"15|王朝现代都市區\">15|王朝现代都市區</option>"+
                "<option value=\"17|王朝武侠另类區\">17|王朝武侠另类區</option>"+
                "<option value=\"298|Ebook-名家合集\">298|Ebook-名家合集</option>"+
                "");
    }
</script>
<!-- inline scripts related to this page -->
</body>
</html>

