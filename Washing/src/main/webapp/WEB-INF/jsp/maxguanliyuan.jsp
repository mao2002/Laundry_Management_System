<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="panel-heading" role="tab" id="headingThree">
        <h4 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"
               aria-expanded="true">
                <span class="glyphicon glyphicon-wrench"> 员工管理</span>
            </a>
        </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel">
        <div class="panel-body">
            <ul class="list-group">
                <li class="list-group-item"><a href="javascript:;" id="yuangongbtn">员工列表</a></li>
                <script>
                    $(function () {
                        $("#yuangongbtn").click(function () {
                            $("#content").load("${pageContext.request.contextPath}/yuangonglist");
                        });
                    })
                </script>
            </ul>
        </div>
    </div>
