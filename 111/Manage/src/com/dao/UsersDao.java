package com.dao;
import java.util.List;

import com.beans.Users;

public interface UsersDao {
/* List<Users> selectAllUsers();*/
	Users getUserByName(Users users);
	Users checkPassword(Users users);
	void addNewUser(Users users);
	/*void insertUserSaid(Message message);
	List<Message> findHistoryMessageByUser(User user);
	User getAdmin(User user);
	List<User> findAllUser();
	User findUserByName(User user);
	void modifyUser(User user);
	void moveUser(User user);*/
	/**
	 * 查找所以的用户
	 * @return
	 */
	List<Users> selectAllUsers();
	
}


