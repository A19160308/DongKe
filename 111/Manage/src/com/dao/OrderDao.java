package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.beans.Coach;
import com.beans.Equipment;
import com.beans.Message;
import com.beans.ShoppingCar;

@Mapper
public interface OrderDao {
	/**
	 * 查找所有的coach
	 * @return
	 */
	List<Coach> selectAllCoach();
	/**
	 * 删除
	 * @param coachid
	 * @return
	 */
	int deleteCoach(Integer coachid);
	/**
	 * 查找所有的equipment
	 * @return
	 */
	List<Equipment> selectAllEp();
	/**
	 * 删除ep
	 * @param epid
	 * @return
	 */
	int deleteEquipment(Integer epid);
	/**
	 * 查找
	 * @return
	 */
	List<Message> selectAllMessage();
	/**
	 * cha
	 * @param messageboard
	 * @param messageusername
	 */
	void insertAllMessage(@Param("messageboard")String messageboard, @Param("messageusername")String messageusername);
	
	
	//--
	Coach selectOneCoach(Integer coachid);
	void insertShopcarByCoach(Coach coach);
//--
	Equipment selectOneEp(Integer epid);
	void insertShopcarByEp(Equipment equipment);
	Message selectOneMessage(Integer messageidInt);
	List<ShoppingCar> selectAllShoppingCar();
	int deleteShopcar(String shopcarname);
	List<ShoppingCar> selectOneShoppingCar(String shopcarname);
	void deOneShoppingCar(String shopcarname);
	int removeshopcar(String shopcarname);
	
	

}
