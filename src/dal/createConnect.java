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
        // 驱动程序名
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        // URL指向要访问的数据库名
        String url = "jdbc:sqlserver://pc.hstc.cn:1433;databaseName=wpd2014116237";
        //数据库配置时的用户名
        String user = "2014116237";
        // 数据库配置时的密码
        String password = "19951212";
        
        try {
            // 加载驱动程序
            Class.forName(driver);
            // getConnection()方法，连接数据库！！
            ct = (Connection) DriverManager.getConnection(url, user,
                    password);
            if (ct != null) {
                System.out.println("数据库连接成功!");
            }
        }catch (Exception e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
    }  
	
}



