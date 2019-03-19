package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.Administrator;
import com.beans.Coach;
import com.beans.Equipment;
import com.beans.Message;
import com.beans.Users;
import com.dao.AdDao;

@Service(value="AdServiceImpl")
public class AdServiceImpl implements AdService{


	@Autowired
	private AdDao adDao;
	
	@Override	
    public int login(Administrator administrator) {
		if(null!=adDao.getAdByName(administrator)){
			if(null!=adDao.checkAdPassword(administrator)){
				return 2;
			}else{
				return 1;
			}
			
		}else return 0;
	}
	@Override
	public List<Users> queryAllUsers(){
		return adDao.selectAllUsers();
	}
	@Override
	public int removeUser(Integer userid){
		return adDao.deleteUsers(userid);
	}
	@Override
	public int insertCoach(Coach coach) {
		// TODO Auto-generated method stub
		 adDao.addNewCoach(coach);
		 return 1;
	}
	@Override
	public int insertEp(Equipment equipment) {
		// TODO Auto-generated method stub
		adDao.addNewEp(equipment);
		return 1;
	}
	@Override
	public int removeMessage(Integer messageid) {
		// TODO Auto-generated method stub
		adDao.deleteMessage(messageid);
		return 1;
	} 
	@Override
	public int updateMessage(Message message){
		adDao.modifyMessage(message);
		return 1;
	}
	

}
