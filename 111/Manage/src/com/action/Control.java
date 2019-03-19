package com.action;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beans.Users;
import com.service.UsersService;

@Controller
@RequestMapping(value="/jsp")
public class Control {
  //登陆 
    @Autowired
	private  UsersService usersService;	
	/*@RequestMapping("/login")
	public @ResponseBody Map<String, Object> login(String username,String userpassword,
			HttpServletRequest request){
	int flag=0;
	String status=null;
	Users users=new Users();
	users.setUsername(username);
	users.setUserpasswd(userpassword); 
	flag=usersService.login(users);
	if(flag==2){
		status="登陆成功";
		HttpSession session = request.getSession();
		session.setAttribute("username", username);
	}else if(flag==1){
		status="密码错误";
	}else{
		status="账号不存在";
	}
	 Map<String, Object> map=new HashMap<String, Object>();
	 map.put("status", status);
	 map.put("user", users); 
	return map;
}*/
//注册
@RequestMapping("RegisterUser")
	public @ResponseBody Map<String, Object> register(String username,String userpassword,
			HttpServletRequest request){
	int flag=0;
	String status=null;
	Users users=new Users();
	users.setUsername(username);
	users.setUserpasswd(userpassword);
	flag=usersService.register(users);
	if(flag==1){
		status="注册成功";	
	}else if(flag==0){
		status="账号已经被注册";
	}
	System.out.println(status);
	 Map<String, Object> map=new HashMap<String, Object>();
	 map.put("status", status);	
	return map;
	}

public UsersService getUsersService() {
	return usersService;
}

public void setUsersService(UsersService usersService) {
	this.usersService = usersService;
}

		
}
	
