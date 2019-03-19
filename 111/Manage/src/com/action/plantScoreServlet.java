package com.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Paging;
import com.beans.plant_Message;
import com.beans.record;

public class plantScoreServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //得到成绩
    	List<record> list=new sql_getScore().sql_getScore();
        HttpSession session=request.getSession();
        int count =list.size();
        BigDecimal a=new BigDecimal("0");
        BigDecimal b=new BigDecimal("0");
        for(int i=0;i<count;i++){
        	String number=String.valueOf(list.get(i).getScore());
        	b=new BigDecimal(number);
        	a=a.add(b); 
        	
        }
        int stu_id=(int) session.getAttribute("stu_id");
        insertScore is=new insertScore();
        is.scoreInsert(stu_id,Double.valueOf(a.toString()));
        //我想在这里面设置到数据库表里面  stu表  里面写一个  植物成绩  
        //触发的情况下就去写进表里面
        System.out.println(a.toString());
        //将paging对象其设置在作用域中，以便后面页面调用
        session.setAttribute("plant_score", a.toString());
        request.setAttribute("score", a.toString());	        
        request.getRequestDispatcher("/jsp/scoreDisplay.jsp").forward(request, response); 	      
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }





}
