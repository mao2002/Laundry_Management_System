<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
    <thead>
    <tr>
        <th>用户编号</th>
        <th>用户姓名</th>
        <th>手机号码</th>
        <th>性别</th>
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
            <td>${yh.yh_phone}</td>
            <td>${yh.sex}</td>
            <td>${yh.home}</td>
            <td>${yh.hui}</td>
            <td>
                <button onclick="select_id($(this))" type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#insert_dingdan">
                    添加订单
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="insert_dingdan" tabindex="-1" role="dialog" data-backdrop="false" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">添加订单</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="exampleInputpingpi_up">品牌</label>
                        <input type="text" class="form-control" id="exampleInputpingpi_up" placeholder="品牌" oninput="value=value.replace(/[\d]/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputkuanshi_up">款式</label>
                        <input type="text" class="form-control" id="exampleInputkuanshi_up" placeholder="款式" oninput="value=value.replace(/[\d]/g,'')">
                    </div>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">服务选择<span class="caret"></span></button>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <c:forEach items="${xiangmu}" var="xm">
                                        <li style="display: none">${xm.xiangmu_id}</li>
                                        <li><a onclick="select_xiangmu($(this));">${xm.xiangmu_name}</a></li>
                                        <li style="display: none">${xm.shoufei}</li>
                                </c:forEach>
                            </ul>
                        </div><!-- /btn-group -->
                        <input id="select_xm" type="text" class="form-control" onfocus="this.blur()">
                    </div><!-- /input-group -->
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" onclick="insert_dingdan()" class="btn btn-primary" data-dismiss="modal">添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    //添加订单
    function insert_dingdan(){
        var obj={};
        obj.yh_id=id;
        obj.xiangmu_name=$("#select_xm").val();
        obj.pingpi=$("#exampleInputpingpi_up").val();
        obj.kuanshi=$("#exampleInputkuanshi_up").val();
        obj.wancheng=0;
        console.log(obj);
        if(obj.xiangmu_name==""||obj.pingpi==""||obj.kuanshi==""){
            window.alert("所有信息不能为空！！！");
            return;
        }
        if(hui=="是"){
            obj.shoufei=shoufei*0.8;
        }
        obj.xiangmu_id=xm_id;
        obj.shoufei=shoufei;
        var res=JSON.stringify(obj);
        $.ajax({
            url:"${pageContext.request.contextPath}/dingdan_insert",
            type:"post",
            contentType:"application/json",
            data:res,
            success(data){
                end(data,MycommonUtil.URL.dingdanlist());
            }
        })
    }
    //点击添加订单的事件
    function select_id(btn) {
        id = btn.closest('tr').find('td:nth-child(1)').text();
        hui=btn.closest('tr').find('td:nth-child(6)').text();
    }
    //项目选择
    function select_xiangmu(a){
        let lin=a.closest('li');
        xm_id=lin.prev().text();
        var name=lin.text();
        shoufei=lin.next().text();
        $("#select_xm").val(name);
    }
</script>