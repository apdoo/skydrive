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
    <title>91网盘-个人中心</title>
    <!-- basic styles -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery.gritter.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-editable.css" />
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
        <li class="active">个人概况</li>
    </ul><!-- .breadcrumb -->

</div>

<div class="page-content">
<div class="page-header">
    <h1>
       个人概况
        <small>
            <i class="icon-double-angle-right"></i>
            查看
        </small>
    </h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
<!-- PAGE CONTENT BEGINS -->
    <div class="clearfix">
        <div class="pull-left alert alert-success no-margin">
            <button type="button" class="close" data-dismiss="alert">
                <i class="icon-remove"></i>
            </button>
            点击图片进行更换头像 ...
        </div>
    </div>
    <div class="hr dotted"></div>
<div>
<div id="user-profile-1" class="user-profile row">
<div class="col-xs-12 col-sm-3 center">
       <div>
												<span class="profile-picture">
                                                    <c:if test="${userinfo.temp=='0'}">
                                                        <img id="avatar" class="editable img-responsive editable-click editable-empty" alt="Alex's Avatar" src="${pageContext.request.contextPath}/assets/avatars/profile-pic.jpg"/>
                                                    </c:if>
                                                   <c:if test="${userinfo.temp=='1'}">
                                                       <img id="avatar" class="editable img-responsive editable-click editable-empty" alt="Alex's Avatar" src="${pageContext.request.contextPath}/resources/img/avatar/avatar_${userinfo.id}.jpg"/>
                                                   </c:if>
											    </span>

        <div class="space-4"></div>

        <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
            <div class="inline position-relative">
                <a href="#" class="user-title-label dropdown-toggle" data-toggle="dropdown">
                    <span class="white">${userinfo.username}</span>
                </a>
            </div>
        </div>
    </div>

    <div class="space-6"></div>

    <div class="profile-contact-info">
        <div class="space-6"></div>
        <div class="profile-social-links center">
        </div>
    </div>

    <div class="hr hr12 dotted"></div>

    <div class="clearfix">
        <div class="grid2">
            <span class="bigger-175 blue">${uploads}</span>

            <br>
            上传文件数
        </div>

        <div class="grid2">
            <span class="bigger-175 blue">${downloads}</span>

            <br>
            文件被下载数
        </div>
    </div>

    <div class="hr hr16 dotted"></div>
</div>

<div class="col-xs-12 col-sm-9">

<div class="space-12"></div>

<div class="profile-user-info profile-user-info-striped">
    <div class="profile-info-row">
        <div class="profile-info-name"> 用户名 </div>

        <div class="profile-info-value">
            <span >${userinfo.username}</span>
        </div>
    </div>

    <div class="profile-info-row">
        <div class="profile-info-name"> 邮箱 </div>

        <div class="profile-info-value">
            <span >${userinfo.email}</span>
        </div>
    </div>

    <div class="profile-info-row">
        <div class="profile-info-name"> 注册时间 </div>

        <div class="profile-info-value">
            <span >${userinfo.signupTime}</span>
        </div>
    </div>

    <div class="profile-info-row">
        <div class="profile-info-name"> 总容量 </div>

        <div class="profile-info-value">
            <span >500 G</span>
        </div>
    </div>

    <div class="profile-info-row">
        <div class="profile-info-name"> 登陆ip </div>
        <div class="profile-info-value">
            <span >${userinfo.loginIp}</span>
        </div>
    </div>

    <div class="profile-info-row">
        <div class="profile-info-name"> 最后登陆时间 </div>

        <div class="profile-info-value">
            <span >${userinfo.loginTime}</span>
        </div>
    </div>
</div>

<div class="space-20"></div>



<div class="hr hr2 hr-double"></div>

<div class="space-6"></div>

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
<script src="${pageContext.request.contextPath}/assets/js/jquery.gritter.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.hotkeys.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/fuelux/fuelux.spinner.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/x-editable/bootstrap-editable.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/x-editable/ace-editable.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.maskedinput.min.js"></script>

<!-- ace scripts -->

<script src="${pageContext.request.contextPath}/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
jQuery(function($) {
    //editables on first profile page
    $.fn.editable.defaults.mode = 'inline';
    $.fn.editableform.loading = "<div class='editableform-loading'><i class='light-blue icon-2x icon-spinner icon-spin'></i></div>";
    $.fn.editableform.buttons = '<button type="submit"  class="btn btn-info editable-submit"><i class="icon-ok icon-white"></i></button>'+
            '<button type="button" class="btn editable-cancel"><i class="icon-remove"></i></button>';
    // *** editable avatar *** //
    try {//ie8 throws some harmless exception, so let's catch it
        //it seems that editable plugin calls appendChild, and as Image doesn't have it, it causes errors on IE at unpredicted points
        //so let's have a fake appendChild for it!
        if( /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ) Image.prototype.appendChild = function(el){}
        var last_gritter
        $('#avatar').editable({
            type: 'image',
            name: 'avatar',
            value: null,
            image: {
                //specify ace file input plugin's options here
                btn_choose: '上传头像',
                droppable: true,
                /**
                 //this will override the default before_change that only accepts image files
                 before_change: function(files, dropped) {
								return true;
							},
                 */
                //and a few extra ones here
                name: 'avatar',//put the field name here as well, will be used inside the custom plugin
                max_size: 130000,//~100Kb
                on_error : function(code) {//on_error function will be called when the selected file has a problem
                    if(last_gritter) $.gritter.remove(last_gritter);
                    if(code == 1) {//file format error
                        last_gritter = $.gritter.add({
                            title: '这不是一个图片文件!',
                            text: '支持格式 jpg|gif|png',
                            class_name: 'gritter-error gritter-center'
                        });
                    } else if(code == 2) {//file size rror
                        last_gritter = $.gritter.add({
                            title: '图片文件太大了!',
                            text: '图片不能超过 120Kb!',
                            class_name: 'gritter-error gritter-center'
                        });
                    }
                    else {//other error
                    }
                },
                on_success : function() {
                    $.gritter.removeAll();
                }
            },
            url: function(params) {
                // ***UPDATE AVATAR HERE*** //
                //You can replace the contents of this function with examples/profile-avatar-update.js for actual upload
                var deferred = new $.Deferred
                //if value is empty, means no valid files were selected
                //but it may still be submitted by the plugin, because "" (empty string) is different from previous non-empty value whatever it was
                //so we return just here to prevent problems
                var value = $('#avatar').next().find('input[type=hidden]:eq(0)').val();
                if(!value || value.length == 0) {
                    deferred.resolve();
                    return deferred.promise();
                }
                //dummy upload
                setTimeout(function(){
                    if("FileReader" in window) {
                        //for browsers that have a thumbnail of selected image
                        var thumb = $('#avatar').next().find('img').data('thumb'); //图片数据
                        if(thumb) $('#avatar').get(0).src = thumb;
                    }

                    deferred.resolve({'status':'OK'});

                    if(last_gritter) $.gritter.remove(last_gritter);
                    last_gritter = $.gritter.add({
                        title: '头像更新!',
                        text: '头像已经更新!.',
                        class_name: 'gritter-info gritter-center'
                    });

                } , parseInt(Math.random() * 800 + 800))

                return deferred.promise();
            },

            success: function(response, newValue) {
                var thumb = $('#avatar').next().find('img').data('thumb'); //图片数据
//                alert(thumb);
               //上传头像到服务端
                $.ajax({
                    type : "POST",
                    url : "${pageContext.request.contextPath}/user/modifyAvatar",
                    dataType:"json",
                    data : {
                        base64:thumb
                    },
                    success : function(data) {
                    },
                    error:function(){
                    }
                });
            }
        })
    }catch(e) {}



    //another option is using modals
    $('#avatar2').on('click', function(){
        var modal =
                '<div class="modal hide fade">\
                    <div class="modal-header">\
                        <button type="button" class="close" data-dismiss="modal">&times;</button>\
                        <h4 class="blue">Change Avatar</h4>\
                    </div>\
                    \
                    <form class="no-margin">\
                    <div class="modal-body">\
                        <div class="space-4"></div>\
                        <div style="width:75%;margin-left:12%;"><input type="file" name="file-input" /></div>\
                    </div>\
                    \
                    <div class="modal-footer center">\
                        <button type="submit" class="btn btn-small btn-success"><i class="icon-ok"></i> Submit</button>\
                        <button type="button" class="btn btn-small" data-dismiss="modal"><i class="icon-remove"></i> Cancel</button>\
                    </div>\
                    </form>\
                </div>';


        var modal = $(modal);
        modal.modal("show").on("hidden", function(){
            modal.remove();
        });

        var working = false;

        var form = modal.find('form:eq(0)');
        var file = form.find('input[type=file]').eq(0);
        file.ace_file_input({
            style:'well',
            btn_choose:'Click to choose new avatar',
            btn_change:null,
            no_icon:'icon-picture',
            thumbnail:'small',
            before_remove: function() {
                //don't remove/reset files while being uploaded
                return !working;
            },
            before_change: function(files, dropped) {
                var file = files[0];
                if(typeof file === "string") {
                    //file is just a file name here (in browsers that don't support FileReader API)
                    if(! (/\.(jpe?g|png|gif)$/i).test(file) ) return false;
                }
                else {//file is a File object
                    var type = $.trim(file.type);
                    if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif)$/i).test(type) )
                            || ( type.length == 0 && ! (/\.(jpe?g|png|gif)$/i).test(file.name) )//for android default browser!
                            ) return false;

                    if( file.size > 110000 ) {//~100Kb
                        return false;
                    }
                }

                return true;
            }
        });

        form.on('submit', function(){
            if(!file.data('ace_input_files')) return false;

            file.ace_file_input('disable');
            form.find('button').attr('disabled', 'disabled');
            form.find('.modal-body').append("<div class='center'><i class='icon-spinner icon-spin bigger-150 orange'></i></div>");

            var deferred = new $.Deferred;
            working = true;
            deferred.done(function() {
                form.find('button').removeAttr('disabled');
                form.find('input[type=file]').ace_file_input('enable');
                form.find('.modal-body > :last-child').remove();

                modal.modal("hide");

                var thumb = file.next().find('img').data('thumb');
                if(thumb) $('#avatar2').get(0).src = thumb;

                working = false;
            });


            setTimeout(function(){
                deferred.resolve();
            } , parseInt(Math.random() * 800 + 800));

            return false;
        });

    });



    //////////////////////////////
    $('#profile-feed-1').slimScroll({
        height: '250px',
        alwaysVisible : true
    });

    $('.profile-social-links > a').tooltip();

    $('.easy-pie-chart.percentage').each(function(){
        var barColor = $(this).data('color') || '#555';
        var trackColor = '#E2E2E2';
        var size = parseInt($(this).data('size')) || 72;
        $(this).easyPieChart({
            barColor: barColor,
            trackColor: trackColor,
            scaleColor: false,
            lineCap: 'butt',
            lineWidth: parseInt(size/10),
            animate:false,
            size: size
        }).css('color', barColor);
    });

    ///////////////////////////////////////////

    //show the user info on right or left depending on its position
    $('#user-profile-2 .memberdiv').on('mouseenter', function(){
        var $this = $(this);
        var $parent = $this.closest('.tab-pane');

        var off1 = $parent.offset();
        var w1 = $parent.width();

        var off2 = $this.offset();
        var w2 = $this.width();

        var place = 'left';
        if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) place = 'right';

        $this.find('.popover').removeClass('right left').addClass(place);
    }).on('click', function() {
                return false;
            });


    ///////////////////////////////////////////
    $('#user-profile-3')
            .find('input[type=file]').ace_file_input({
                style:'well',
                btn_choose:'Change avatar',
                btn_change:null,
                no_icon:'icon-picture',
                thumbnail:'large',
                droppable:true,
                before_change: function(files, dropped) {
                    var file = files[0];
                    if(typeof file === "string") {//files is just a file name here (in browsers that don't support FileReader API)
                        if(! (/\.(jpe?g|png|gif)$/i).test(file) ) return false;
                    }
                    else {//file is a File object
                        var type = $.trim(file.type);
                        if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif)$/i).test(type) )
                                || ( type.length == 0 && ! (/\.(jpe?g|png|gif)$/i).test(file.name) )//for android default browser!
                                ) return false;

                        if( file.size > 110000 ) {//~100Kb
                            return false;
                        }
                    }

                    return true;
                }
            })
            .end().find('button[type=reset]').on(ace.click_event, function(){
                $('#user-profile-3 input[type=file]').ace_file_input('reset_input');
            })
            .end().find('.date-picker').datepicker().next().on(ace.click_event, function(){
                $(this).prev().focus();
            })
    $('.input-mask-phone').mask('(999) 999-9999');



    ////////////////////
    //change profile
    $('[data-toggle="buttons"] .btn').on('click', function(e){
        var target = $(this).find('input[type=radio]');
        var which = parseInt(target.val());
        $('.user-profile').parent().addClass('hide');
        $('#user-profile-'+which).parent().removeClass('hide');
    });
});
</script>
</body>
</html>

