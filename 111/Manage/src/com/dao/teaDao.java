package com.dao;

import java.util.List;

import com.beans.plant_Message;
import com.beans.record;
import com.beans.stu_Message;
import com.beans.tea_Message;

public interface teaDao {

	Object getTeaByName(tea_Message tea);

	Object checkTeaPasswd(tea_Message tea);

	List<tea_Message> selectAllTea();

	void addNewTea(tea_Message tea);

	void deletetea(Integer valueOf);

	int editTea(tea_Message tea);

	List<plant_Message> allPlant();

	Object getPlantByName(plant_Message plant);

	void setPlantScore(plant_Message plant);

	void setFlagDemo(plant_Message plant);

	void setRecord(record rd);

	List<record> getRecord(record rd);

	Object judgeNullRecord(record rd);

	void setRecordFlag(record rd);

	void insertRecord(record rd);

	void updateRecord(record rd);

}
