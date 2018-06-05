<%--
  Created by IntelliJ IDEA.
  User: Airan
  Date: 2018/3/18
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>创建简历</title>
    <link rel="stylesheet" href="../css/CV.css" />
    <link rel="stylesheet" href="../plug/layui/css/layui.css" />

    <link rel="stylesheet" href="../plug/popui/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../plug/popui/css/buttons.css" />

    <script src="../plug/layui/layui.js"></script>

    <script language="javascript" type="text/javascript">



        function testUserName() {
            var str = document.getElementById("userName").value;
            var a = document.getElementById("userNameInfo");
            if((/^[\u4e00-\u9fa5]{2,5}$/.test(str)) || (/^[a-zA-Z]{2,10}$/.test(str)))
                a.style.display = "none";
            else
                a.style.display = "block";
        }

        function testUserBornLocation() {
            var str = document.getElementById("userBornLocation").value;
            var a = document.getElementById("userBornLocationInfo");
            if((/^[\u4e00-\u9fa5]{2,5}$/.test(str)) || (/^[a-zA-Z]{2,10}$/.test(str)))
                a.style.display = "none";
            else
                a.style.display = "block";
        }

        function testUserLifeCity() {
            var str = document.getElementById("userLifeCity").value;
            var a = document.getElementById("userLifeCityInfo");
            if((/^[\u4e00-\u9fa5]{2,5}$/.test(str)) || (/^[a-zA-Z]{2,10}$/.test(str)))
                a.style.display = "none";
            else
                a.style.display = "block";
        }

        function testPhoneNumber() {
            var str = document.getElementById("userPhoneNumber").value;
            var a = document.getElementById("userPhoneNumberInfo");
            if(!(/^1[34578]\d{9}$/.test(str)))
                a.style.display = "block";
            else
                a.style.display = "none";
        }
        
        function testUserEmail() {
            var str = document.getElementById("userEmail").value;
            var a = document.getElementById("userEmailInfo");
            if(!(/^[1-9]\d{4,10}@qq.com$/.test(str)))
                a.style.display = "block";
            else
                a.style.display = "none";
        }
        
        function submit1()
        {
            var name = document.getElementById("userNameInfo");
            var nameTxt = document.getElementById("userName");
            var phoneNumber = document.getElementById("userPhoneNumberInfo");
            var phoneNumberTxt = document.getElementById("userPhoneNumber");
            var email = document.getElementById("userEmailInfo");
            var emailTxt = document.getElementById("userEmail");
            var bornTime = document.getElementById("userBornTime");
            var workTime = document.getElementById("userWorkTime");

            var brief = document.getElementById("txtBrief");
            var form = document.fm1;
            if(name.style.display == "block" || phoneNumber.style.display=="block" || email.style.display=="block"
                || nameTxt.value == ""||bornTime.value == ""||workTime.value==""||
                 phoneNumberTxt.value == "" || emailTxt.value == "" )
                brief.style.display = "block";
            else
                form.submit();

        }

        function test1(obj)
        {
            var str = document.getElementById(obj.id).value;
            document.getElementById("userConstellation").value = str;
        }



        function submit2() {
            var form = document.fm2;
            var constellationTxt = document.getElementById("userConstellation").value;
            var lifeCityTxt = document.getElementById("userLifeCity").value;
            var brief2 = document.getElementById("txtBrief2");
            if(constellationTxt == "" || lifeCityTxt=="")
                brief2.style.display = "block";
            else
                form.submit();
        }

        function testThreeNumber() {
            var str = document.getElementById("threeNumber").value;
            var a = document.getElementById("threeNumberInfo");
            if(/^[1-9][0-9]{1,2}$/.test(str))
                a.style.display = "none";
            else
                a.style.display = "block";
        }

        function submit3()
        {
            var form = document.fm3;

            var bornLocationTxt = document.getElementById("userBornLocation").value;
            var bornLocationInfo = document.getElementById("userBornLocationInfo");

            var threeNumberTxt = document.getElementById("threeNumber").value;
            var threeNumberInfo = document.getElementById("threeNumberInfo");

            var brief3 = document.getElementById("txtBrief3");
            if(bornLocationTxt==""||threeNumberTxt == "" ||bornLocationInfo.style.display=="block" ||threeNumberInfo.style.display == "block")
                brief3.style.display = "block";
            else
                form.submit();
        }

        function checkString(input)
        {
            var n = input.length;
            if(n == 0)
                return 1;
            for(i = 0;i<input.length;i++) {
                if (input.charAt(i) == ' ')
                    return 1;
            }
            return 0;
        }

        function loadLayoutData() {
            layui.use('laydate', function(){
                var laydate = layui.laydate;

                //执行一个laydate实例
                laydate.render({
                    elem: '#userBornTime' //指定元素
                    ,theme: '#FFB90F'
                });
                laydate.render({
                    elem: '#userWorkTime'
                    ,type: 'year'
                    ,range: true
                    ,theme: '#FFB90F'
                });
            });
//
        }

        function loadXMLDoc()
        {
            var xmlhttp;
            if (window.XMLHttpRequest)
            {
                //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp=new XMLHttpRequest();
            }
            else
            {
                // IE6, IE5 浏览器执行代码
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
                }
            }

            xmlhttp.open("GET","../txt/test.txt",true);
            xmlhttp.send();
        }

    </script>

</head>
<body onload="loadLayoutData()">
<c:set var="cs" scope="session" value="${1}"/>
<c:set var="flag" scope="session" value="${0}"/>
<%--<div id="myDiv"><h2>使用 AJAX 修改该文本内容</h2></div>--%>
<%--<button type="button" onclick="loadXMLDoc()">ssm框架测试AJAX</button>--%>

<div class="modal fade" id="loginModal" style="display:none;">
    <div class="modal-dialog modal-sm" style="width:560px;">
        <div class="modal-content" style="border:none;">
            <div class="col-left"></div>
            <div class="col-right">
                <div class="modal-header">
                    <button type="button" id="login_close" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="loginModalLabel" style="font-size: 18px;">请点选您的星座?</h4>
                </div>
                <div class="modal-body">
                    <input type="button" value="白羊座" id="btn_test0" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />
                    <input type="button" value="金牛座" id="btn_test1" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />
                    <input type="button" value="双子座" id="btn_test2" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />
                    <input type="button" value="巨蟹座" id="btn_test3" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />

                    <br><br>
                    <input type="button" value="狮子座" id="btn_test4" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />
                    <input type="button" value="处女座" id="btn_test5" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />
                    <input type="button" value="天秤座" id="btn_test6" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />
                    <input type="button" value="天蝎座" id="btn_test7" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />
                    <br><br>
                    <input type="button" value="射手座" id="btn_test8" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />
                    <input type="button" value="摩羯座" id="btn_test9" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />
                    <input type="button" value="水瓶座" id="btn_test10" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />
                    <input type="button" value="双鱼座" id="btn_test11" data-dismiss="modal" class="button button-3d button-action button-pill" onclick="test1(this)" />
                </div>
            </div>
        </div>
    </div>
</div>


<div class="top">

    <div class="header clearfix width990">
        <div class="logo f1">
            <a href="https://www.baidu.com/">
                <img src="../images/logo.png" width="163" height="58" title="AIRAN" />
            </a>
        </div>
        <div class="heaer_con">
            您正在创建一份个人简历...
        </div>
        <div class="heaer_right">
            <a  class="heaer_right" href="https://www.baidu.com/">AIRAN</a>
        </div>
    </div>
</div>
<div class="main">
    <div class="main01">
        <span class="fl">恭喜您！注册成功。</span>
        <a class="fr" >English Resume></a>

    </div>
    <!--创建步骤-->
    <div class="main02">
        <ul>
            <li class="msg">
                <span>1. 个人信息</span>
                <c:if test="${cs == 1}">
                <span class="wid216 color01"></span>
                </c:if>
                <c:if test="${cs == 2}">
                    <span class="wid216 color02"></span>
                </c:if>
                <c:if test="${cs == 3}">
                    <span class="wid216 color02"></span>
                </c:if>
            </li>
            <li class="msg">
                <span>2. 创建简历 </span>
                <c:if test="${cs == 1}">
                <span class="wid216 color02"></span>
                </c:if>
                <c:if test="${cs == 2}">
                    <span class="wid216 color01"></span>
                </c:if>
                <c:if test="${cs == 3}">
                    <span class="wid216 color02"></span>
                </c:if>
            </li>
            <li class="msg">
					<span>
						<img src="../images/icon_success.jpg">创建完成</span>
                <c:if test="${cs == 1}">
                    <span class="wid216 color02"></span>
                </c:if>
                <c:if test="${cs == 2}">
                    <span class="wid216 color02"></span>
                </c:if>
                <c:if test="${cs == 3}">
                    <span class="wid216 color01"></span>
                </c:if>
            </li>
        </ul>

    </div>



    <c:if test="${cs == 1}">
        <form name="fm1" action="CV1.action" method="post">
            <div class="main03">
                <div class="main03_Pad" >
                    <h1 >个人信息</h1>
                    <ul class="mainForm">
                        <li class="msg">
                            <span><font>* </font>姓名</span>
                            <div class="wid350">
                                <input type="text" onBlur="testUserName()" class="wid350"  id="userName" name="userName" maxlength="50" value=""  mzpmodule="resumeChEnFac" tiptext="" lang="en"/>
                            </div>
                            <div id="userNameInfo" style="display:none;line-height:30px">
                                <font face="黑体" color="red">错误的姓名格式(纯中文或纯英文)</font>
                            </div>
                        </li>
                        <li class="msg">
                            <span><font>* </font>性别</span>
                            <div class="layui-input-inline" style="line-height:40px">
                                <%--此处单选框与省市县地址选取冲突，不能使用，原因未知--%>
                                <label style="width: auto; cursor: pointer;" bind_hidden="gender">男</label>
                                <input type="radio"  name="sex" value="男"  checked>
                                <label style="width: auto; cursor: pointer;" bind_hidden="gender">女</label>
                                <input type="radio"  name="sex" value="女" >
                            </div>
                        </li>
                        <li class="msg">
                            <span><font>* </font>出生年月</span>
                            <div class="wid350">
                                <input type="text" class="wid350" id="userBornTime" name="userBornTime" maxlength="50" value=""  mzpmodule="resumeChEnFac" tiptext="" lang="en"/>
                            </div>
                        </li>
                        <li class="msg">
                            <span><font>* </font>现工作年份</span>
                            <div class="wid350">
                                <input type="text" class="wid350" id="userWorkTime" name="userWorkTime" maxlength="50" value=""  mzpmodule="resumeChEnFac" tiptext="" lang="en"/>
                            </div>
                        </li>

                        <li class="msg">
                            <span><font>* </font>手机号码</span>
                            <div class="wid350">
                                <input type="text" onBlur="testPhoneNumber()" class="wid350" id="userPhoneNumber" name="userPhoneNumber" maxlength="50" value=""  mzpmodule="resumeChEnFac" tiptext="" lang="en"/>
                            </div>
                            <div id="userPhoneNumberInfo" style="display:none;line-height:30px">
                                <font face="黑体" color="red">错误的手机号码格式</font>
                            </div>
                        </li>
                        <li class="msg">
                            <span><font>* </font>电子邮箱</span>
                            <div class="wid350" style="text-align: center">
                                <input type="text" onBlur="testUserEmail()" class="wid350" id="userEmail" name="userEmail" maxlength="50" value=""  mzpmodule="resumeChEnFac" tiptext="" lang="en"/>
                            </div>
                            <div id="userEmailInfo"  style="display:none;line-height:30px">
                                <font face="黑体" color="red">错误的电子邮箱格式(目前只支持qq邮箱)</font>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="main03_Pad2"  style="position: relative;left: 160px">
                    <%--处于表单(form /form)中的onclick事件不要命名为submit(),因为这样onclick事件等同于action--%>
                    <input type="button" id="btn_save" class="btnStyle"  value="" onclick="submit1()" style=" width: 190px; height: 50px;" />
                    <font id="txtBrief" size="3" face="黑体" color="red" style="display: none">请确保输入的信息无误!!!</font>
                </div>
            </div>
        </form>
    </c:if>

    <c:if test="${cs == 2}">
        <form name="fm2" action="CV2.action" method="post">
            <div class="main03">
                <div class="main03_Pad" >
                    <h1 >个人信息</h1>
                    <ul class="mainForm">
                        <li class="msg">
                            <span><font>* </font>现居住城市</span>
                            <div class="wid350">
                                <input select-address p="p" c="c" a="a" d="d" ng-model="xxx" type="text" class="wid350"  id="userLifeCity" name="userLifeCity" maxlength="50" value="" mzpmodule="resumeChEnFac" tiptext="" lang="en"/>
                            </div>
                            <div id="userLifeCityInfo" style="display:none;line-height:30px">
                                <font face="黑体" color="red">错误的居住地格式(纯中文或纯英文)</font>
                            </div>
                        </li>
                        <li class="msg">
                            <span><font>* </font>星座</span>
                            <div class="wid350">
                                <input type="text"  class="wid350 globalLoginBtn" id="userConstellation" name="userConstellation" maxlength="50" value=""  mzpmodule="resumeChEnFac" tiptext="" lang="en"/>
                            </div>
                            <div id="userConstellationInfo"  style="display:none;line-height:30px">
                                <font face="黑体" color="red">错误的星座格式</font>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="main03_Pad2" style="position: relative;left: 160px">
                    <input type="button" id="btn_save2" class="btnStyle" value="" onclick="submit2()" style=" width: 190px; height: 50px;"  />
                    <font id="txtBrief2" size="3" face="黑体" color="red" style="display: none">请将信息补充完整(不要输入空字符)!!!</font>
                </div>
            </div>
        </form>
    </c:if>
    <c:if test="${cs == 3}">
        <form name="fm3" action="CV3.action" method="post">
            <div class="main03">
                <div class="main03_Pad" >
                    <h1 >个人信息</h1>
                    <ul class="mainForm">
                        <li class="msg">
                            <span><font>* </font>户口所在地</span>
                            <div class="wid350" >
                                <input select-address p="p" c="c" a="a" d="d" ng-model="xxx" type="text"  class="wid350"  id="userBornLocation" name="userBornLocation" maxlength="50" value=""  mzpmodule="resumeChEnFac" tiptext="" lang="en"/>
                            </div>
                            <div id="userBornLocationInfo" style="display:none;line-height:30px">
                                <font face="黑体" color="red">错误的户口地格式(纯中文或纯英文)</font>
                            </div>
                        </li>
                        <li class="msg">
                            <span><font>* </font>XX</span>
                            <div class="wid350">
                                <input type="text" onblur="testThreeNumber()" class="wid350" id="threeNumber" name="threeNumber" maxlength="50" value=""  mzpmodule="resumeChEnFac" tiptext="" lang="en"/>
                            </div>
                            <div id="threeNumberInfo"  style="display:none;line-height:30px">
                                <font face="黑体" color="red">错误的XX格式</font>
                            </div>
                        </li>

                    </ul>
                </div>
                <div class="main03_Pad2" style="position: relative;left: 160px">
                    <input type="button"  id="btn_save3" class="btnStyle1" onclick="submit3()" style="width: 190px; height: 50px;"  />
                    <font id="txtBrief3" size="3" face="黑体" color="red" style="display: none">请将信息补充完整后再提交(不要输入空字符)!!!</font>
                </div>
            </div>
        </form>
    </c:if>




</div>

<%--必须放在下面--%>
<script src="../plug/jquery/jquery.min.js"></script>
<script src="../plug/popui/js/modal.js"></script>
<script src="../plug/popui/js/script.js"></script>

<script src="../plug/angular/angular.min.js"></script>
<script src="../plug/popcity/js/selectAddressData.js"></script>
<script>
    (function() {
        var app;
        app = angular.module('app', ['selectAddress']);
        angular.bootstrap(document, ['app']);

    }).call(this);
</script>



</body>

</html>
