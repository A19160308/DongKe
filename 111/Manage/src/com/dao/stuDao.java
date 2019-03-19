package com.dao;

import java.util.List;

import com.beans.stu_Message;

public interface stuDao {

	stu_Message getStuByName(stu_Message stu);

	stu_Message checkStuPasswd(stu_Message stu);

	List<stu_Message> selectAllStu();	
//Object getUserByName(stu_Message stu);
//void addNewUser(stu_Message stu);
	void addNewStu(stu_Message stu);

	Object selectStuByName(stu_Message stu);

	void deletestu(Integer stu_id);

	void updateStu(stu_Message stu);

	void insertRecord(stu_Message stu);

	int getID(stu_Message stu);



}
