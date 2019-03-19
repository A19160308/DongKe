package com.service;

import java.util.List;

import com.beans.stu_Message;

public interface stuService {

	int getBack(stu_Message stu);

	List<stu_Message> queryAllStu();

	int register(stu_Message stu);

	void deleteStu(Integer stu_id);

	int insertStu(stu_Message stu);


	void insertRecord(stu_Message stu);

	int getID(stu_Message stu);

}
