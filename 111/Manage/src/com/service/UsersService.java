package com.service;

import java.util.List;

import com.beans.Users;

public interface UsersService {
	int login(Users users);
	int register(Users users);
	/*void Said(Message message);
	List<Message> getHistoryMessage(User user);
	int Adminlogin(User user);
	List<User >getAllUser();
	User getUserByName(User user);
	void updateUser(User user);
	void deleteUser(User user);*/
	//int login(Users users);
	/**
	 * 查找所有的用户
	 * @return
	 */
	List<Users> queryAllUsers();
}
