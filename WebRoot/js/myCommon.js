/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-2-9
 * Time: 上午2:30
 * To change this template use File | Settings | File Templates.
 */
    //验证规则：字母、数字、下划线组成，字母开头，5-16位。
function checkUser(str){
    var re = /^[a-zA-z]\w{4,15}$/;
    if(re.test(str)){
        return true;
    }else{
        return false;
    }
}
//验证规则 密码为6~16个字符，区分大小写
function checkPwd(str){
    var re=/[a-zA-Z0-9]{6,16}/
    if(re.test(str)){
        return true;
    }else{
        return false;
    }
}
//校验email
function checkEmail(str){
    var re=/^w+((-w+)|(.w+))*@[a-za-z0-9]+((.|-)[a-za-z0-9]+)*.[a-za-z0-9]+$/
    if(re.test(str)){
        return true;
    }else{
        return false;
    }
}
//自动登录
function checkLogin(root){
    //验证cookie是否记住
    var username=getCookieValue("username");
    var password=getCookieValue("password");
    if(username!=""&&password!=""){
        //获得cookie信息后发送到服务端验证
        $.ajax({
            type : "POST",
            url : root+"/user/autoLogin",
            data : {
                username : username,
                password : password
            },
            dataType:"json",
            success : function(data) {
                if(data.msg){
                    //表示自动登录成功
                    $("#my").html(username);
                    $("#rp_loginpad").hide();
                }
            },
            //请求出错的处理
            error:function(){
//                       alert("请求出错");
            }
        });
    }
}