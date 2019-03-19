package com.action;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.beans.Paging;
import com.beans.plant_Message;

/**
 * 1:向数据库中添加数据
 * @author biexiansheng
 *
 */
public class sql_Select {
    public  List<plant_Message> sql_Select() {
    	 List<plant_Message> p_list=new ArrayList<>();
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
            String sql="select * from plant_message";   
            //System.out.println(sql);
            Statement stmt=conn.createStatement();//创建一个Statement对象
            ResultSet rs=stmt.executeQuery(sql);//执行查询，把查询结果赋值给结果集对象
            int plant_id,plant_score,plant_flag;
            String plant_name,img_big,img_s1,img_s2,img_s3,big_note,plant_text;
            int i=0;
            //List<plant_Message> p_list=new ArrayList<>();
            while(rs.next()){//遍历结果集
            	 plant_Message plant=new plant_Message();
            	plant_id=rs.getInt("plant_id");//获得id
            	plant_name=rs.getString("plant_name");//
            	img_big=rs.getString("img_big");//
            	img_s1=rs.getString("img_s1");//
            	img_s2=rs.getString("img_s2");//
            	img_s3=rs.getString("img_s3");
            	big_note=rs.getString("big_note");
            	plant_score=rs.getInt("plant_score");
            	plant_flag=rs.getInt("plant_flag");
            	plant_text=rs.getString("plant_text");
                //System.out.println(id+"\t"+username+"\t"+password+"\t"+age+"\t"+
            	plant.setPlant_id(plant_id);
            	//plant.setPlant_name(plant_name);
            	plant.setPlant_name(plant_name);
            	plant.setImg_big(img_big);
            	plant.setImg_s1(img_s1);
            	plant.setImg_s2(img_s2);
            	plant.setImg_s3(img_s3);
            	plant.setBig_note(big_note);
            	plant.setPlant_score(plant_score);
            	plant.setPlant_flag(plant_flag);
            	plant.setPlant_text(plant_text);
            	p_list.add(plant);
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