package com.service;

import java.util.List;

import com.beans.Administrator;
import com.beans.Coach;
import com.beans.Equipment;
import com.beans.Message;
import com.beans.Users;

public interface AdService {
	int login(Administrator administrator);

	List<Users> queryAllUsers();

	//删除user  管理员界面
	int removeUser(Integer userid);
//  插入一个教练
	int insertCoach(Coach coach);

//  插入一个教练
	int insertEp(Equipment equipment);
//删除message
	int removeMessage(Integer messageid);
//更新message


	int updateMessage(Message message);

}
