<%@page pageEncoding="UTF-8" isELIgnored="false" %>
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
            <div><a class="navbar-brand" style="font-size:32px;" href="user.html">众筹平台 - 角色维护</a></div>
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
                <%@include file="/WEB-INF/jsp/common/menu.jsp" %>
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
				<form>
				  <div class="form-group">
					<label for="name">角色名称</label>
					<input type="text" class="form-control" id="name" placeholder="请输入角色名称">
				  </div>
				  <button id="saveBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 新增</button>
				  <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
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

			var loadingIndex = -1 ;
            $("#saveBtn").click(function () {
				var name = $("#name") ;
				/*alert(name.val());*/
				$.ajax({
					type:"POST",
					data:{
						"name":name.val()
					},
					url:"${APP_PATH}/role/doAdd.do",
					beforeSend:function () {
						loadingIndex = layer.msg('数据保存中', {icon: 16});
						return true;
					},
					success:function (result) {

						if (result.successful){
							layer.close(loadingIndex);
							/*alert(result.successful) ;*/
							layer.msg("角色信息保存成功", {time:1000, icon:6})
							window.location.href="${APP_PATH}/role/index.htm" ;
						}
						else {
							layer.msg("角色信息保存失败", {time:1000, icon:5, shift:6});
						}
					}
				});
			});
            
           /* $("#saveBtn").click(function(){
            	var loadingIndex = -1;
            	// 提交表单
            	$.ajax({

            		type : "POST",
            		data : {
            			"name"  : $("#name").val()
            		},
            		beforeSend : function() {
            			loadingIndex = layer.msg('数据保存中', {icon: 16});
            		},
            		success : function(result) {
            			layer.close(loadingIndex);
            			if ( result.success ) {
            				layer.msg("角色信息保存成功", {time:1000, icon:6}, function(){

            				});
            			} else {
            				layer.msg("角色信息保存失败", {time:1000, icon:5, shift:6});
            			}
            		}
            	});
            });*/
        </script>
  </body>
</html>
