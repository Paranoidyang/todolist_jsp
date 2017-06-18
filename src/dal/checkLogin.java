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

public class checkLogin extends HttpServlet {
	 ResultSet rs; 

    public checkLogin() {
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
        // ���ݿ��д洢���û���������
        String myuserword;
        String mypwd;

        // ��������
        txtUsername = request.getParameter("txtUserName");
        txtPassword = request.getParameter("txtPassword");

        // ��֤����
        String txtCheckCode = request.getParameter("txtCheckCode");// ��ȡ��������������֤��
        String CheckCode = request.getSession().getAttribute("randCheckCode")
                .toString();// ��ȡ��֤����ʵ��ֵ
        boolean judgeCheckCode = txtCheckCode.equals(CheckCode);// �ȶ��������֤������ʵ��֤���Ƿ�һ��

        // �����֤����ȷ�����������ݿ⣬�Ա��û���������
        if (judgeCheckCode) {
            System.out.println("��֤����ȷ");
            System.out.println("�����������ݿ�...");

            try {
            	 createConnect connect = new createConnect();

            	 connect.ps = (PreparedStatement) connect.ct
                        .prepareStatement("select * from userinfo where username=? and password=? ");
            	 connect.ps.setString(1, txtUsername); // ����һ��������Ϊ����txtUsername
            	 connect.ps.setString(2, txtPassword); // ���ڶ���?����Ϊ����txtPassword
                // rs��һ��ResultSet�����,���԰�rs���ɷ���һ�ű��еĽ����
                rs = connect.ps.executeQuery(); // ִ�в��ҿ��Ƿ���ڣ��еĻ�rs.next()����true,��֮Ϊ
                                        // false
                // ������ڴ��û�������ת��������
                if (rs.next()) {
                    myuserword = rs.getString(1);// ��ñ��ĵ�һ�У��˴�Ϊ�û���
                    mypwd = rs.getString(2); // ��ñ��ĵڶ��У��˴�Ϊ����
                    System.out.println("�ɹ���login���ݿ��users���л�ȡ���û��������룺");
                    System.out.println(myuserword + "\t" + mypwd + "\t");// ��\t��Ϊ��ת���ַ���,�������һ��tab��Ҳ����8���ո�
                    response.sendRedirect("home.jsp");
                } else {
                    System.out.println("û�и��û�������������");
                    response.sendRedirect("login.jsp");
                }
                connect.ct.close();

            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            // �����֤����󣬾���ת�ص�¼����
        } else {
            System.out.println("��֤�����");
            response.sendRedirect("login.jsp");
        }
        //�����û�����session
        request.getSession().setAttribute("admin",txtUsername);

        // �ж��Ƿ�ѡʮ�����¼
        boolean isRememberUser = (request.getParameter("isUseCookie") != null);
        if (isRememberUser) {// Ҫ��ס�û�
            // ���û��������뱣����Cookie��������
            String username = URLEncoder.encode(txtUsername, "utf-8");
            // ʹ��URLEncoder����޷���Cookie���б��������ַ������⣬
            String pwd = URLEncoder.encode(txtPassword, "utf-8");

            Cookie usernameCookie = new Cookie("UserName", username);
            Cookie passwordCookie = new Cookie("PassWord", pwd);
            usernameCookie.setMaxAge(60*60*24*10);
            passwordCookie.setMaxAge(60*60*24*10);// ���������������Ϊ10��
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
        } else {
            Cookie[] cookies = request.getCookies();
            if (cookies != null && cookies.length > 0) {
                for (Cookie c : cookies) {
                    if (c.getName().equals("UserName")
                            || c.getName().equals("PassWord")) {
                        c.setMaxAge(0); // ����CookieʧЧ
                        response.addCookie(c); // ���±��档
                    }
                }
            }
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    public void init() throws ServletException {

    }

}