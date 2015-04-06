<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
<!--头部-->
<div class="navbar navbar-default" id="navbar">
<script type="text/javascript">
    try{ace.settings.check('navbar' , 'fixed')}catch(e){}
    $(function(){
        //查询当前多少条未解决的工单
        var type=${userinfo.type};
        if(type=="1"){
            //查询未解决工单数
            $.ajax({
                type : "POST",
                url : "${pageContext.request.contextPath}/ticket/getUnTickets",
                dataType:"json",
                success : function(data) {
                        $("#Tick_tips").text(data.data);
                }
            });
        }

    });
    //点击查看消息
    function showMessages(){
        var user_id="${userinfo.id}";
        var counts=" ${messages}";
        //发送ajax消息查找
        $.ajax({
            type : "POST",
            url : "${pageContext.request.contextPath}/message/getMyMessages",
            dataType:"json",
            data :{
                userId:user_id
            },
            success : function(data) {
                var content="<li class=\"dropdown-header\"><i class=\"icon-envelope-alt\"></i>"+counts+"条消息</li>";
                if(data.success){
                    $.each(data.data,function(i,val){
                        content=content+"<li><a href=\"${pageContext.request.contextPath}/person/myMessage\"><img src=\"${pageContext.request.contextPath}/resources/img/admin.jpg\" class=\"msg-photo\" ><span class=\"msg-body\"><span class=\"msg-title\"><span class=\"blue\">管理员:</span>"+val.messageTitle.substr(0,10)+"</span> <span class=\"msg-time\"><span>"+val.sendTime+"</span></span></span> </a></li>" ;
                    });
                }
                content=content+"<li><a href=\"${pageContext.request.contextPath}/person/myMessage\">查看所有消息<i class=\"icon-arrow-right\"></i> </a> </li>";
                $("#messages_list").html(content);
            }
        });
    }
</script>

<div class="navbar-container" id="navbar-container">
<div class="navbar-header pull-left">
    <a href="#" class="navbar-brand">
        <small>
            <i class="icon-leaf"></i>
            个人中心
        </small>
    </a><!-- /.brand -->
</div><!-- /.navbar-header -->

<div class="navbar-header pull-right" role="navigation">
<ul class="nav ace-nav">
    <li class="green">
        <a data-toggle="dropdown" class="dropdown-toggle" href="#" onclick="showMessages()">
            <i class="icon-envelope"></i>
            <span class="badge badge-success">${messages}</span>
        </a>
        <ul id="messages_list" class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
        </ul>
    </li>
<li class="light-blue">
    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
        <img class="nav-user-photo" src="${pageContext.request.contextPath}/assets/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>欢迎光临,</small>
									${userinfo.username}
								</span>
        <span id="Tick_tips" class="badge"></span>
        <i class="icon-caret-down"></i>
    </a>

    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
        <li>
            <a href="${pageContext.request.contextPath}/person/home">
                <i class="icon-cog"></i>
                设置
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/person/home">
                <i class="icon-user"></i>
                个人资料
            </a>
        </li>

        <li class="divider"></li>

        <li>
            <a href="${pageContext.request.contextPath}/user/exit">
                <i class="icon-off"></i>
                退出
            </a>
        </li>
    </ul>
</li>
</ul><!-- /.ace-nav -->
</div><!-- /.navbar-header -->
</div><!-- /.container -->
</div>
