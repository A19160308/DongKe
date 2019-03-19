package com.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beans.Administrator;
import com.beans.Coach;
import com.beans.Equipment;
import com.beans.Message;
import com.beans.ShoppingCar;
import com.beans.Users;
import com.service.OrderService;
import com.service.UsersService;

@Controller
@RequestMapping(value="/jsp")
public class Order {
	@Autowired
	private OrderService orderService;	
	@RequestMapping(value="/getAllCoach")
	@ResponseBody
	public Object getAllUsers(){
		List<Coach> queryAllCoach = orderService.queryAllCoach();
		System.out.println(queryAllCoach);
		Map<String, Object> map=new HashMap();
		map.put("dataList", queryAllCoach);
		return map;
	}
	
	@RequestMapping(value="/getAllShoppingCar")
	@ResponseBody
	public Object getAllShopcar(){
		List<ShoppingCar> queryAllShoppingCar = orderService.queryAllShoppingCar();
		Map<String, Object> map=new HashMap();
		map.put("dataList", queryAllShoppingCar);
		return map;
	}
	
	
	
	//直接删除coach  管理员模式
	@RequestMapping(value="/adDeleteCoach")
	@ResponseBody
	public Object adDeleteCoach(HttpServletRequest request){
		String coachidStr=request.getParameter("coachid");
		Integer coachid=Integer.valueOf(coachidStr);
		int i=orderService.remove(coachid);
		Map<String, Object> map=new HashMap();
		map.put("success","123456789");
		return map;			 
	}
	//直接删除dingdan   管理员模式
	@RequestMapping(value="/adDeleteShoppingCar")
	@ResponseBody
	public Object adDeleteShoppingCar(HttpServletRequest request){
		String shopcarname=request.getParameter("shopcarname");
		int i=orderService.removeshopcar(shopcarname);
		Map<String, Object> map=new HashMap();
		map.put("success","123456789");
		return map;		
	}
	
	
	//先加入购物车  然后删除  会员模式
	@RequestMapping(value="/deleteCoach")
	@ResponseBody
	public Map<String, Object> deleteCoach(HttpServletRequest request){
		String coachidStr=request.getParameter("coachid");
		Integer coachid=Integer.valueOf(coachidStr);
		//先插到shoppingcar数据库里面
		orderService.insertShopcar(coachid);
		//在执行删除
		int i=orderService.remove(coachid);	 
		Map<String, Object> map=new HashMap();
		map.put("i",i);
		return map;
		
	}
	@RequestMapping(value="/getAllEp")
	@ResponseBody
	public Object getAllEp(){
		List<Equipment> queryAllEp = orderService.queryAllEp();
		Map<String, Object> map=new HashMap();
		map.put("dataList", queryAllEp);
		return map;		
	} 
	@RequestMapping(value="/deleteEquipment")
	@ResponseBody
	public Map<String, Object> deleteEquipment(HttpServletRequest request){
		String epidStr=request.getParameter("epid");
		 Integer epid=Integer.valueOf(epidStr);
		 orderService.insertShopcarEp(epid);
		 int i=orderService.epremove(epid);
		 Map<String, Object> map=new HashMap();
		 map.put("i",i);
		 return map;
	}
	
	
	@RequestMapping(value="/getAllMessage")
	@ResponseBody
	public Object getAllMessage(){
		List<Message> queryAllMessage = orderService.queryAllMessage();
		Map<String, Object> map=new HashMap();
		map.put("dataList", queryAllMessage);
		return map;
	}
	
	
	@RequestMapping(value="/writeMessage")
	public @ResponseBody Map<String, Object> Adlogin(String messageboard,
			HttpServletRequest request){		
	int flag=0;
	String status=null;
	String messageusername;
	messageusername=(String) request.getSession().getAttribute("username");
	Message message=new Message();
	message.setMessageboard(messageboard);
	orderService.insertmessage(messageboard,messageusername);
	Map<String, Object> map=new HashMap<String, Object>();
	map.put("messageboard", messageboard); 
	return map;
}
	
	//直接删除ep  管理员模式
		@RequestMapping(value="/adDeleteEp")
		@ResponseBody
		public Object adDeleteEp(HttpServletRequest request){
			String epidStr=request.getParameter("epid");
			Integer epid=Integer.valueOf(epidStr);
			int i=orderService.epremove(epid);
			Map<String, Object> map=new HashMap();
			map.put("success","123456789");
			return map;				 
		}
		//单个支付
		@RequestMapping(value="/payShopping")
		@ResponseBody
		public Map<String, Object> payShopping(HttpServletRequest request){
			String shopcarname=request.getParameter("shopcarname");
			//Integer shopcarprice=Integer.valueOf(coachidStr);
			/*	//先插到shoppingcar数据库里面
			orderService.insertShopcar(coachid);
			//在执行删除
			int i=orderService.remove(coachid);*/	
			int i=orderService.deleteOneshopcar(shopcarname);
			Map<String, Object> map=new HashMap();
			map.put("datalist",i);
			return map;			
		}
	                
}














