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
<title>扯淡留言板-留言区</title>
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
<script>
	function get_time() {
		var date = new Date();
		var year = "", month = "", day = "", week = "", hour = "", minute = "", second = "";
		year = date.getFullYear();
		month = add_zero(date.getMonth() + 1);
		day = add_zero(date.getDate());
		week = date.getDay();
		switch (date.getDay()) {
		case 0:
			val = "周日";
			break
		case 1:
			val = "周一";
			break
		case 2:
			val = "周二";
			break
		case 3:
			val = "周三";
			break
		case 4:
			val = "周四";
			break
		case 5:
			val = "周五";
			break
		case 6:
			val = "周六";
			break
		}
		hour = add_zero(date.getHours());
		minute = add_zero(date.getMinutes());
		second = add_zero(date.getSeconds());
		document.getElementById("timetable").innerHTML = " " + year + "-"
				+ month + "-" + day + " " + hour + ":" + minute + ":" + second
				+ " " + val;
	}
	function add_zero(temp) {
		if (temp < 10)
			return "0" + temp;
		else
			return temp;
	}
	setTimeout("get_time()", 0);//代码延迟0ms开始执行，获取某个时刻的时间
	//setInterval("get_time()",1000);//代码每隔1000ms执行一次，让时间动态的变化，类似时钟
</script>
</head>
<body>

	<div class="site-wrapper">

		<div class="site-wrapper-inner">

			<div class="cover-container">

				<div class="masthead clearfix">
					<div class="inner">
						<h2 class="masthead-brand">留言区</h2>
						<ul class="nav masthead-nav">
							<li><a href="home.jsp">首页</a></li>
							<li class="active"><a href="write.jsp">写留言</a>
							<li><a href="Logout.jsp" onclick="alert('已成功注销')">注销</a>
							</li>

							<li>

								<div class="image">
									<img src="image/head.jpg" />
								</div> <span id="user"><%=user%></span></li>
						</ul>
					</div>
				</div>
				<div class="inner cover">
					<form rol="form" action="add_todolist">
						<div class="form-group">
							<label for="todolist">留言</label> <input id="todolist"
								name="todolist" v-model="todolist" placeholder="输入留言"
								class="form-control" type="text">
						</div>
						
						<div class="form-group">
							<input type="button" value="预览" class="btn btn-primary" v-on:click="add()"/>
							<input type="submit" value="添加" class="btn btn-primary"/>
							<input type="reset" value="重置" class="btn btn-danger"/>
						</div>
						
						<hr>
						<table class="table table-bordered table-hover">
							<caption class="h3 text-info">留言信息表</caption>
							<tr class="text-danger">
								<th class="text-center">序号</th>
								<th class="text-center">名字</th>
								<th class="text-center">时间</th>
								<th class="text-center">留言</th>
								<th class="text-center">操作</th>
							</tr>
							<tr class="text-center" v-for="(item,index) in myData">
								<td>{{index+1}}</td>
								<td><input name="user" type="hidden" ><%=user%></input></td>
								<td><input name="time" type="hidden"><span id="timetable"></span></input></td>
								<td><input name="todolist" type="hidden">{{item.todolist}}</input></td>
								<td><input class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#layer" type="button"
									value="删除" v-on:click="nowIndex=$index">
								</td>
							</tr>
							<tr class="text-right" v-show="myData.length != 0">
								<td colspan="5">
									<button class="btn btn-danger btn-sm center-block"
										data-toggle="modal" data-target="#layer"
										v-on:click="nowIndex='-1'">删除全部</button></td>
							</tr>
							<tr v-show="myData.length==0">
								<td colspan="5" class="text-center text-muted">
									<p>暂无数据...</p></td>
							</tr>
						</table>

					</form>

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