package dal;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection; 
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  

public class register extends HttpServlet {
	ResultSet rs; 

    public register() {
        super();
    }

    public void destroy() {
        super.destroy();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        // 输入的用户名和密码
        String txtUsername;
        String txtPassword;
      
        // 接收数据
        txtUsername = request.getParameter("txtUserName");
        txtPassword = request.getParameter("txtPassword");

            try {
            	 createConnect connect = new createConnect();

            	 connect.ps = (PreparedStatement) connect.ct
                        .prepareStatement("insert userinfo (username,password) values(?,?)");
            	 connect.ps.setString(1, txtUsername); // 将第一个？设置为参数txtUsername
            	 connect.ps.setString(2, txtPassword); // 将第二个?设置为参数txtPassword
                // rs是一个ResultSet结果集,可以把rs理解成返回一张表行的结果集
                int i = connect.ps.executeUpdate(); // 执行查找看是否存在，有的话rs.next()返回true,反之为
                                        // false
                // 如果插入成功，则弹出注册成功
                if (i==1) {
                    System.out.println("注册成功");
                    response.sendRedirect("login.jsp");
                   
                } else {
                    System.out.println("注册失败");
                    response.sendRedirect("register.jsp");
                }
                connect.ct.close();

            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
          
        } 
       
    

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    public void init() throws ServletException {

    }

}