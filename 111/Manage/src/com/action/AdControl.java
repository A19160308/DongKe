package com.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.beans.Administrator;
import com.beans.Coach;
import com.beans.Equipment;
import com.beans.Message;
import com.beans.Users;
import com.service.AdService;
import com.service.OrderService;
import com.service.UsersService;
@Controller
@RequestMapping(value="/jsp")
public class AdControl {
	    @Autowired
		private  AdService adService;
	    @Autowired
	    private  OrderService orderService;
	    //----
		@RequestMapping("Adlogin")
		public @ResponseBody Map<String, Object> Adlogin(String adname,String adpassword,
				HttpServletRequest request){
		int flag=0;
		String status=null;
		Administrator administrator=new Administrator();
		administrator.setAdname(adname);
		administrator.setAdpasswd(adpassword); 
		flag=adService.login(administrator);
		if(flag==2){
			status="登陆成功";
			request.getSession().setAttribute("adname", adname);
			/*System.out.println(7777);*/
		}else if(flag==1){
			status="密码错误";
		}else{
			status="账号不存在";
		}
		 Map<String, Object> map=new HashMap<String, Object>();
		 map.put("status", status);
		 map.put("administrator", administrator); 
		return map;
	}
		/**
		 * 后台会员管理界面   增     删   改 ！！
		 */
		//--addusers
		@RequestMapping(value="/addusers")
		@ResponseBody public Map<String, Object> deleteEquipment(HttpServletRequest request){
			Map<String, Object> map=new HashMap<String, Object>();
			 map.put("status", "success");
			return map;		
		}
		
		//----
		@RequestMapping(value="/getAllUsers")
		@ResponseBody
		public Object getAllUsers(){
			List<Users> queryAllUsers = adService.queryAllUsers();
			Map<String, Object> map=new HashMap();
			map.put("dataList", queryAllUsers);
			return map;
		}
		@RequestMapping(value="/deleteUsers")
		@ResponseBody
		public Map<String, Object> deleteUsers(HttpServletRequest request){
			String useridStr=request.getParameter("userid");
			Integer userid=Integer.valueOf(useridStr);
			int i=adService.removeUser(userid);
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("userid", userid);	
			return map;
		}		
		@RequestMapping("/insertCoach")
		public @ResponseBody Map<String, Object> register(String coachname,String coachprice,String coachimgpath,
				HttpServletRequest request){
		int flag=0;
		String status=null;
		Integer coachpriceInt=Integer.valueOf(coachprice);
		Coach coach=new Coach();
		coach.setCoachname(coachname);
		coach.setCoachprice(coachpriceInt);
		coach.setCoachimgpath(coachimgpath);
		flag = adService.insertCoach(coach);
		if(flag==1){
			status="注册成功";	
		}else if(flag==0){
			status="账号已经被注册";
		}
		 Map<String, Object> map=new HashMap<String, Object>();
		 map.put("status", status);	
		return map;
		}
		
		
		@RequestMapping(value="/addcoach")
		@ResponseBody public Map<String, Object> addcoach(HttpServletRequest request){
			Map<String, Object> map=new HashMap<String, Object>();
			 map.put("status", "success");
			return map;
			
		}
		
		
		///----
		@RequestMapping("/modifyUser")		
	    public String editUser(Model model,HttpServletRequest request){
			String coachidStr=request.getParameter("coachid");
			Integer coachid=Integer.valueOf(coachidStr);  
	        Coach coach=orderService.queryOneCoach(coachid); 
	        model.addAttribute("coach", coach);
	        return "modifycoach";
	    }
		//编辑教练前先  把session设置好
		@RequestMapping("/modifyCoach")
		@ResponseBody
		public Map<String, Object> modifyCoach(String coachid,HttpServletRequest request){
			String coachidStr=request.getParameter("coachid");
			Integer coachidInt=Integer.valueOf(coachidStr);
			Coach coach=orderService.queryOneCoach(coachidInt);
	        HttpSession session = request.getSession();
	        session.setAttribute("coachid",coach.getCoachid());
			session.setAttribute("coachname",coach.getCoachname());
			session.setAttribute("coachprice",coach.getCoachprice());
			session.setAttribute("coachimgpath",coach.getCoachimgpath());
			Map<String, Object> map=new HashMap<String, Object>();
			 map.put("coach", coach);
			return map;
			
		}
		
		
		//编辑教练   1.先把原来那条删除  2.然后插入新的一条
		@RequestMapping("/insertcoach")
		public @ResponseBody Map<String, Object> insertCoach(String coachname,String coachprice,String coachimgpath,
				HttpServletRequest request){
		int flag=0;
		String status=null;
		Integer coachpriceInt=Integer.valueOf(coachprice);		
		//得到coachid  先删除表中原有数据
		Integer coachidStr=(Integer) request.getSession().getAttribute("coachid");
		//Integer coachidInt=Integer.parseInt(coachidStr);
		int i=orderService.remove(coachidStr);		
		//   再加入新修改的数据
		Coach coach=new Coach();
		coach.setCoachname(coachname);
		coach.setCoachprice(coachpriceInt);
		coach.setCoachimgpath(coachimgpath);
		flag = adService.insertCoach(coach);
		if(flag==1){
			status="注册成功";	
		}else if(flag==0){
			status="账号已经被注册";
		}
		 Map<String, Object> map=new HashMap<String, Object>();
		 map.put("status", status);	
		return map;
		}		
		@RequestMapping(value="/addep")
		@ResponseBody public Map<String, Object> addep(HttpServletRequest request){
			Map<String, Object> map=new HashMap<String, Object>();
			 map.put("status", "success");
			return map;			
		}
		//插入健身器材
		@RequestMapping("/insertEp")
		public @ResponseBody Map<String, Object> insertEp(String epname,String epprice,String epimgpath,
				HttpServletRequest request){
		int flag=0;
		String status=null;
		Integer eppriceInt=Integer.valueOf(epprice);
		Equipment equipment=new Equipment();
		equipment.setEpname(epname);
		equipment.setEpprice(eppriceInt);
		equipment.setEpimgpath(epimgpath);
		flag = adService.insertEp(equipment);
		if(flag==1){
			status="注册成功";	
		}else if(flag==0){
			status="账号已经被注册";
		}
		 Map<String, Object> map=new HashMap<String, Object>();
		 map.put("status", status);	
		return map;
		}
		//编辑器材前先  把session设置好
		@RequestMapping("/modifyEp")
		@ResponseBody
		public Map<String, Object> modifyEp(String epid,HttpServletRequest request){
			String epidStr=request.getParameter("epid");
			Integer epidInt=Integer.valueOf(epidStr);
			Equipment equipment=orderService.queryOneEp(epidInt);
	        HttpSession session = request.getSession();
	        session.setAttribute("epid",equipment.getEpid());
			session.setAttribute("epname",equipment.getEpname());
			session.setAttribute("epprice",equipment.getEpprice());
			session.setAttribute("epimgpath",equipment.getEpimgpath());
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("equipment", equipment);
			return map;
		}
		//编辑教练   1.先把原来那条删除  2.然后插入新的一条
		@RequestMapping("/insertep")
		public @ResponseBody Map<String, Object> insertep(String epname,String epprice,String epimgpath,
				HttpServletRequest request){
		int flag=0;
		String status=null;
		Integer eppriceInt=Integer.valueOf(epprice);
		
		//得到coachid  先删除表中原有数据
		Integer coachidStr=(Integer) request.getSession().getAttribute("epid");							
		int i=orderService.epremove(coachidStr);
		
		//   再加入新修改的数据
		Equipment equipment=new Equipment();
		equipment.setEpname(epname);
		equipment.setEpprice(eppriceInt);
		equipment.setEpimgpath(epimgpath);
		flag = adService.insertEp(equipment);
		if(flag==1){
			status="注册成功";	
		}else if(flag==0){
			status="账号已经被注册";
		}
		 Map<String, Object> map=new HashMap<String, Object>();
		 map.put("status", status);	
		return map;
		}
		
		
		
		@RequestMapping(value="/deleteMessage")
		@ResponseBody
		public Map<String, Object> deleteMessage(HttpServletRequest request){
			String messageidStr=request.getParameter("messageid");
			Integer messageid=Integer.valueOf(messageidStr);
			int i=adService.removeMessage(messageid);
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("messageid", messageid);	
			return map;
		}
	
			
		
		//更新message
		@RequestMapping(value="/modifyMessage")
		@ResponseBody
		public Map<String, Object> modifyMessage(String messageboard,HttpServletRequest request){
			String status=null;
			HttpSession session = request.getSession();
			Integer messageidStr=(Integer) session.getAttribute("messageid");
			Message message=new Message();
			message.setMessageboard(messageboard);
			message.setMessageid(messageidStr);
			int flag=adService.updateMessage(message);
			if(flag==1){
				status="注册成功";	
			}else if(flag==0){
				status="账号已经被注册";
			}
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("status",status);	
			return map;
		}
		//编辑器材前先  把session设置好
				@RequestMapping(value="/modifymessage")
				@ResponseBody
				public Map<String, Object> modifymessage(HttpServletRequest request){
					String messageidStr=request.getParameter("messageid");
					Integer messageidInt=Integer.valueOf(messageidStr);				
					Message message=orderService.queryOneMessage(messageidInt);
			        HttpSession session = request.getSession();
			        session.setAttribute("messageboard",message.getMessageboard());
			        session.setAttribute("messageid", messageidInt);
					Map<String, Object> map=new HashMap<String, Object>();
					map.put("messageboard", message.getMessageboard());
					return map;
				}
						
				
		

		
		
}	
		
		
		




