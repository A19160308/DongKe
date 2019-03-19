package com.service;

import java.util.List;

import com.beans.Coach;
import com.beans.Equipment;
import com.beans.Message;
import com.beans.ShoppingCar;

public interface OrderService {

	List<Coach> queryAllCoach();
	 //Coach queryallcoach();
	/**
	 * 删除
	 * @param coachid
	 * @return
	 */
	int remove(Integer coachid);
	List<Equipment> queryAllEp();
	/**
	 * 预定（删除）equipment
	 * @param epid
	 * @return
	 */
	int epremove(Integer epid);
	/**
	 * 查找留言板
	 * @return
	 */
	List<Message> queryAllMessage();
	/**
	 * 插入留言板
	 * @param messageboard
	 */
	
	void insertmessage(String messageboard, String messageusername);
	
	
	/**
	 * 插入购物车
	 * @param coachid
	 */
	void insertShopcar(Integer coachid);
	/**
	 * 查询预定的教练数据
	 * @return
	 */
	Coach queryOneCoach(Integer coachid);
	/**
	 * 查询预定的器材数据
	 * @param epid
	 */
	void insertShopcarEp(Integer epid);
	Equipment queryOneEp(Integer epid);
	/*
	 * 查询一条留言
	 */
	Message queryOneMessage(Integer messageidInt);
	List<ShoppingCar> queryAllShoppingCar();
	int removeshopcar(String shopcarname);
	List<ShoppingCar> queryOneshopcar(String shopcarname);
	int deleteOneshopcar(String shopcarname);
	
	
	

}
