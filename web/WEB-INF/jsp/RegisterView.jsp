<%--
  Created by IntelliJ IDEA.
  User: airan
  Date: 2017/10/6
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>$戴立豪$</title>
    <link rel="stylesheet" href="../css/login.css" type="text/css" />
    <script language="javascript">
        function realSysTime(clock){
            var now=new Date(); //创建Date对象
            var year=now.getFullYear(); //获取年份
            var month=now.getMonth(); //获取月份
            var date=now.getDate(); //获取日期
            var day=now.getDay(); //获取星期
            var hour=now.getHours(); //获取小时
            var minu=now.getMinutes(); //获取分钟
            var sec=now.getSeconds(); //获取秒钟
            month=month+1;
            var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
            var week=arr_week[day]; //获取中文的星期
            var time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec; //组合系统时间
            clock.innerHTML=time; //显示系统时间
        }
        window.onload=function(){
            window.setInterval("realSysTime(clock)",1000); //实时获取并显示系统时间
        }


        //如果焦点处在姓名或密码文本框上，此时点击button触发onclick事件，如果有定义onBlur，onclick事件会被覆盖掉
        function testUsername() {
            var userInfo = document.getElementById("infoUsername");
            var user = document.getElementById("username");
            var userStr = user.value;
            userStr = userStr.replace(/(^\s*)|(\s*$)/g, '');//去除字符串前后空格字符
            if(userStr == ""){
                userInfo.style.display = "block";
                userInfo.innerHTML = "姓名不可为空";
            }else{
                userInfo.style.display = "none";
            }
        }

        function testPwd() {
            var pwdInfo =  document.getElementById("infoPassword");
            var pwd = document.getElementById("password");
            var pwdStr = pwd.value;
            if(pwdStr == ""){
                pwdInfo.style.display = "block";
                pwdInfo.innerHTML = "密码不可为空";
            }
            else{
                var flag = 0;
                for(i = 0;i<pwdStr.length;i++){
                    if(pwdStr.charAt(i) == ' ')//在密码不为空的情况下防止字符串中有空格字符
                    {
                        flag = 1;
                        break;
                    }
                }
                if(flag){
                    pwdInfo.style.display = "block";
                    pwdInfo.innerHTML = "密码不可含有空格";
                }else{
                    pwdInfo.style.display = "none";
                }
            }


        }

        function register() {
            var userInfo = document.getElementById("infoUsername"),pwdInfo =  document.getElementById("infoPassword");
            var user = document.getElementById("username"),pwd = document.getElementById("password");
            var flag = 0;
            var userStr = user.value,pwdStr = pwd.value;

            if(userStr == "" ){
                userInfo.style.display = "block";
                userInfo.innerHTML = "姓名不可为空";
                flag +=1;
            }
            if(pwdStr == ""){
                pwdInfo.style.display = "block";
                pwdInfo.innerHTML = "密码不可为空";
                flag +=1;
            }
            if(flag == 0 && userInfo.style.display == "none" && pwdInfo.style.display == "none"){
                var form = document.fm1;
                form.submit();
            }

        }


    </script>
</head>
<body>
<div class="main" >

    <div class="wrap-login">  <!-- 居中作用 -->

        <div id = "clock" style="float: right">2018年3月17日 星期六 11:44:48</div>
        <div class="login-part">
            <img  src="images/register.png" style="width: 400px"/>
            <h3>账号注册</h3>
            <%--<div id = "info" style="text-align:center">请输入用户名与密码完成注册</div>--%>
            <div class="user-info">


                <form name="fm1" action="judgeRegister" method="post">

                    <input id="username" name="username" onBlur="testUsername()" tabindex="1" placeholder="输入用户名"
                           class="user-name" type="text" value=""/>
                    <div id = "infoUsername" style="display:none;color: red">输入用户名</div>
                    <input id="password" name="password" onBlur="testPwd()" tabindex="2" placeholder="输入密码" class="pass-word"
                           type="password" value="" autocomplete="off"/>
                    <div id = "infoPassword" style="display:none;color: red">输入密码</div>

                    <c:set var="cFlagRegister" scope="session" value="${0}"/>
                    <c:if test="${cFlagRegister == 0}">
                        <div id = "test">请输入用户名与密码完成注册</div>
                    </c:if>
                    <c:if test="${cFlagRegister == 1}">
                        <div id = "test">当前账户已存在!!!</div>
                    </c:if>


                    <input class="logging" accesskey="l" value="确认" tabindex="6" type="button" onclick="register()" />

                </form>

            </div>

            <div class="line"></div>



        </div>

    </div>


</div>

</body>
</html>
