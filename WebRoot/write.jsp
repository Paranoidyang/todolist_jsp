<%@ page language="java" import="java.util.*,java.net.*"
	pageEncoding="utf8"%>
<%@ page import="dal.*"%>
<%
	String user = (String) session.getAttribute("admin");
%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String username = "";
        String password = "";
        Cookie[] arrCookie = request.getCookies();
        if (arrCookie != null) {
            for (Cookie ck : arrCookie) {
                if (ck.getName().equals("txtUserName")) {
                    username = URLDecoder.decode(ck.getValue(), "utf-8");
                }
                if (ck.getName().equals("txtPassword")) {
                    password = URLDecoder.decode(ck.getValue(), "utf-8");
                    break;
                }
            }
        }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=yes">
<title>简易留言板</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/cover.css">
<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/vue.js"></script>

<script>
	window.onload = function() {//可以在加载页面的时候渲染页面
		new Vue({
			el : ".cover",
			data : {
				username : '',
				todolist : '',
				nowIndex : -100,
				myData : [

				]
			},
			methods : {
				add : function() {
					this.myData.push({
						name : this.username,
						todolist : this.todolist
					});

					this.username = '';
					this.todolist = '';
				},
				deleteMsg : function(n) {
					if (n == -1) {
						this.myData = [];
					} else {
						this.myData.splice(n, 1);
					}
				}
			}
		})
	}
</script>
</head>
<body>

	<div class="site-wrapper">

		<div class="site-wrapper-inner">

			<div class="cover-container">

				<div class="masthead clearfix">
					<div class="inner">
						<h2 class="masthead-brand">留言板主页</h2>
						<ul class="nav masthead-nav">
							<li class="active"><a href="home.jsp">首页</a></li>

							</li>
							<%
								if (user == null) {
							%>
							<li><a onclick="alert('请您先登录！')">写留言</a>
							<li><a href="login.jsp">登录</a></li>
							<li><a href="register.jsp">注册</a></li>


							<%
								} else {
							%>
							<li><a href="write.jsp">写留言</a>
							<li><a href="Logout.jsp" onclick="alert('已成功注销')">注销</a>
							</li>

							<li>

								<div class="image">
									<img src="image/head.jpg" />
								</div> <span id="user"><%=user%></span></li>


							<%
								}
							%>

						</ul>
					</div>
				</div>
				<div class="inner cover">
					<form rol="form">
						<div class="form-group">
							<label for="username">用户名：</label> <input id="username"
								v-model="username" placeholder="输入用户名" class="form-control"
								type="text">
						</div>
						<div class="form-group">
							<label for="todolist">留言</label> <input id="todolist" v-model="todolist"
								placeholder="输入留言" class="form-control" type="text">
						</div>
						<div class="form-group">
							<input type="button" value="添加" class="btn btn-primary"
								v-on:click="add()"> <input type="reset" value="重置"
								class="btn btn-danger">
						</div>
					</form>
					<hr>
					<table class="table table-bordered table-hover">
						<caption class="h3 text-info">留言信息表</caption>
						<tr class="text-danger">
							<th class="text-center">序号</th>
							<th class="text-center">名字</th>
							<th class="text-center">留言</th>
							<th class="text-center">操作</th>
						</tr>
						<tr class="text-center" v-for="(item,index) in myData">
							<td>{{index+1}}</td>
							<td>{{item.name}}</td>
							<td>{{item.todolist}}</td>
							<td><input class="btn btn-primary btn-sm"
								data-toggle="modal" data-target="#layer" type="button"
								value="删除" v-on:click="nowIndex=$index">
							</td>
						</tr>
						<tr class="text-right" v-show="myData.length != 0">
							<td colspan="4">
								<button class="btn btn-danger btn-sm" data-toggle="modal"
									data-target="#layer" v-on:click="nowIndex='-1'">删除全部</button></td>
						</tr>
						<tr v-show="myData.length==0">
							<td colspan="4" class="text-center text-muted">
								<p>暂无数据...</p></td>
						</tr>
					</table>

					<!-- 模态框 弹出框 -->
					<div role="dialog" class="modal fade" id="layer">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span>&times;</span>
									</button>
									<h4 class="modal-title">确认删除吗？</h4>
								</div>
								<div class="modal-body text-right">
									<button class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
									<button class="btn btn-danger btn-sm" data-dismiss="modal"
										v-on:click="deleteMsg(nowIndex)">确认</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="mastfoot">
					<div class="inner">
						<p>
							留言板 @author <a href="https://github.com/Paranoidyang">Paranoidyang
								Github</a>.
						</p>
					</div>
				</div>

			</div>

		</div>

	</div>

	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>