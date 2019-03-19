package com.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Paging;
import com.beans.plant_Message;

public class Test_ListDemoServlet extends HttpServlet{
	    private static final long serialVersionUID = 1L;
	       
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
	        List<plant_Message> list=new sql_Select().sql_Select();
	     
	        //默认页面当前页
	        int page=0;
	        //得到传过来的当前页
	        String str_page=request.getParameter("page");
	       // System.out.println(str_page);
	        int count=list.size();	 	       
	        /**
	         * 创建分页的关于一些内容的工具bean
	         * 
	         * */
	        Paging paging=new Paging();
	        paging.setList(list);//从数据库得到数据存入的list集合
	        paging.setCount();//数据总数
	        paging.setPagesize(5);//一个页面的数据多少条
	        paging.setPagenumber();//总的页面数
	        paging.setEndpage();//最后一页                                         	        
	        paging.setIndexpage(1);//第一页
	        if (str_page!=null) {
	            //将页转换整型判断其大小
	            int pag=Integer.parseInt(str_page);	           
	            //当大于零，将传过来的pag值赋给当前页page
	            if (pag>=0) {
	                page=pag;
	                //如果小于最大值时则，将其传过来的值减1在赋值给当前页，让其一直在最后一页
	                if (pag>(paging.getPagenumber()-1)) {
	                    page=pag-1;
	                }
	            }
	        }
	        paging.setPage(page);//最终确认当前页
	        List<plant_Message> list_page =new ArrayList<>();
	        //将当前页的值传给新的list_page集合中，list集合是全部数据综合，用i调用其中的几条数据给list_page
	        for (int i = paging.getPage()*paging.getPagesize(); i <(paging.getPage()+1)*paging.getPagesize()&&i<list.size(); i++) {
	            list_page.add(list.get(i));
	        }	
	        System.out.println(paging.getPagenumber());
	        //将paging对象其设置在作用域中，以便后面页面调用
	        request.setAttribute("paging", paging);	        
	        request.setAttribute("list", list_page);
	        request.setAttribute("nowPage",page );
	       /* Map<String, Object> map=new HashMap();
			map.put("list", list_page);*/
	        request.getRequestDispatcher("/jsp/fenyeDemo.jsp").forward(request, response); 	      
	    }
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // TODO Auto-generated method stub
	        doGet(request, response);
	    }

	

}
