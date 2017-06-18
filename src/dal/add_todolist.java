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
       
        // ��ȡ������Ϣ�е��û������ύʱ�䡢��������
        String user;
        String time;
        String todolist;
      
        // ��������
        user = request.getParameter("user");
        time = request.getParameter("time");
        todolist = request.getParameter("todolist");

            try {
            	 createConnect connect = new createConnect();

            	 connect.ps = (PreparedStatement) connect.ct
                        .prepareStatement("insert todolist (username,time,todolist) values(?,?,?)");
            	 connect.ps.setString(1, user); // ����һ��������Ϊ����user
            	 connect.ps.setString(2, time); // ���ڶ���?����Ϊ����time
            	 connect.ps.setString(3, todolist);// ��������?����Ϊ����todolist
                // rs��һ��ResultSet�����,���԰�rs���ɷ���һ�ű��еĽ����
                int i = connect.ps.executeUpdate(); // ִ�в��ҿ��Ƿ���ڣ��еĻ�rs.next()����true,��֮Ϊ
                                        // false
                // �������ɹ����򵯳����Գɹ�
                if (i==1) {
                    System.out.println("���Գɹ�");
                    response.sendRedirect("write.jsp");
                   
                } else {
                    System.out.println("����ʧ��");
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