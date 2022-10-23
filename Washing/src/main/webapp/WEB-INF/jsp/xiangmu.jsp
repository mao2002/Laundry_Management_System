<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-9 col-sm-offset-1">
    <div class="alert alert-success" id="success" style="display: none" role="alert"><span id="success_span" class="glyphicon glyphicon-envelope"></span></div>
    <div class="alert alert-danger" id="fail" style="display: none" role="alert"><span id="fail_span" class="glyphicon glyphicon-envelope"></span></div>
    <div>

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">项目列表</a></li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">添加项目</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">
                <table class="table">
                    <thead>
                    <tr>
                        <th>项目编号</th>
                        <th>项目</th>
                        <th>收费金额(元)</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${xiangmu}" var="xm">
                        <tr>
                            <td>${xm.xiangmu_id}</td>
                            <td>${xm.xiangmu_name}</td>
                            <td>${xm.shoufei}</td>
                            <td>
                                <a onclick="delete_xiangmu(${xm.xiangmu_id});" class="btn btn-danger btn-sm">删除</a>
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
                                            <div class="input-group-addon">项目</div>
                                            <input type="text" class="form-control" id="exampleInputname" placeholder="项目" oninput="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group" style="width: 35%">
                                            <div class="input-group-addon">金额</div>
                                            <input type="text" class="form-control" id="exampleInputshoufei" placeholder="金额" oninput="this.value=this.value.replace(/\D/g,'')">
                                            <div class="input-group-addon">元</div>
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
                        <label for="exampleInputname_up">项目</label>
                        <input type="text" class="form-control" id="exampleInputname_up" placeholder="项目" oninput="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputage_up">金额</label>
                        <div class="input-group" style="width: 35%">
                            <input type="text" class="form-control" id="exampleInputage_up" placeholder="金额" oninput="this.value=this.value.replace(/\D/g,'')">
                            <div class="input-group-addon">元</div>
                        </div>
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
                        obj.xiangmu_name=$("#exampleInputname").val();
                        obj.shoufei=$("#exampleInputshoufei").val();
                        var res=JSON.stringify(obj);
                        console.log(res);
                        $.ajax({
                            url:"${pageContext.request.contextPath}/xiangmu_insert",
                            type:"post",
                            contentType:"application/json",
                            data:res,
                            success(data){
                                end(data,MycommonUtil.URL.xiangmulist());
                            }
                        })
                    });

                    $('#btn_update').click(function () {
                        var obj ={};
                        obj.xiangmu_id=id;
                        obj.xiangmu_name=$("#exampleInputname_up").val();
                        obj.shoufei=$("#exampleInputage_up").val();
                        var res=JSON.stringify(obj);
                        console.log(res);
                        $.ajax({
                            url:"${pageContext.request.contextPath}/xiangmu_update",
                            type:"post",
                            contentType:"application/json",
                            data:res,
                            success(data){
                                end(data,MycommonUtil.URL.xiangmulist());;
                            }
                        })
                    });
                })

                //修改按钮的绑定函数
                function update(btn) {
                    id = btn.closest('tr').find('td:nth-child(1)').text();
                    var name=btn.closest('tr').find('td:nth-child(2)').text();
                    var age=btn.closest('tr').find('td:nth-child(3)').text();
                    $("#exampleInputname_up").val(name);
                    $("#exampleInputage_up").val(age);
                }
                function delete_xiangmu (id){
                    var obj={};
                    obj.xiangmu_id=id;
                    var res=JSON.stringify(obj);
                    $.ajax({
                        url:"${pageContext.request.contextPath}/xiangmu_delete",
                        type:"post",
                        contentType:"application/json",
                        data:res,
                        success(data){
                            end(data,MycommonUtil.URL.xiangmulist());
                        }
                    })
                }
            </script>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->