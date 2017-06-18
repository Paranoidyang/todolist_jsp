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
       
        // ������û���������
        String txtUsername;
        String txtPassword;
      
        // ��������
        txtUsername = request.getParameter("txtUserName");
        txtPassword = request.getParameter("txtPassword");

            try {
            	 createConnect connect = new createConnect();

            	 connect.ps = (PreparedStatement) connect.ct
                        .prepareStatement("insert userinfo (username,password) values(?,?)");
            	 connect.ps.setString(1, txtUsername); // ����һ��������Ϊ����txtUsername
            	 connect.ps.setString(2, txtPassword); // ���ڶ���?����Ϊ����txtPassword
                // rs��һ��ResultSet�����,���԰�rs���ɷ���һ�ű��еĽ����
                int i = connect.ps.executeUpdate(); // ִ�в��ҿ��Ƿ���ڣ��еĻ�rs.next()����true,��֮Ϊ
                                        // false
                // �������ɹ����򵯳�ע��ɹ�
                if (i==1) {
                    System.out.println("ע��ɹ�");
                    response.sendRedirect("login.jsp");
                   
                } else {
                    System.out.println("ע��ʧ��");
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