<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <a onclick="insert_huiyuan(${yh.yh_id});" class="btn btn-info btn-sm">添加</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
