package com.beans;

public class stu_Message {
	private String stu_name;
	private String stu_password;
	private int stu_score;
	private int flag;
	private int stu_id;
	public int getStu_id() {
		return stu_id;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_password() {
		return stu_password;
	}
	public void setStu_password(String stu_password) {
		this.stu_password = stu_password;
	}
	public int getStu_score() {
		return stu_score;
	}
	public void setStu_score(int stu_score) {
		this.stu_score = stu_score;
	}
}
