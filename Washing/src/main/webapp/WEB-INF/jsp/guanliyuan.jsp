<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/6/15
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        洗衣店后台管理系统
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/MycommonUtil.js"></script>
</head>
<%--<body style="--%>
<%--background-size:100% 100%;--%>
<%--background: url(${pageContext.request.contextPath}/resources/img/lib.jpg) no-repeat fixed;">--%>
<!--导航条-->
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <!--button是手机版自适应用的-->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">洗衣机后台管理系统 <small> v1.0</small></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li id="welcome"></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--主内容-->
<div class="row">
    <div class="col-sm-2">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            <span class="glyphicon glyphicon-user"> 用户管理</span>
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="javascript:;" id="yonghubtn">用户信息管理</a></li>
                            <script>
                                $(function (){
                                    $("#yonghubtn").click(function (){
                                        $("#content").load("${pageContext.request.contextPath}/yonghulist");
                                    });
                                })
                            </script>
                            <li class="list-group-item"><a href="javascript:;" id="huiyuanbtn">会员信息管理</a></li>
                            <script>
                                $(function (){
                                    $("#huiyuanbtn").click(function (){
                                        $("#content").load("${pageContext.request.contextPath}/huiyuanlist");
                                    });
                                })
                            </script>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true">
                            <span class="glyphicon glyphicon-pencil"> 订单项目管理</span>
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel">
                    <div class="panel-body">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="javascript:;" id="dingdanbtn">订单管理</a></li>
                            <script>
                                $(function (){
                                    $("#dingdanbtn").click(function (){
                                        $("#content").load("${pageContext.request.contextPath}/dingdanlist");
                                    });
                                })
                            </script>
                            <li class="list-group-item"><a href="javascript:;" id="xiangmubtn">项目管理</a></li>
                            <script>
                                $(function (){
                                    $("#xiangmubtn").click(function (){
                                        $("#content").load("${pageContext.request.contextPath}/xiangmulist");
                                    });
                                })
                            </script>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default" id="content_max"></div>
            <script>
                $(function (){
                          if(${select}){
                              //TODO 由于WEB-INF下的jsp页面不能通过地址栏直接访问，必须要经过后台转发，才可以实现页面的跳转
                              $("#content_max").load("${pageContext.request.contextPath}/maxguanliyuan");
                              $("#welcome").html('<a>欢迎最高管理员：${name}'+'</a>');
                          }
                          else{
                              $("#welcome").html('<a>欢迎管理员：${name}'+'</a>');
                          }
                })
            </script>
        </div>
    </div>
    <script>
        function end(data,link){
            console.log(data.msg)
            console.log(data.state)
            if(data.state){
                MycommonUtil.message(data.msg, "success");
                $("#btn_insert").attr('disabled',"true");
                setTimeout(function(){
                    $("#content").load(link);
                },1000);
            }else if(data.state==false){
                MycommonUtil.message(data.msg, "danger");
            }else{
                MycommonUtil.message("服务端异常,请联系工作人员","danger");
            }
        }
    </script>
    <div id="content">
        <div class="col-sm-10">
            <div class="jumbotron">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                        <h1>Hello, world!</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
