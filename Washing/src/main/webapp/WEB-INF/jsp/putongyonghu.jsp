<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-9 col-sm-offset-1">
<%--    TODO my--%>
    <div>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">用户列表</a></li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">添加用户</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">
                <table class="table">
                    <thead>
                    <tr>
                        <th>用户编号</th>
                        <th>用户姓名</th>
                        <th>密码</th>
                        <th>手机号码</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>家庭住址</th>
                        <th>是否会员</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${yonghu}" var="yh">
                        <tr>
                            <td>${yh.yh_id}</td>
                            <td>${yh.name}</td>
                            <td>${yh.pw}</td>
                            <td>${yh.yh_phone}</td>
                            <td>${yh.sex}</td>
                            <td>${yh.age}</td>
                            <td>${yh.home}</td>
                            <td>${yh.hui}</td>
                            <td>
                                <a onclick="delete_yonghu(${yh.yh_id});" class="btn btn-danger btn-sm">删除</a>
                                <button type="button"  onclick="update($(this));" class="btn btn-info btn-sm" data-toggle="modal" data-target="#update">
                                    修改
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-8 col-lg-offset-1">
                                <form id="insert_form">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">用户姓名</div>
                                            <input type="text" class="form-control" id="exampleInputname" placeholder="用户姓名" oninput="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">密码</div>
                                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="密码" oninput="value=value.replace(/[^\w\.\/]/ig,'')">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">手机号码</div>
                                            <input type="tel" class="form-control" id="exampleInputphone" placeholder="手机号码" oninput="if(value.length>11)value=value.slice(0,11);this.value=this.value.replace(/\D/g,'')">
                                        </div>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            性别
                                            <input type="radio" name="sex" value="男" checked="true">男
                                            <input type="radio" name="sex" value="女">女
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group" style="width: 35%">
                                            <div class="input-group-addon">年龄</div>
                                            <input type="text" class="form-control" id="exampleInputage" placeholder="年龄" oninput="if(value>130)value=130;if(value<0)value=0;this.value=this.value.replace(/\D/g,'')">
                                            <div class="input-group-addon">岁</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputhome">家庭住址</label>
                                        <input type="text" class="form-control" id="exampleInputhome" placeholder="家庭住址">
                                    </div>
                                    <button type="button" class="btn btn-info" id="btn_insert">提交</button>
                                    <button type="reset" class="btn btn-default">取消</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="update" tabindex="-1" role="dialog" data-backdrop="false" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">修改信息</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="exampleInputname_up">用户姓名</label>
                        <input type="text" class="form-control" id="exampleInputname_up" placeholder="用户姓名" oninput="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1_up">密码</label>
                        <input type="password" class="form-control" id="exampleInputPassword1_up" placeholder="密码" oninput="value=value.replace(/[^\w\.\/]/ig,'')">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputphone_up">手机号码</label>
                        <input type="tel" class="form-control" id="exampleInputphone_up" placeholder="手机号码" oninput="if(value.length>11)value=value.slice(0,11);this.value=this.value.replace(/\D/g,'')">
                    </div>
                    <div class="checkbox">
                        <label>
                            性别
                            <input type="radio" id="male" name="sex_up" value="男" checked="true">男
                            <input type="radio" id="female" name="sex_up" value="女">女
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputage_up">年龄</label>
                        <div class="input-group" style="width: 35%">
                            <input type="text" class="form-control" id="exampleInputage_up" placeholder="年龄" oninput="if(value>130)value=130;if(value<0)value=0;this.value=this.value.replace(/\D/g,'')">
                            <div class="input-group-addon">岁</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputhome_up">家庭住址</label>
                        <input type="text" class="form-control" id="exampleInputhome_up" placeholder="家庭住址">
<%--                        <div class="checkbox">--%>
<%--                            <label>--%>
<%--                                会员--%>
<%--                                <input type="radio" name="sex_huiyuan_up" value="1">是--%>
<%--                                <input type="radio" name="sex_huiyuan_up" value="0">否--%>
<%--                            </label>--%>
<%--                        </div>--%>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="btn_update" class="btn btn-primary" data-dismiss="modal">保存修改</button>
            </div>
            <script>
                $(function (){
                    $('#btn_insert').click(function () {
                        var obj ={};
                        obj.yh_phone=$("#exampleInputphone").val();
                        obj.name=$("#exampleInputname").val();
                        obj.pw=$("#exampleInputPassword1").val();
                        obj.sex=$("input[name='sex']:checked").val();
                        obj.age=$("#exampleInputage").val();
                        obj.home=$("#exampleInputhome").val();
                        obj.huiyuan=0;
                        var res=JSON.stringify(obj);
                        console.log(res);
                        console.log(obj);
                        $.ajax({
                            url:"${pageContext.request.contextPath}/yonghu_insert",
                            type:"post",
                            contentType:"application/json",
                            data:res,
                            success(data){
                                end(data,MycommonUtil.URL.yonghulist());
                            }
                        })
                    });

                    $('#btn_update').click(function () {
                        var obj ={};
                        obj.yh_id=id;
                        obj.yh_phone=$("#exampleInputphone_up").val();
                        obj.name=$("#exampleInputname_up").val();
                        obj.pw=$("#exampleInputPassword1_up").val();
                        obj.sex=$("input[name='sex_up']:checked").val();
                        obj.age=$("#exampleInputage_up").val();
                        obj.home=$("#exampleInputhome_up").val();
                        if (hui=="是"){
                            obj.huiyuan=1;
                        }else{
                            obj.huiyuan=0;
                        }
                        var res=JSON.stringify(obj);
                        console.log(res);
                        console.log(obj);
                        $.ajax({
                            url:"${pageContext.request.contextPath}/yonghu_update",
                            type:"post",
                            contentType:"application/json",
                            data:res,
                            success(data){
                                end(data,MycommonUtil.URL.yonghulist());
                            }
                        })
                    });
                })

                //修改按钮的绑定函数
                function update(btn) {
                    id = btn.closest('tr').find('td:nth-child(1)').text();
                    hui= btn.closest('tr').find('td:nth-child(8)').text();
                    var name=btn.closest('tr').find('td:nth-child(2)').text();
                    var pw=btn.closest('tr').find('td:nth-child(3)').text();
                    var phone=btn.closest('tr').find('td:nth-child(4)').text();
                    var sex=btn.closest('tr').find('td:nth-child(5)').text();
                    var age=btn.closest('tr').find('td:nth-child(6)').text();
                    var home=btn.closest('tr').find('td:nth-child(7)').text();
                    $("#exampleInputphone_up").val(phone);
                    $("#exampleInputname_up").val(name);
                    $("#exampleInputPassword1_up").val(pw);
                    if(sex=="女"){
                        document.getElementById("female").checked=true;
                    }
                    $("#exampleInputage_up").val(age);
                    $("#exampleInputhome_up").val(home);
                }
                function delete_yonghu (id){
                    var obj={};
                    obj.yh_id=id;
                    var res=JSON.stringify(obj);
                    $.ajax({
                        url:"${pageContext.request.contextPath}/yonghu_delete",
                        type:"post",
                        contentType:"application/json",
                        data:res,
                        success(data){
                            end(data,MycommonUtil.URL.yonghulist());
                        }
                    })
                }
            </script>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->