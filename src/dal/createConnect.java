package dal;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  

public class createConnect {
	
	public Connection ct;
	public PreparedStatement ps;
	
	public static void main(String args[]){
		new createConnect();
	}
	public createConnect() {
        // ����������
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        // URLָ��Ҫ���ʵ����ݿ���
        String url = "jdbc:sqlserver://pc.hstc.cn:1433;databaseName=wpd2014116237";
        //���ݿ�����ʱ���û���
        String user = "2014116237";
        // ���ݿ�����ʱ������
        String password = "19951212";
        
        try {
            // ������������
            Class.forName(driver);
            // getConnection()�������������ݿ⣡��
            ct = (Connection) DriverManager.getConnection(url, user,
                    password);
            if (ct != null) {
                System.out.println("���ݿ����ӳɹ�!");
            }
        }catch (Exception e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
    }  
	
}



