<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String user = (String) session.getAttribute("admin");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<title>留言板主页</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/cover.css" rel="stylesheet">
<script src="js/ie-emulation-modes-warning.js"></script>

</head>

<body>

	<div class="site-wrapper">

		<div class="site-wrapper-inner">

			<div class="cover-container">

				<div class="masthead clearfix">
					<div class="inner">
						<h2 class="masthead-brand">留言板主页</h2>
						<ul class="nav masthead-nav">
							<li class="active"><a href="home.jsp">首页</a>
							</li>
							
							</li>
							<%
								if (user == null) {
							%>
							<li><a onclick="alert('请您先登录！')">写留言</a>
							<li><a href="login.jsp">登录</a>
							</li>
							<li><a href="register.jsp">注册</a>
							</li>


							<%
								} else {
							%>
							<li><a href="write.jsp">写留言</a>
							<li><a href="Logout.jsp" onclick="alert('已成功注销')">注销</a></li>

							<li>

								<div class="image">
									<img src="image/head.jpg" />
								</div>
								<span id="user"><%=user%></span>
							</li>


							<%
								}
							%>

						</ul>
					</div>
				</div>
				<!-- div style="background:url(img/567.jpg);">  -->
				<div class="inner cover">
					<h1 class="cover-heading">欢迎来到留言板主页</h1>
					<p class="lead">有朋自远方来，不亦乐乎！</p>
					<p class="lead">
						<a href="showmain.jsp" class="btn btn-lg btn-default">查看已有留言</a>
					</p>
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
