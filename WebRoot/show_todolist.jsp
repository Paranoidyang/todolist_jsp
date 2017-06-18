<%@ page language="java" import="java.util.*,java.net.*"
	pageEncoding="utf8"%>
<%@ page import="dal.*"%>
<%
	String user = (String) session.getAttribute("admin");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<title>扯淡留言板-所有留言</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/cover.css">
<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/vue.js"></script>

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
					<table class="table table-condensed">
						<tr>
							<td>用户名</td>
							<td>留言时间</td>
							<td>留言内容</td>
						</tr>
						
						<%
						show_todolist st = new show_todolist();
							// 将数据从二维数组arr1中取出并填入表格
						for (int i = 0; i < st.count; i++) {// 该循环是取出每一行
								List arr2 = (List) st.arr1.get(i);// i从0开始 计数
			
								String name = (String) arr2.get(0); // t从0开始计数
								String time = (String) arr2.get(1);
								String todolist = (String) arr2.get(2);
						%>
						<tr>
							<td><%=name%></td>
							<td><%=time%></td>
							<td><%=todolist%></td>
						</tr>
						<%
							
						} %>
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