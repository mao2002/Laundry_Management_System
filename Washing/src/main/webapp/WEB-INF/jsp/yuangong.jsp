<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-9 col-sm-offset-1">
    <div class="alert alert-success" id="success" style="display: none" role="alert"><span id="success_span" class="glyphicon glyphicon-envelope"></span></div>
    <div class="alert alert-danger" id="fail" style="display: none" role="alert"><span id="fail_span" class="glyphicon glyphicon-envelope"></span></div>
    <div>

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">员工列表</a></li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">添加员工</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">
                <table class="table">
                    <thead>
                    <tr>
                        <th>员工编号</th>
                        <th>员工姓名</th>
                        <th>密码</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${yuangong}" var="gl">
                        <tr>
                            <td>${gl.yh_id}</td>
                            <td>${gl.name}</td>
                            <td>${gl.pw}</td>
                            <td>
                                <a onclick="delete_yonghu(${gl.yh_id});" class="btn btn-danger btn-sm">删除</a>
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
                                            <div class="input-group-addon">员工姓名</div>
                                            <input type="text" class="form-control" id="exampleInputname" placeholder="员工姓名" oninput="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">密码</div>
                                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="密码" oninput="value=value.replace(/[^\w\.\/]/ig,'')">
                                        </div>
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
                        <label for="exampleInputname_up">员工姓名</label>
                        <input type="text" class="form-control" id="exampleInputname_up" placeholder="员工姓名" oninput="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1_up">密码</label>
                        <input type="password" class="form-control" id="exampleInputPassword1_up" placeholder="密码" oninput="value=value.replace(/[^\w\.\/]/ig,'')">
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
                        obj.name=$("#exampleInputname").val();
                        obj.pw=$("#exampleInputPassword1").val();
                        var res=JSON.stringify(obj);
                        console.log(res);
                        console.log(obj);
                        $.ajax({
                            url:"${pageContext.request.contextPath}/guanli_insert",
                            type:"post",
                            contentType:"application/json",
                            data:res,
                            success(data){
                                end(data,MycommonUtil.URL.yuangonglist());
                            }
                        })
                    });

                    $('#btn_update').click(function () {
                        var obj ={};
                        obj.yh_id=id;
                        obj.name=$("#exampleInputname_up").val();
                        obj.pw=$("#exampleInputPassword1_up").val();
                        var res=JSON.stringify(obj);
                        console.log(res);
                        console.log(obj);
                        $.ajax({
                            url:"${pageContext.request.contextPath}/guanli_update",
                            type:"post",
                            contentType:"application/json",
                            data:res,
                            success(data){
                                end(data,MycommonUtil.URL.yuangonglist());
                            }
                        })
                    });
                })

                //修改按钮的绑定函数
                function update(btn) {
                    id = btn.closest('tr').find('td:nth-child(1)').text();
                    var name=btn.closest('tr').find('td:nth-child(2)').text();
                    var pw=btn.closest('tr').find('td:nth-child(3)').text();
                    $("#exampleInputname_up").val(name);
                    $("#exampleInputPassword1_up").val(pw);
                }
                function delete_yonghu (id){
                    var obj={};
                    obj.yh_id=id;
                    var res=JSON.stringify(obj);
                    $.ajax({
                        url:"${pageContext.request.contextPath}/guanli_delete",
                        type:"post",
                        contentType:"application/json",
                        data:res,
                        success(data){
                            end(data,MycommonUtil.URL.yuangonglist());
                        }
                    })
                }
            </script>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->