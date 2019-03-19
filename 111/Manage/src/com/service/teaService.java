package com.service;

import java.util.List;

import com.beans.plant_Message;
import com.beans.record;
import com.beans.stu_Message;
import com.beans.tea_Message;

public interface teaService {

	int getBack(tea_Message tea);

	List<tea_Message> queryAllTea();

	int register(tea_Message tea);

	void deleteTea(Integer valueOf);

	int insertTea(tea_Message tea);

	List<plant_Message> queryAllPlant();


	int backCompare(plant_Message plant);

	void setFlag(plant_Message plant);

	void setScore(plant_Message plant);

	void setRecord(record rd);

	List<record> getRecord(record rd);

	int judgeNullRecord(record rd);


}
