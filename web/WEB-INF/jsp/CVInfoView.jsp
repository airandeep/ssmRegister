<%--
  Created by IntelliJ IDEA.
  User: Airan
  Date: 2018/3/20
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

    <title>AIRANCVSHOW</title>
    <link rel="stylesheet" href="../css/CVInfo1.css" />
    <link rel="stylesheet" href="../css/CVInfo2.css" />
    <link rel="stylesheet" href="../plug/layui/css/layui.css" />
    <script src="../plug/layui/layui.js"></script>
    <script language="javascript">
        function loadLayoutData() {
            layui.use('laydate', function(){
                var laydate = layui.laydate;

                //执行一个laydate实例
                laydate.render({
                    elem: '#bornTime' //指定元素
                    ,theme: '#FFB90F'
                });
                laydate.render({
                    elem: '#workTime'
                    ,type: 'year'
                    ,range: true
                    ,theme: '#FFB90F'
                });
            });

        }

        function showBaseDetailEdit() {
            var d = document.getElementById("baseDetail");
            var de = document.getElementById("baseDetailEdit");
            d.style.display = "none";
            de.style.display = "block";

            var test = document.getElementById("baseDetail_index");
            test.href = "#baseDetailEdit";
        }

        function showBaseDetail()
        {
            var d = document.getElementById("baseDetail");
            var de = document.getElementById("baseDetailEdit");
            d.style.display = "block";
            de.style.display = "none"

            var test = document.getElementById("baseDetail_index");
            test.href = "#baseDetail";
        }

        function showConstellationEdit() {
            var d = document.getElementById("constellation");
            var de = document.getElementById("constellationEdit");
            d.style.display = "none";
            de.style.display = "block";

            var test = document.getElementById("constellation_index");
            test.href = "#constellationEdit";
        }

        function showConstellation() {
            var d = document.getElementById("constellation");
            var de = document.getElementById("constellationEdit");
            d.style.display = "block";
            de.style.display = "none";

            var test = document.getElementById("constellation_index");
            test.href = "#constellation";
        }

        function showThreeNumberEdit() {
            var d = document.getElementById("threeNumber");
            var de = document.getElementById("threeNumberEdit");
            d.style.display = "none";
            de.style.display = "block";

            var test = document.getElementById("threeNumber_index");
            test.href = "#threeNumberEdit";
        }
        function showThreeNumber() {
            var d = document.getElementById("threeNumber");
            var de = document.getElementById("threeNumberEdit");
            d.style.display = "block";
            de.style.display = "none";
            var test = document.getElementById("threeNumber_index");
            test.href = "#threeNumber";
        }

        var myNodes = new Array("baseDetail_complete","constellation_complete","threeNumber_complete","work_complete",
            "project_complete","education_complete","skills_complete","additional_complete");
        function test(_test) {
            var test = document.getElementById(myNodes[_test]);
            test.setAttribute("class","right y");
            for(var i = 0;i<myNodes.length;i++)
            {
                if(i == _test)
                    continue;
                test = document.getElementById(myNodes[i]);
                test.setAttribute("class","right n");
            }

        }
    </script>


</head>
<body onload="loadLayoutData()">
<div class="header" id="top">
    <div class="nag">
        <div class="in">
            <a href="http://www.51job.com">
                <img class="logo" width="116" height="46" src="../images/logo2.png" alt="AIRAN">
            </a>
            <p class="nlink n2">
                <a>AIRAN</a>
                <a>AIRAN</a>
                <a>AIRAN</a>
            </p>
        </div>
    </div>
</div>

<div class="main ">
    <!-- index -->
    <div class="nav">
        <div class="top_wrap" id="resume">
            <div class="nav_top">
                <p class="nkt">
                    <span class="name" id="resume_nameview">我的简历</span>
                    <span class="ed_icon_blue icons"  event-type="1"></span>
                    <span class="ed_icon_yellow icons"></span>
                </p>

            </div>
            <div class="cupBox">
                <div class="cup">更新：<span id="resume_lastupdate">2018-03-20</span></div>
                <div class="cup dt">
                    公开：<span id="resume_openess">完全保密</span>
                </div>
                <div class="cup dt">
                    <span class="n_star" id="resume_bstar"></span><span class="star s2_5" id="resume_star"></span>

                </div>
                <div class="cup"><a id="resume_switchto">英文简历></a></div>
            </div>
            <div class="btnbox">
                <span class="p_but " onclick="refreshResume()" >刷新</span><span class="p_but  geige"  >预览</span>
            </div>
        </div>
        <div class="nav_body">
            <a href="#baseDetail"  id="baseDetail_index" onclick="test(0)"><span class="left a"></span>基本信息<span id="baseDetail_complete" class="right y"></span></a>
            <a href="#constellation" id="constellation_index" onclick="test(1)"><span class="left b"></span>星座<span id="constellation_complete" class="right n"></span></a>
            <a href="#threeNumber" id="threeNumber_index" onclick="test(2)"><span class="left f"></span>三维<span id="threeNumber_complete" class="right n"></span></a>
            <a href="#work" id="work_index" onclick="test(3)"><span class="left c"></span>工作经验<span id="work_complete" class="right n"></span></a>
            <a href="#project"  id="project_index" onclick="test(4)"><span class="left d"></span>项目经验<span id="project_complete" class="right n"></span></a>
            <a href="#education" id="education_index" onclick="test(5)"><span class="left e"></span>教育经历<span id="education_complete" class="right n"></span></a>

            <a href="#skills" class="" id="skills_index" onclick="test(6)"><span class="left g"></span>技能特长<span id="skills_complete" class="right n"></span></a>
            <a href="#additional" id="additional_index" onclick="test(7)"><span class="left h"></span>附加信息<span id="additional_complete" class="right n"></span></a>
        </div>
    </div>
    <!-- main -->
    <c:set var="item" value="${CVInfo }" />
    <div class="column Fm" id="mainContent">
        <div class="box mk top_wrap" id="baseDetail" style="display: block;">
            <div class="head" id="Basic">
                <div class="face"><img src="../images/man.png" width="85" height="104" alt="头像"></div>
                <div class="name">${item.name }</div>
                <p class="at">${item.liveLocation }&nbsp;│&nbsp;${item.workTime }&nbsp;│&nbsp;${item.sex }&nbsp;
                    │&nbsp;${item.bornTime }&nbsp;│&nbsp;${item.bornLocation }</p>
                <div class="tab">
                    <span class="email icons at" title="1069299538@qq.com">${item.email }</span>&nbsp;<span class="tel icons">${item.phoneNumber }</span>
                </div>
            </div>
            <span class="ed_icon_blue icons" id="baseDetail_edit" onclick="showBaseDetailEdit()"></span><span class="ed_icon_yellow icons"></span>
        </div>
        <div class="box mk top_wrap" id="baseDetailEdit" style="display: none;">
            <form id="fm" action="updateBaseDetail" method="post">
            <div class="head" id="BasicEdit">
                <div class="face"><img src="../images/man.png" width="85" height="104" alt="头像"></div>
                <div class="layui-inline">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="name" name="name" value="${item.name }">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-inline" style="line-height:40px">
                        <label style="width: auto; cursor: pointer;" bind_hidden="gender">男</label>
                        <input type="radio" name="sex" value="男" title="男" checked="">
                        <label style="width: auto; cursor: pointer;" bind_hidden="gender">女</label>
                        <input type="radio" name="sex" value="女" title="女">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">出生日期</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="bornTime" name="bornTime" value="${item.bornTime }" >
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">始工作年份</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="workTime" name="workTime" value="${item.workTime }" >
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">手机</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="phoneNumber" name="phoneNumber" value="${item.phoneNumber }" >
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">出生地</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="bornLocation" name="bornLocation" value="${item.bornLocation }" >
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="email" name="email" value="${item.email }">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">居住地</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="liveLocation" name="liveLocation" value="${item.liveLocation }">
                    </div>
                </div>
                <div class="layui-btn-container" style=" position:relative; left:200px;">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1"  >确定</button>
                    <button type="reset" class="layui-btn layui-btn-primary" onclick="showBaseDetail()">取消</button>
                </div>
            </div>
            </form>

        </div>

        <div class="box m1 top_wrap" id="constellation" style="display: block;">
            <div class="hd">
                <strong class="icons"><em class="e0 icons"></em>星座</strong>&nbsp;&nbsp;&nbsp;
                <span class="f16" >${item.constellation }</span>
            </div>
            <span class="ed_icon_blue icons" id="salary_edit" onclick="showConstellationEdit()"></span>
            <span class="ed_icon_yellow icons"></span>
        </div>
        <div class="box m1 top_wrap" id="constellationEdit" style="display: none;">
            <form id="fm2" action="updateConstellation" method="post">
            <div class="hd">
                <strong class="icons"><em class="e0 icons"></em>星座</strong>
                <div class="layui-inline" style=" position:relative; left:23px;">
                    <label class="layui-form-label" style="line-height:40px">星座</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="userConstellation" name="userConstellation" value="${item.constellation }">
                    </div>
                </div>
            </div>
            <div class="layui-btn-container" style="text-align:center">
                <button class="layui-btn" lay-submit="" lay-filter="demo1" >确定</button>
                <button type="reset" class="layui-btn layui-btn-primary" onclick="showConstellation()">取消</button>
            </div>
            </form>
        </div>

        <div class="box mk top_wrap" id="threeNumber" style="display: block;">
            <div class="hd">
                <strong class="icons" ><em class="e1 icons"></em>XX</strong>&nbsp;&nbsp;&nbsp;
                <span class="f16">${item.threeNumber }</span>
            </div>
            <span class="ed_icon_blue icons" id="intention_new" onclick="showThreeNumberEdit()"></span>
            <span class="ed_icon_yellow icons"></span>
        </div>
        <div class="box mk top_wrap" id="threeNumberEdit" style="display: none;">
            <form id="fm3" action="updateThreeNumber" method="post">
            <div class="hd">
                <strong class="icons"><em class="e0 icons"></em>XX</strong>
                <div class="layui-inline" style=" position:relative; left:23px;">
                    <label class="layui-form-label" style="line-height:40px">XX</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="userThreeNumber" name="userThreeNumber" value="${item.threeNumber }">
                    </div>
                </div>
            </div>
            <div class="layui-btn-container" style="text-align:center">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">确定</button>
                <button type="reset" class="layui-btn layui-btn-primary" onclick="showThreeNumber()">取消</button>
            </div>
            </form>
        </div>



        <div class="box mk">
            <div class="hd">
                <strong class="icons" id="work"><em class="e2 icons"></em>工作经验</strong>
                <a id="work_new"  class="add icons">新增工作</a>
            </div>
            <div id="workPlus"><div class="none icons" id="work_empty">完善工作经验，展现工作内容及能力，让AIRAN更了解你！</div></div>
        </div>
        <div class="box mk">
            <div class="hd">
                <strong class="icons" id="project"><em class="e3 icons"></em>项目经验</strong>
                <a id="project_new"  class="add icons">新增项目</a>
            </div>
            <div id="projectPlus">
                <div class="none icons" id="project_empty">完善项目经验，展现社会工作能力，让AIRAN更了解你！</div>
            </div>
        </div>
        <div class="box mk">
            <div class="hd">
                <strong class="icons" id="education"><em class="e4 icons"></em>教育经历</strong>
                <a id="education_new"  class="add icons">新增教育</a>
            </div>
            <div id="educationPlus">
                <div class="bd" id="education_view_152945008">
                    <div class="con edit">
                        <div class="sp">
                            <span>2006/1-2006/2</span>
                            <span class="at" title="dfsfds">AIRAN</span>
                            <span class="cl3 w140 at">AIRAN</span>
                        </div>
                        <div class="clear"></div>
                        <span class="ed_icon">
								<em class="edi icons" id="education_edit_152945008" onclick="editButtonClick(this)">
								</em><em class="del icons" id="education_delete_152945008" onclick="deleteButtonClick(this)"></em>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="box mk">
            <div class="hd">
                <strong class="icons" id="skills"><em class="e6 icons"></em>技能特长</strong>
                <span class="f12">（包含IT技能、语言能力、证书、成绩、培训经历）</span>
            </div>
            <div class="tit">
                <span>技能/语言</span>
                <a id="skilllanguage_new" onclick="newButtonClick(this);" class="add icons">新增技能/语言</a>
            </div>
            <div id="skilllanguage">
                <div class="none icons" id="skilllanguage_empty">完善计算机及语言能力，展现特长，让AIRAN更了解你！</div>
            </div>
            <div class="tit">
                <span>证书</span>
                <a id="skillcertification_new" onclick="newButtonClick(this);" class="add icons">新增证书</a>
            </div>
            <div id="skillcertification">
                <div class="none icons" id="skillcertification_empty">完善所获证书，展现专业技能，让AIRAN更了解你！</div>
            </div>
            <div class="tit">
                <span>培训经历</span>
                <a id="skilltrain_new"  class="add icons">新增培训</a>
            </div>
            <div id="skilltrain">
                <div class="none icons" id="skilltrain_empty">完善培训经历，展现更多专业技能，让AIRAN更了解你！</div>
            </div>
        </div>
        <div class="box mk">
            <div class="hd">
                <strong class="icons" id="additional"><em class="e7 icons"></em>附加信息</strong>
            </div>
            <div class="tit" id="additionattach_title">
                <span>附件</span>
                <a id="additionattach_new" >" class="add icons">新增附件</a>
            </div>
            <div id="additionattach">
                <div class="none icons" id="additionattach_empty">完善附件信息，展现专业能力，让AIRAN更了解你！</div>
            </div>
            <div class="tit" id="additionother_title">
                <span>其他</span>
                <a id="additionother_new"  class="add icons">新增其他</a>
            </div>
            <div id="additionother">
                <div class="none icons" id="additionother_empty">完善其他信息，丰富简历，让AIRAN更了解你！</div>
            </div>
        </div>
    </div>


    <div class="footer f2">
        <div class="in">
            <p class="note">
                <span>AIRAN&nbsp;|&nbsp;AIRAN&copy;8102-10000</span>
            </p>
        </div>
    </div>
</div>


</body>
</html>
