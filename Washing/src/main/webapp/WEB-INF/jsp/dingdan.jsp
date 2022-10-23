<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-9 col-sm-offset-1">
  <div class="alert alert-success" id="success" style="display: none" role="alert"><span id="success_span" class="glyphicon glyphicon-envelope"></span></div>
  <div class="alert alert-danger" id="fail" style="display: none" role="alert"><span id="fail_span" class="glyphicon glyphicon-envelope"></span></div>
  <div>

    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
      <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">订单列表</a></li>
      <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" id="insert_dindan">添加订单</a></li>
      <script>
        $(function (){
          $("#insert_dindan").click(function (){
            $("#profile").load("${pageContext.request.contextPath}/insert_dingdanlist");
          });
        })
      </script>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
      <div role="tabpanel" class="tab-pane active" id="home">
        <table class="table">
          <thead>
          <tr>
            <th>订单编号</th>
            <th>用户姓名</th>
            <th>洗衣服务</th>
            <th>品牌</th>
            <th>款式</th>
            <th>下单时间</th>
            <th>费用(元)</th>
            <th>是否完成</th>
            <th>操作</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${dingdan}" var="dd">
            <tr>
              <td>${dd.dingdan_id}</td>
              <td>${dd.name}</td>
              <td>${dd.xiangmu_name}</td>
              <td>${dd.pingpi}</td>
              <td>${dd.kuanshi}</td>
              <td><fmt:formatDate value="${dd.xiadan_time}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
              <td>${dd.shoufei}</td>
              <td>${dd.wan}</td>
              <td>
                <a onclick="delete_dingdan(${dd.dingdan_id});" class="btn btn-danger btn-sm">删除</a>
                <button type="button"  onclick="update($(this));" class="btn btn-info btn-sm" data-toggle="modal" data-target="#update">
                  修改
                </button>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
      <div role="tabpanel" class="tab-pane" id="profile"></div>
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
            <label for="exampleInputpingpi_up">品牌</label>
            <input type="text" class="form-control" id="exampleInputpingpi_up" placeholder="品牌" oninput="value=value.replace(/[\d]/g,'')">
          </div>
          <div class="form-group">
            <label for="exampleInputkuanshi_up">款式</label>
            <input type="text" class="form-control" id="exampleInputkuanshi_up" placeholder="款式" oninput="value=value.replace(/[\d]/g,'')">
          </div>
          <div class="checkbox">
            <label>
              订单完成
              <input type="radio" id="shi" name="wan" value="shi" checked="true">是
              <input type="radio" id="fou" name="wan" value="fou">否
            </label>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" id="btn_update" class="btn btn-primary" data-dismiss="modal">保存修改</button>
      </div>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
  $(function (){
    $('#btn_update').click(function () {
      var obj ={};
      obj.dingdan_id=id;
      obj.pingpi=$("#exampleInputpingpi_up").val();
      obj.kuanshi=$("#exampleInputkuanshi_up").val();
      obj.wan=$("input[name='wan']:checked").val();
      if (obj.wan=="shi"){
        obj.wancheng=1;
      }else{
        obj.wancheng=0;
      }
      var res=JSON.stringify(obj);
      console.log(res);
      $.ajax({
        url:"${pageContext.request.contextPath}/dingdan_update",
        type:"post",
        contentType:"application/json",
        data:res,
        success(data){
          end(data,MycommonUtil.URL.dingdanlist());
        }
      })
    });
  })
  //修改按钮的绑定函数
  function update(btn) {
    id = btn.closest('tr').find('td:nth-child(1)').text();
    var wan= btn.closest('tr').find('td:nth-child(8)').text();
    var pingpi=btn.closest('tr').find('td:nth-child(4)').text();
    var kuanshi=btn.closest('tr').find('td:nth-child(5)').text();
    $("#exampleInputpingpi_up").val(pingpi);
    $("#exampleInputkuanshi_up").val(kuanshi);
    if(wan=="否"){
      document.getElementById("fou").checked=true;
    }
  }
  function delete_dingdan (id){
    var obj={};
    obj.dingdan_id=id;
    var res=JSON.stringify(obj);
    console.log(res);
    $.ajax({
      url:"${pageContext.request.contextPath}/dingdan_delete",
      type:"post",
      contentType:"application/json",
      data:res,
      success(data){
        end(data,MycommonUtil.URL.dingdanlist());
      }
    })
  }
</script>