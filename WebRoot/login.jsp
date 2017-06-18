<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="utf8"%>
<%@ page import="dal.*" %>
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
    <meta charset="utf-8">
<title>环球书城-登录</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/global.css">
<script type="text/javascript">
	function checkNull(){
		if(txtUserName.value == ""){
			errUserName.style.display = "block";
			return false;
		}
		if(txtPassword.value == ""){
			errPassword.style.display = "block";
			return false;
		}
		if(txtCheckCode.value == ""){
			errCheckCode.style.display = "block";
			return false;
		}
	}
	function refreshValidateCode(){
		idValidateCode.src="servlet/ValidateCode?id=" + new Date().getTime();
	}
</script>

</head>
  
  <body>
	<div id="loginModal" class="modal show">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="text-center text-primary">扯淡留言板欢迎您!</h1>
				</div>
				<div class="modal-body">
					<div class="row">
						<form action="checkLogin" method="post" class="form-horizontal col-md-12 center-block" onSubmit="return checkNull()">
							<div class="form-group">
								<div class="col-md-2 text-right">
									<label for="txtUserName" class="control-label">帐号:</label>
								</div>
								<div class="col-md-8">
									<input type="text" id="txtUserName" name="txtUserName"
										class="form-control input-lg" placeholder="请输入帐号" />
								</div>
								<div class="col-md-2">
									<label id="errUserName" class="control-label" style="display:none;color:red;text-align:left">*</label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-2 text-right">
									<label for="txtPassword" class="control-label">密码:</label>
								</div>
								<div class="col-md-8">
									<input type="password" id="txtPassword" name="txtPassword"
										class="form-control input-lg" placeholder="请输入密码" />
								</div>
								<div class="col-md-2">
									<label id="errPassword" class="control-label" style="display:none;color:red;text-align:left">*</label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-2 text-right">
									<label for="txtCheckCode" class="control-label"></label>
								</div>
								<div class="col-md-4">
									<input type="text" id="txtCheckCode" name="txtCheckCode"
										class="form-control input-lg" placeholder="请输入验证码" />
								</div>
								<div class="col-md-1">
									<label id="errCheckCode" class="control-label" style="display:none;color:red;text-align:left">*</label>
								</div>
								<div class="col-md-2">
									<a href="javascript:refreshValidateCode();"><img src="servlet/ValidateCode" id="idValidateCode"/></a>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-2 col-md-10">
									<div class="checkbox">
										<label><input type="checkbox">记住我</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-2 col-md-4">
								<button class="btn btn-primary btn-lg btn-block">登录</button>
								</div>
								<div class="col-md-4">
								<button class="btn btn-primary btn-lg btn-block">重填</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<div class="col-md-5">
						<span><a href="#">找回密码</a></span>
					</div>
					<div class="col-md-4">
						<span><a href="register.jsp" class="pull-right">还没账号？注册</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>
