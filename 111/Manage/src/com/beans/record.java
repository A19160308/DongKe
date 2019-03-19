package com.beans;

public class record {
	private int record_flag;
	public int getRecord_flag() {
		return record_flag;
	}
	public void setRecord_flag(int record_flag) {
		this.record_flag = record_flag;
	}
	private int record_id;
	public int getRecord_id() {
		return record_id;
	}
	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}
	public int getStu_id() {
		return stu_id;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public int getPlant_id() {
		return plant_id;
	}
	public void setPlant_id(int plant_id) {
		this.plant_id = plant_id;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getScore_text() {
		return score_text;
	}
	public void setScore_text(String score_text) {
		this.score_text = score_text;
	}
	public int getFinal_flag() {
		return final_flag;
	}
	public void setFinal_flag(int final_flag) {
		this.final_flag = final_flag;
	}
	private int stu_id;
	private int plant_id;
	private double score;
	private String score_text;
	private int final_flag;

}
