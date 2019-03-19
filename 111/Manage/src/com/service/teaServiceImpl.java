package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.plant_Message;
import com.beans.record;
import com.beans.stu_Message;
import com.beans.tea_Message;
import com.dao.teaDao;
@Service(value="teaServiceImpl")
public class teaServiceImpl implements teaService{
	@Autowired
	private teaDao teadao;

	@Override
	public int getBack(tea_Message tea) {
		//返回值
			if(null!=teadao.getTeaByName(tea)){
				if(null!=teadao.checkTeaPasswd(tea)){
					return 1;
				}else{
					//密码错误
					return 2;
				}
			}else{
				//该教师不存在
				return 0;
			}		
		// TODO Auto-generated method stub
	
		// TODO Auto-generated method stub
	}

	@Override
	public List<tea_Message> queryAllTea() {
		// TODO Auto-generated method stub
		 return teadao.selectAllTea();
	}

	@Override
	public int register(tea_Message tea) {
		if (teadao.getTeaByName(tea)!= null) {
			return 0;
		} else {
			teadao.addNewTea(tea);
			return 1;
		}
	}
	@Override
	public void deleteTea(Integer valueOf) {
		// TODO Auto-generated method stub
		teadao.deletetea(valueOf);
		
	}

	@Override
	public int insertTea(tea_Message tea) {
		// TODO Auto-generated method stub
		return teadao.editTea(tea);
	}

	@Override
	public List<plant_Message> queryAllPlant() {
		// TODO Auto-generated method stub
		return teadao.allPlant();
	}

	@Override
	public int backCompare(plant_Message plant) {
		if(null!=teadao.getPlantByName(plant)){
			
			return 1;
		}else{
			//表示找不到植物不存在
			return 0;
		}		

	}

	@Override
	public void setFlag(plant_Message plant) {
		teadao.setFlagDemo(plant);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setScore(plant_Message plant) {
		teadao.setPlantScore(plant);
		
	}

	@Override
	public void setRecord(record rd) {
		//判断现在有没有创建 有就更新
		if(null!=teadao.judgeNullRecord(rd)){
			//有了  直接更新
			teadao.updateRecord(rd);
		}else{
			//没有就直接创建
			teadao.setRecord(rd);
		}
		// TODO Auto-generated method stub		
	}
	@Override
	public List<record> getRecord(record rd) {
		// TODO Auto-generated method stub
		
		return teadao.getRecord(rd);
	}
	@Override
	public int judgeNullRecord(record rd) {
		//不是空代表是已经插入了 学生id 和题id
		if(null!=teadao.judgeNullRecord(rd)){
			//变成2
			teadao.setRecordFlag(rd);
			return 1;
		}else{
			//没有创建  此时创建就行
			teadao.insertRecord(rd);
			return 2;
		}
		
	}


	
	

}
