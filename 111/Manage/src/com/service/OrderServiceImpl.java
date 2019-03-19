package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.Coach;
import com.beans.Equipment;
import com.beans.Message;
import com.beans.ShoppingCar;
import com.dao.OrderDao;

@Service(value="orderServiceImpl")
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDao orderDao;
	@Override
	public List<Coach> queryAllCoach() {
		return orderDao.selectAllCoach();
	}
	@Override
	public int remove(Integer coachid) {
		return orderDao.deleteCoach(coachid);
	}
	@Override
	public List<Equipment> queryAllEp(){
		return orderDao.selectAllEp();
	}
	@Override
	public int epremove(Integer epid){
		return orderDao.deleteEquipment(epid);
		
	}
	@Override
	public List<Message> queryAllMessage(){
		return orderDao.selectAllMessage();
	}
	@Override
	public void insertmessage(String messageboard, String messageusername){
		 orderDao.insertAllMessage(messageboard,messageusername);
	}
//----插入购物车
	@Override
	public void insertShopcar(Integer coachid) {
		// TODO Auto-generated method stub
		//先写一个根据coachid  查找到整条数据的方法
		Coach coach=queryOneCoach(coachid);
		orderDao.insertShopcarByCoach(coach);
	}
	@Override
	public Coach queryOneCoach(Integer coachid){
		return orderDao.selectOneCoach(coachid);
	}
//-----
	
	
	
	//-----
	@Override
	public void insertShopcarEp(Integer epid) {
		// TODO Auto-generated method stub
		Equipment equipment=queryOneEp(epid);
		orderDao.insertShopcarByEp(equipment);
	}
	@Override
	public Equipment queryOneEp(Integer epid){
		return orderDao.selectOneEp(epid);
	}
	
	
/*	public void insertShopcar(Integer coachid){
		
		
		
	}*/
	@Override
	public Message queryOneMessage(Integer messageidInt){
		return orderDao.selectOneMessage(messageidInt);
	}

	@Override
	public List<ShoppingCar> queryAllShoppingCar() {
		// TODO Auto-generated method stub
		return orderDao.selectAllShoppingCar();
	}

	@Override
	public int removeshopcar(String shopcarname) {
		// TODO Auto-generated method stub
		return orderDao.deleteShopcar(shopcarname);
	}
	@Override
	public
	List<ShoppingCar> queryOneshopcar(String shopcarname){
		return orderDao.selectOneShoppingCar(shopcarname);
	}
	@Override
	public
	int deleteOneshopcar(String shopcarname){
		return orderDao.removeshopcar(shopcarname);
		
	}

}
