package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.stu_Message;
import com.dao.stuDao;
import com.dao.teaDao;

@Service(value="stuServiceImpl")
public class stuServiceImpl implements stuService{	
	@Autowired
	private stuDao studao;
	@Override
	public int getBack(stu_Message stu) {
		System.out.println("测试");
		System.out.println(stu.getStu_password()+stu.getStu_name());
		//返回值
		//如果是1 学生  如果是2  老师	
			if(null!=studao.getStuByName(stu)){
				if(null!=studao.checkStuPasswd(stu)){
					return 1;
				}else{
					//密码错误
					return 2;
				}
			}else{
				//该学生不存在
				return 0;
			}		
		// TODO Auto-generated method stub
	}
	@Override
	public List<stu_Message> queryAllStu() {
		// TODO Auto-generated method stub
		return studao.selectAllStu();
	}
	@Override
	public int register(stu_Message stu) {
		if (studao.getStuByName(stu)!= null) {
			return 0;
		} else {
			studao.addNewStu(stu);
			return 1;
		}
	}
	@Override
	public void deleteStu(Integer stu_id) {
		studao.deletestu(stu_id);
		// TODO Auto-generated method stub
		
	}
	@Override
	public int insertStu(stu_Message stu) {
		studao.updateStu(stu);
		// TODO Auto-generated method stub
		return 1;
	}
	@Override
	public void insertRecord(stu_Message stu) {
		//创建一个新的表
		studao.insertRecord(stu);	
	}
	@Override
	public int getID(stu_Message stu) {		
		// 查找id
		return studao.getID(stu);
	}

}
