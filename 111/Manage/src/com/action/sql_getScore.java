package com.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.beans.plant_Message;
import com.beans.record;

public class sql_getScore {
	public  List<record> sql_getScore(){
   	 List<record> p_list=new ArrayList<>();
       try {
           Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动
          // System.out.println("加载数据库驱动成功");
           String url="jdbc:mysql://127.0.0.1:3306/xpxdemo?autoReconnect=true&useUnicode=true&characterEncoding=utf8";//声明数据库test的url
           String user="root";//数据库的用户名
           String password="www.cjjjs.com";//数据库的密码
           //建立数据库连接，获得连接对象conn(抛出异常即可)
           Connection conn=DriverManager.getConnection(url, user, password);
          // System.out.println("连接数据库成功");
           //生成一条mysql语句
           //List<plant_Message>
          // plant_Message plant=new plant_Message();
           String sql="select * from record";   
           //System.out.println(sql);
           Statement stmt=conn.createStatement();//创建一个Statement对象
           ResultSet rs=stmt.executeQuery(sql);//执行查询，把查询结果赋值给结果集对象
           double score;
           //String plant_name,img_big,img_s1,img_s2,img_s3,big_note,plant_text;
           int i=0;
           //List<plant_Message> p_list=new ArrayList<>();
           while(rs.next()){//遍历结果集
        	  score=rs.getDouble("score");
           	 record rd=new record();
           	 rd.setScore(score);
           	p_list.add(rd);
                    }
           //System.out.println("插入到数据库成功");
           conn.close();
          /// System.out.println("关闭数据库成功");
          
       } catch (ClassNotFoundException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
       }//
       catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
       }
       return p_list;
		
       
   
	}

}
