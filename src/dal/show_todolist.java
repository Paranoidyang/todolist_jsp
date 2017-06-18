package dal;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class show_todolist {
	 public ResultSet rs; 
	public ArrayList arr1;
	public int count;
	public static void main(String args[]){
		new show_todolist();
	}
	public show_todolist() {
        
        try {
           createConnect connect = new createConnect();
            
           connect.ps = connect.ct.prepareStatement("select * from todolist ");  
            // 这是一个ResultSet结果集,可以把ResultSet理解成返回一张表行的结果集  
            rs = connect.ps.executeQuery(); 
            count = 0;
            arr1= new ArrayList();
            while(rs.next())     
            {  
                  count++;
            	  List arr2 = new ArrayList();
                  for(int i=1;i<=3;i++){
                	  arr2.add(rs.getString(i));          
                  }
                  arr1.add(arr2);
            }
        }catch (Exception e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
    }  
	
}



