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

public class add_todolist extends HttpServlet {
	ResultSet rs; 

    public add_todolist() {
        super();
    }

    public void destroy() {
        super.destroy();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        // 获取留言信息中的用户名、提交时间、留言内容
        String user;
        String time;
        String todolist;
      
        // 接收数据
        user = request.getParameter("user");
        time = request.getParameter("time");
        todolist = request.getParameter("todolist");

            try {
            	 createConnect connect = new createConnect();

            	 connect.ps = (PreparedStatement) connect.ct
                        .prepareStatement("insert todolist (username,time,todolist) values(?,?,?)");
            	 connect.ps.setString(1, user); // 将第一个？设置为参数user
            	 connect.ps.setString(2, time); // 将第二个?设置为参数time
            	 connect.ps.setString(3, todolist);// 将第三个?设置为参数todolist
                // rs是一个ResultSet结果集,可以把rs理解成返回一张表行的结果集
                int i = connect.ps.executeUpdate(); // 执行查找看是否存在，有的话rs.next()返回true,反之为
                                        // false
                // 如果插入成功，则弹出留言成功
                if (i==1) {
                    System.out.println("留言成功");
                    response.sendRedirect("write.jsp");
                   
                } else {
                    System.out.println("留言失败");
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