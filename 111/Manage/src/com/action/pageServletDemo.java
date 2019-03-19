package com.action;

import java.util.ArrayList;
import java.util.List;

import com.beans.Paging;
import com.beans.plant_Message;

public class pageServletDemo {
	public List<plant_Message> myTest(String str_page){
		List<plant_Message> list=new sql_Select().sql_Select();	     
        //页面当前页
        int page=0;
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
        return list_page;     
	}

}
