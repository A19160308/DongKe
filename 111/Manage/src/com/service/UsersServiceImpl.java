package com.service;

import java.util.List;
import com.dao.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.Users;

@Service("usersServiceImpl")
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDao usersDao;

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}
	/*
	 * @Override public List<Users> getAllUsers() { return
	 * usersDao.selectAllUsers(); }
	 */

	// 登陆
	@Override
	public int login(Users users) {
		System.out.println(users);
		// Users userByName = usersDao.getUserByName(users);
		// System.out.println("login---"+userByName);
		if (null != usersDao.getUserByName(users)) {
			if (null != usersDao.checkPassword(users)) {
				return 2;
			} else {
				return 1;
			}
		} else
			return 0;
	}

	// 注册
	@Override
	public int register(Users users) {
		if (usersDao.getUserByName(users) != null) {
			return 0;
		} else {
			usersDao.addNewUser(users);
			return 1;
		}
	}

	@Override
	public List<Users> queryAllUsers() {
		return usersDao.selectAllUsers();
	}

}
