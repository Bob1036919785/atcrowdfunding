<%--
  Created by IntelliJ IDEA.
  User: 10369
  Date: 2019/5/30
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/main.css">
    <link rel="stylesheet" href="${APP_PATH}/css/doc.min.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="user.html">众筹平台 - 用户维护</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <jsp:include page="/WEB-INF/jsp/common/main.jsp"></jsp:include>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <ul style="padding-left:0px;" class="list-group">
                    <li class="list-group-item tree-closed" >
                        <a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a>
                    </li>
                    <li class="list-group-item">
                        <span><i class="glyphicon glyphicon glyphicon-tasks"></i> 权限管理 <span class="badge" style="float:right">3</span></span>
                        <ul style="margin-top:10px;">
                            <li style="height:30px;">
                                <a href="${APP_PATH}/user/toIndex.htm" style="color:red;"><i class="glyphicon glyphicon-user"></i> 用户维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="role.html"><i class="glyphicon glyphicon-certificate"></i> 角色维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="permission.html"><i class="glyphicon glyphicon-lock"></i> 许可维护</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge" style="float:right">3</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 实名认证审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> 广告审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_project.html"><i class="glyphicon glyphicon-check"></i> 项目审核</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-th-large"></i> 业务管理 <span class="badge" style="float:right">7</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="cert.html"><i class="glyphicon glyphicon-picture"></i> 资质维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="type.html"><i class="glyphicon glyphicon-equalizer"></i> 分类管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="process.html"><i class="glyphicon glyphicon-random"></i> 流程管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="advertisement.html"><i class="glyphicon glyphicon-hdd"></i> 广告管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="message.html"><i class="glyphicon glyphicon-comment"></i> 消息模板</a>
                            </li>
                            <li style="height:30px;">
                                <a href="project_type.html"><i class="glyphicon glyphicon-list"></i> 项目分类</a>
                            </li>
                            <li style="height:30px;">
                                <a href="tag.html"><i class="glyphicon glyphicon-tags"></i> 项目标签</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed" >
                        <a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">数据列表</a></li>
                <li class="active">新增</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                <div class="panel-body">
                    <form id="addForm">
                        <div class="form-group">
                            <label for="floginacct">登陆账号</label>
                            <input type="text" class="form-control" id="floginacct" placeholder="请输入登陆账号">
                        </div>
                        <div class="form-group">
                            <label for="fusername">用户名称</label>
                            <input type="text" class="form-control" id="fusername" placeholder="请输入用户名称">
                        </div>
                        <div class="form-group">
                            <label for="femail">邮箱地址</label>
                            <input type="email" class="form-control" id="femail" placeholder="请输入邮箱地址">
                            <p class="help-block label label-warning">请输入合法的邮箱地址, 格式为： xxxx@xxxx.com</p>
                        </div>
                        <button type="button" class="btn btn-success" id="addBtn"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                        <button type="button" class="btn btn-danger" id="resetBtn"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">帮助</h4>
            </div>
            <div class="modal-body">
                <div class="bs-callout bs-callout-info">
                    <h4>测试标题1</h4>
                    <p>测试内容1，测试内容1，测试内容1，测试内容1，测试内容1，测试内容1</p>
                </div>
                <div class="bs-callout bs-callout-info">
                    <h4>测试标题2</h4>
                    <p>测试内容2，测试内容2，测试内容2，测试内容2，测试内容2，测试内容2</p>
                </div>
            </div>
            <!--
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
            -->
        </div>
    </div>
</div>
<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/script/docs.min.js"></script>
<script src="${APP_PATH}/jquery/layer/layer.js"></script>

<script type="text/javascript">
    $(function () {
        $(".list-group-item").click(function(){
            if ( $(this).find("ul") ) {
                $(this).toggleClass("tree-closed");
                if ( $(this).hasClass("tree-closed") ) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });
    });


    /*增加*/
    $(function () {
        var loginacct = $("#floginacct");
        var username = $("#fusername");
        var email = $("#femail");


        $("#addBtn").click(function () {
            /*alert(loginacct.val());
            alert(username.val());
            alert(email.val());*/
            $.ajax({
                type:"POST",
                data:{
                    "loginacct":loginacct.val(),
                    "username":username.val(),
                    "email":email.val()
                },
                url:"${APP_PATH}/user/doAdd.do",
                befordSend:function () {
                    return true;
                },
                success:function (result) {
                    if (result.successful){
                        window.location.href="${APP_PATH}/user/index.htm" ;
                    }else{
                        layer.msg("添加失败!", {time:1000, icon:5, shift:6});
                    }
                },
                error:function () {
                    layer.msg("添加失败!", {time:1000, icon:5, shift:6}) ;
                },
                dataType:"json"

            });
        });

    })

    $("#resetBtn").click(function () {
        $("#addForm")[0].reset() ;
    });

</script>
</body>
</html>

