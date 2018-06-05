<%--
  Created by IntelliJ IDEA.
  User: Airan
  Date: 2018/3/22
  Time: 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>$AIRAN$</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../plug/layui/css/layui.css"   media="all">

    <STYLE TYPE="text/css">
        .testA {
            display: table;
            margin: 0 auto;
        }
    </STYLE>
    <script>
        function returnLogin() {
            var form = document.fm0;
            form.submit();
        }
    </script>
</head>
<body>


<!-- <span style="white-space:pre;"> </span> -->
<div id="testA" class="testA" style="width:1000px">
    <form name="fm0" action="returnLogin" method="post">
    </form>
    <form name="fm1" action="deleteCvInfo" method="post">
        <div id="txtCV" style="text-align:center;">注册简历表</div>
        <div class="layui-form">
            <table class="layui-table">
                <colgroup>
                    <col width="50">
                    <col width="80">
                    <col width="60">

                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th></th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>出生日期</th>
                    <th>工作时间</th>
                    <th>出生地</th>
                    <th>居住地</th>
                    <th>电话号码</th>
                    <th>电子邮箱</th>
                    <th>星座</th>
                    <th>XX</th>
                </tr>
                </thead>
<c:forEach  var="item" items="${listsCv }">
                <tbody>
                <tr>
                    <td><input type="checkbox"  value="${item.nickName}"  name="test" lay-skin="primary"></td>
                    <td>${item.name}</td>
                    <td>${item.sex }</td>
                    <td>${item.bornTime }</td>
                    <td>${item.workTime }</td>
                    <td>${item.bornLocation }</td>
                    <td>${item.liveLocation }</td>
                    <td>${item.phoneNumber }</td>
                    <td>${item.email }</td>
                    <td>${item.constellation }</td>
                    <td>${item.threeNumber }</td>
                </tr>
                </tbody>
</c:forEach>
            </table>
        </div>
        <div class="layui-form-item" style="text-align:right;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">确认删除</button>
                <button type="reset" onclick="returnLogin()" class="layui-btn layui-btn-primary">返回</button>
            </div>
        </div>
    </form>

    <form name="fm2" action="deleteUserInfo" method="post">
        <div id="txtUser" style="text-align:center;">注册用户表</div>
        <div class="layui-form">
            <table class="layui-table">
                <colgroup>
                    <col width="50">
                    <col width="80">
                    <col width="80">

                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th></th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>说明</th>

                </tr>
                </thead>
                <c:forEach  var="item" items="${listsUser }">
                    <tbody>
                    <tr>
                        <td><input type="checkbox"  value="${item.name}"  name="test2" lay-skin="primary"></td>
                        <td>${item.name}</td>
                        <td>${item.pwd }</td>
                        <td>NULL</td>

                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
        <div class="layui-form-item" style="text-align:right;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">确认删除</button>
                <button type="reset" onclick="returnLogin()" class="layui-btn layui-btn-primary">返回</button>
            </div>
        </div>
    </form>

</div>
<%--<script src="../plug/layui/layui.all.js" charset="utf-8"></script>--%>
<%--<script type="text/javascript">--%>
    <%--var $ = layui.jquery,--%>
        <%--form = layui.form();--%>
    <%--//全选--%>
    <%--form.on('checkbox(allChoose)', function(data){--%>
        <%--var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');--%>
        <%--child.each(function(index, item){--%>
            <%--item.checked = data.elem.checked;--%>
        <%--});--%>
        <%--form.render('checkbox');--%>
    <%--});--%>
<%--</script>--%>





</body>
</html>
