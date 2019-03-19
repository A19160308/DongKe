package com.dao;

import java.util.List;

import com.beans.Administrator;
import com.beans.Coach;
import com.beans.Equipment;
import com.beans.Message;
import com.beans.Users;


public interface AdDao {
	Administrator getAdByName(Administrator administrator);
	Administrator checkAdPassword(Administrator administrator);
	List<Users> selectAllUsers();
	int deleteUsers(Integer userid);
	//void addNewCoach(Coach coach);
	void addNewCoach(Coach coach);
	void addNewEp(Equipment equipment);
	void deleteMessage(Integer messageid);
	void modifyMessage(Message message);

}
