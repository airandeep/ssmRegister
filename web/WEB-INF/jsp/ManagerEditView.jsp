<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/26
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>用户管理Airan</title>
    <link href="../plug/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../plug/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="../css/DT_bootstrap.css" rel="stylesheet" />

    <script>
        function returnLogin() {
            var form = document.fm;
            form.submit();
        }
    </script>
</head>
<body>

<div class="container-fluid">

    <form name="fm" action="returnLogin" method="post"></form>

    <div class="row-fluid">
        <form name="fm2" action="deleteUserInfo" method="post">
        <div class="block">
            <div class="navbar navbar-inner block-header">
                <div class="muted pull-left">注册用户表</div>
            </div>
            <div class="block-content collapse in">
                <div class="span12">
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                        <thead>
                        <tr>
                            <th></th>
                            <th>id</th>
                            <th>昵称</th>
                            <th>密码</th>
                            <th>说明</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach  var="item" items="${listsUser }">
                        <tr class="odd gradeX">
                            <td><input type="checkbox"  value="${item.id}"  name="test" lay-skin="primary"></td>
                            <td>${item.id}</td>
                            <td>${item.name}</td>
                            <td>${item.pwd}</td>
                            <td>略</td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
            <div class="block-content collapse in" style="text-align:right;" >
                <div id="test">
                    <button class="btn btn-success">确定删除</button>
                    <%--type为reset表示不触发表单action事件--%>
                    <button type="reset" class="btn btn-warning" onclick="returnLogin()">返回</button>
                </div>
            </div>
        </div>
        </form>
    </div>

    <div class="row-fluid">
        <form name="fm3" action="deleteCvInfo" method="post">
        <div class="block">

            <div class="navbar navbar-inner block-header">
                <div class="muted pull-left">注册用户简历表</div>
            </div>
            <div class="block-content collapse in">
                <div class="span12">
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2">
                        <thead>
                        <tr>
                            <th></th>
                            <th>昵称</th>
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
                        <tbody>
                        <c:forEach  var="item" items="${listCvInfo }">
                            <tr class="odd gradeX">
                                <td><input type="checkbox"  value="${item.id}"  name="test2" lay-skin="primary"></td>
                                <td>${item.nickName}</td>
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
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="block-content collapse in" style="text-align:right;" >
                <div id="test2">
                    <button class="btn btn-success">确定删除</button>
                    <button type="reset" class="btn btn-warning" onclick="returnLogin()">返回</button>
                </div>
            </div>


        </div>
        </form>
    </div>
</div>

<%--<div class="container-fluid">--%>
    <%----%>
<%--</div>--%>

<script src="../js/jquery-1.9.1.js"></script>
<script src="../plug/bootstrap/js/bootstrap.min.js"></script>
<script src="../plug/jquery/jquery.dataTables.min.js"></script>

<script src="../js/DT_bootstrap.js"></script>

</body>


</html>
