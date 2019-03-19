package com.action;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.javassist.bytecode.stackmap.MapMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beans.Equipment;
import com.beans.Message;
import com.beans.Users;
import com.beans.plant_Message;
import com.beans.record;
import com.beans.stu_Message;
import com.beans.tea_Message;
import com.service.UsersService;
import com.service.stuService;
import com.service.teaService;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@Controller
@RequestMapping(value="/plant")
public class plantControl {
	@Autowired
	private stuService stuservice;
	@Autowired
	private teaService teaservice;
	@RequestMapping(value="/loginPlant")
	public @ResponseBody Map<String,Object> login(String name,String password,Integer flag,
			HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();
		HttpSession session=request.getSession();
		int temp;//用来存储现返回的值  来判断页面向那个方向跳转
		//flag 1  学生，flag 2 老师	
		int stu_id;
		if(flag==1){
			//此时为学生
			stu_Message stu=new stu_Message();
			stu.setStu_name(name);
			stu.setStu_password(password);
			stu.setFlag(flag);		
			stu_id=stuservice.getID(stu);
			session.setAttribute("stu_name", name);
			session.setAttribute("stu_id",stu_id);
			temp=stuservice.getBack(stu);
		}else{
			tea_Message tea=new tea_Message();
			tea.setTea_name(name);
			tea.setTea_password(password);
			tea.setFlag(flag);
			session.setAttribute("tea_name", name);
			temp=teaservice.getBack(tea);			
		}		
		map.put("status",temp);
		map.put("flag",flag);
		return map;
	}
	@RequestMapping(value="/getAllStu")
	@ResponseBody
	public Object getAllStu(){
		//返回stu对象的列表		
		List<stu_Message> queryAllStu = stuservice.queryAllStu();
		Map<String, Object> map=new HashMap();
		map.put("dataList", queryAllStu);
		System.out.println(queryAllStu);
		System.out.println("变得优秀起来？");
		return map;
	}
	//注册 就是新增添
	@RequestMapping(value="registerStu")
	public @ResponseBody Map<String, Object> registerStu(String username,String userpassword,
			HttpServletRequest request){
	int flag=0;
	int status=0;//判断状态
	stu_Message stu=new stu_Message();
	stu.setStu_name(username);
	stu.setStu_password(userpassword);
	flag=stuservice.register(stu);
	if(flag==1){
		status=1;	
	}else if(flag==0){
		status=0;
	}
	 Map<String, Object> map=new HashMap<String, Object>();
	 map.put("status", status);	
	return map;
	}
	@RequestMapping(value="/addStu")
	@ResponseBody public Map<String, Object> deleteEquipment(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		 map.put("status", "success");
		return map;		
	}
	@RequestMapping(value="/deleteStu")
	@ResponseBody
	public Map<String,Object> deleteStu(HttpServletRequest request){
		String stu_name=request.getParameter("stu_id");
		stuservice.deleteStu(Integer.valueOf(stu_name));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("status", "success");
		return map;	
	}
	@RequestMapping(value="/editStu")
	public @ResponseBody Map<String, Object> editStu(
			HttpServletRequest request){
		String stu_id=request.getParameter("stu_id");
		HttpSession session=request.getSession();
		session.setAttribute("stu_id",Integer.valueOf(stu_id));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("status", "success");
		return map;	
	} 
	@RequestMapping("/insertStu")
	public @ResponseBody Map<String, Object> insertEp(String epname,String epprice,String epimgpath,
			HttpServletRequest request){
	//int flag=0;
	int status=0;
	HttpSession session=request.getSession();
	stu_Message stu=new stu_Message();	
	stu.setStu_name(epname);
	stu.setStu_password(epprice);
	stu.setStu_score(Integer.valueOf(epimgpath));
	stu.setStu_id((int) session.getAttribute("stu_id"));
	status = stuservice.insertStu(stu);
	 Map<String, Object> map=new HashMap<String, Object>();
	 map.put("status", status);	
	return map;
	}
	//编辑器材前先  把session设置好
	@RequestMapping(value="/getAllTea")
	@ResponseBody
	public Object getAllTea(){
		//返回stu对象的列表
		List<tea_Message> queryAllStu = teaservice.queryAllTea();
		Map<String, Object> map=new HashMap();
		map.put("dataList", queryAllStu);
		return map;
	}
	@RequestMapping(value="/addTea")
	@ResponseBody public Map<String, Object> addTea(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		 map.put("status", "success");
		return map;		
	}
	@RequestMapping(value="registerTea")
	public @ResponseBody Map<String, Object> registerTea(String username,String userpassword,
			HttpServletRequest request){
	int flag=0;
	int status=0;//判断状态
	tea_Message tea=new tea_Message();
	tea.setTea_name(username);
	tea.setTea_password(userpassword);
	flag=teaservice.register(tea);
	if(flag==1){
		status=1;	
	}else if(flag==0){
		status=0;
	}
	 Map<String, Object> map=new HashMap<String, Object>();
	 map.put("status", status);	
	return map;
	}
	//删除教师
	@RequestMapping(value="/deleteTea")
	@ResponseBody
	public Map<String,Object> deleteTea(HttpServletRequest request){
		String stu_name=request.getParameter("tea_id");
		teaservice.deleteTea(Integer.valueOf(stu_name));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("status", "success");
		return map;	
	}
	@RequestMapping(value="/editTea")
	public @ResponseBody Map<String, Object> editTea(
			HttpServletRequest request){
		String stu_id=request.getParameter("tea_id");
		HttpSession session=request.getSession();
		session.setAttribute("tea_id",Integer.valueOf(stu_id));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("status", "success");
		return map;	
	} 
	//编辑教师
	@RequestMapping("/insertTea")
	public @ResponseBody Map<String, Object> insertTea(String epname,String epprice,
			HttpServletRequest request){
	//int flag=0;
	int status=0;
	HttpSession session=request.getSession();
	tea_Message tea=new tea_Message();	
	tea.setTea_name(epname);
	tea.setTea_password(epname);
	tea.setTea_id((int) session.getAttribute("tea_id"));
	status = teaservice.insertTea(tea);	
	 Map<String, Object> map=new HashMap<String, Object>();
	 map.put("status", status);	
	return map;
	}
	@RequestMapping(value="/getAllNewplant")
	//提示  之后的展示
	public @ResponseBody Map<String, Object> getAllNewplant(String id,String page,
			HttpServletRequest request){	
		HttpSession session=request.getSession();
		int stu_id=(int) session.getAttribute("stu_id");
		//先看看有没有 stu_id plant_id 没有就插入  有的话就update
		record rd=new record();
		rd.setPlant_id(Integer.valueOf(id));		
		rd.setStu_id(stu_id);
		rd.setRecord_flag(2);
		//插入  判断在service里面写
		int temp=0;
		temp=teaservice.judgeNullRecord(rd);
		//用来判断插入
		plant_Message plant=new plant_Message();
		plant.setPlant_id(Integer.valueOf(id));
		plant.setPlant_flag(2);
		teaservice.setFlag(plant);
		//选出所有的东西  根据stu_id
		List<record> recordList=teaservice.getRecord(rd);
		int size=recordList.size();
		List<plant_Message> queryAllMessage = new pageServletDemo().myTest(page);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("dataList", queryAllMessage);
		map.put("record", recordList);
		map.put("size", size);
		return map;
	}
	@RequestMapping(value="/getAllplant")
	//最刚开始的展示
	public @ResponseBody Map<String, Object> getAllplant(String page,
			HttpServletRequest request){
		//选出所有的东西
		//System.out.println(page);
		List<plant_Message> queryAllMessage = new pageServletDemo().myTest(page);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("dataList", queryAllMessage);
		//System.out.println(queryAllMessage.get(0).getImg_big());
		return map;
	}
	@RequestMapping(value="/errorDisplay")
	//只显示错误的信息
	public @ResponseBody Map<String, Object> errorDisplay(
			HttpServletRequest request){
		//选出所有的东西
		HttpSession session=request.getSession();
		int stu_id=(int) session.getAttribute("stu_id");
		record rd=new record();
		rd.setStu_id(stu_id);
		List<plant_Message> queryAllMessage = teaservice.queryAllPlant();
		List<record> recordList=teaservice.getRecord(rd);
		int size=recordList.size();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("record", recordList);	
		map.put("dataList", queryAllMessage);
		map.put("size", size);
		return map;
	}
	@RequestMapping(value="/jumpPage")
	//最刚开始的展示
	public @ResponseBody Map<String, Object> jumpPage(
			HttpServletRequest request){
		HttpSession session=request.getSession();
		int stu_id=(int) session.getAttribute("stu_id");
		record rd=new record();
		//List<plant_Message> queryAllMessage = teaservice.queryAllPlant();
		List<record> recordList=teaservice.getRecord(rd);
		Map<String, Object> map=new HashMap<String, Object>();
		//循环
		int length=recordList.size();
		int flag=0;
		for(int i=0;i<length;i++){
			if(recordList.get(i).getFinal_flag()==0){				
				flag=1;
				break;
			}			
		}
		if(flag==0){
			map.put("status",1);
		}else{
			map.put("status",0);
		}
		return map;
	}
	@RequestMapping(value="/getCompare")
	public @ResponseBody Map<String, Object> getCompare(String id,String answer,String flag,String page,
			HttpServletRequest request){	
		plant_Message plant=new plant_Message();
		HttpSession session=request.getSession();
		int stu_id=(int) session.getAttribute("stu_id");
		record rd=new record();
		rd.setStu_id(stu_id);
		rd.setPlant_id(Integer.valueOf(id));
		plant.setPlant_name(answer);
		plant.setPlant_id(Integer.valueOf(id));
		System.out.println(flag);
		int falg1=Integer.valueOf(flag);	
		int temp=0;
		//判断返回值
		temp=teaservice.backCompare(plant);
		Map<String, Object> map=new HashMap<String, Object>();
		if(temp==1){
			//则表示现在存在  植物名称  答对了
			if(falg1==1){
				plant.setPlant_score(1);
				plant.setPlant_text("1");
				plant.setPlant_final(1);
				rd.setScore(1);
				rd.setScore_text("1");
				rd.setFinal_flag(1);				
			}else {
				plant.setPlant_score(0.9);
				plant.setPlant_text("0.9");
				plant.setPlant_final(1);
				rd.setScore(0.9);
				rd.setScore_text("0.9");
				rd.setFinal_flag(1);	
			}
			teaservice.setScore(plant);
			teaservice.setRecord(rd);
						
		}else{
			plant.setPlant_score(0);
			plant.setPlant_text("0");
			plant.setPlant_final(2);
			rd.setScore(0);
			rd.setScore_text("0");
			rd.setFinal_flag(2);
			teaservice.setRecord(rd);
			teaservice.setScore(plant);			
		}
		//从句记录中取得成绩
		List<record> recordList=teaservice.getRecord(rd);
		int size=recordList.size();
		//这一句很关键啊
		List<plant_Message> queryAllMessage = new pageServletDemo().myTest(page);
		map.put("dataList", queryAllMessage);
		map.put("record", recordList);
		map.put("size", size);
		return map;
	}
}
