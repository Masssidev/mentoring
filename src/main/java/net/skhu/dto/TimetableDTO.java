package net.skhu.dto;

public class TimetableDTO {

	int id;
	int day;
	int time;
	int time_apply_id;
	int time_user_id;
	String name;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getTime_apply_id() {
		return time_apply_id;
	}
	public void setTime_apply_id(int time_apply_id) {
		this.time_apply_id = time_apply_id;
	}
	public int getTime_user_id() {
		return time_user_id;
	}
	public void setTime_user_id(int time_user_id) {
		this.time_user_id = time_user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


}
