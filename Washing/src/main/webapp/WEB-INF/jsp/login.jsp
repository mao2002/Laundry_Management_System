<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/6/17
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        洗衣店后台管理登录
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/MycommonUtil.js"></script>
</head>
<body>
<div class="container-fluid">

    <div class="row" style="margin-top: 91px">
       <div class="col-sm-4 col-sm-offset-4">
<%--            TODO my--%>
           <div style="background-color: rgba(0, 0, 0, 0.4);padding: 20px">
            <h3 class="text-center">洗衣店管理系统</h3>
            <form id="insert_form">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">工号</div>
                        <input type="tel" class="form-control" id="exampleInputphone" placeholder="工号" oninput="this.value=this.value.replace(/\D/g,'')">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">密码</div>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="密码" oninput="value=value.replace(/[^\w\.\/]/ig,'')">
                    </div>
                </div>
                <div class="checkbox">
                    <label>
                        权限
                        <input type="radio" name="quanxian" value="false" checked="true">管理员
                        <input type="radio" name="quanxian" value="true">最高管理员
                    </label>
                </div>
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-4">
                        <button type="button" class="btn btn-info" id="btn_insert">登录</button>
                    </div>
                </div>
            </form>
                </div>
            <script>
                $(function () {
                    $('#btn_insert').click(function () {
                        var obj = {};
                        obj.yh_id = $("#exampleInputphone").val();
                        obj.pw = $("#exampleInputPassword1").val();
                        var res = JSON.stringify(obj);
                        var select=$("input[name='quanxian']:checked").val();
                        if(select=="false"){
                            var urllogin="${pageContext.request.contextPath}/guanli";
                        }
                        else{
                            var urllogin="${pageContext.request.contextPath}/max";
                        }
                        $.ajax({
                            url: urllogin,
                            type: "post",
                            contentType: "application/json",
                            data: res,
                            success(data){
                                end(data);
                            }
                        })
                    });
                })
                function end(data){
                    if(data.state){
                        MycommonUtil.message("登录成功,预计4秒后进入系统", "success");
                        var select=$("input[name='quanxian']:checked").val();
                        var urllogin="${pageContext.request.contextPath}/"+data.msg+"/"+select+"/guanli";
                        setTimeout(function(){
                            window.location.href=urllogin;
                        },4000);
                    }else if(data.state==false){
                        MycommonUtil.message(data.msg, "danger");
                    }else{
                        MycommonUtil.message("服务端异常","danger");
                    }
                }
            </script>
        </div>
    </div>
</div>
</body>
</html>
