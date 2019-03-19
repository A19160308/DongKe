package com.action;


import java.sql.*;

/**
 * 1:向数据库中添加数据
 * @author biexiansheng
 *
 */
public class sqlTest {

    public  void sqlInsert(String[] temp) {
        try {
            Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动
            //System.out.println("加载数据库驱动成功");
            String url="jdbc:mysql://127.0.0.1:3306/xpxdemo?autoReconnect=true&useUnicode=true&characterEncoding=utf8";//声明数据库test的url
            String user="root";//数据库的用户名
            String password="www.cjjjs.com";//数据库的密码
            //建立数据库连接，获得连接对象conn(抛出异常即可)
            Connection conn=DriverManager.getConnection(url, user, password);
            //System.out.println("连接数据库成功");
            //生成一条mysql语句
            String sql="insert into plant_message(plant_name,img_big,img_s1,img_s2,img_s3,big_note) values('"+temp[0]+"','"+temp[1]+"','"+temp[2]+"','"+temp[3]+"','"+temp[4]+"','"+temp[5]+"')";   
            System.out.println(sql);
            Statement stmt=conn.createStatement();//创建一个Statement对象
            stmt.executeUpdate(sql);//执行sql语句
            System.out.println("插入到数据库成功");
            conn.close();
            System.out.println("关闭数据库成功");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }//
        catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    
}